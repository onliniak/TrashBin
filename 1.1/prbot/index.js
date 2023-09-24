const GitHub = require('github-api');
const http = require('http');
const gh_token = 'TOKEN'

class PullRequest {

    constructor(
        user,
        repo,
        branch = null,
        token = null
    ) {

        this.gh = new GitHub({
            token: token || gh_token
        });

        this.gh.getUser().getProfile().then(res => {
            this.botUser = res.data;
            this.isBotRepo = this.botUser.login === user;
        });

        this.filesToCommit = [];

        this.currentCommitSHA = null;
        this.currentTreeSHA = null;
        this.user = user;
        this.masterRepo = repo;
        this._branch = branch;
        this.forkBranch = `pr-${this._getCurrentTimestamp()}`;

    }

    configure(
        files,
        commitMessage = null,
        titlePullRequest = null,
        descriptionPullRequest = null,
        commitAuthor = {
            'name': 'PRB0t',
            'email': 'EMAIL'
        }
    ) {

        this.commitMessage = `🤖 ${commitMessage || 'Anonymous Commit'}`;
        this.commitAuthor = commitAuthor;
        this.titlePullRequest = titlePullRequest;
        this.descriptionPullRequest = descriptionPullRequest;
        this.files = files.map(({ path, content }) => ({ path, content: Buffer.from(content) }));

    }

    send() {
        return this._fork()
            .then(() => {
                return this._setBranch();
            })
            .then(() => {
                return this._updateForkDefaultBranch();
            })
            .then(() => {
                return this._createBranch()
            })
            .then(() => {
                return this._setCurrentCommitSHA(`heads/${this.branch}`);
            })
            .then(() => {
                return this._setCurrentTreeSHA();
            })
            .then(() => {
                return this._pushFiles(this.files)
            })
            .then(() => {
                return this._setCurrentCommitSHA(`heads/${this.forkBranch}`)
            })
            .then(() => {
                return this._createTree()
            })
            .then(() => {
                return this._commitChanges()
            })
            .then(() => {
                return this._updateHead()
            })
            .then(() => {
                return this._createPullRequest();
            });

    }

    get fullRepoName() {

        return `${this.user}/${this.masterRepo}`;

    }

    get branch() {

        const branch = this._branch || this.repo.default_branch;
        return branch;

    }

    get repo() {

        if (!this._repo) {
            this._repo = this.gh.getRepo(this.fullRepoName);
        }

        return this._repo;

    }

    _setBranch() {

        if (this.branch) return;

        return this.repo.getDetails().then(res => {

            this._branch = res.data.source ? res.data.source.default_branch : res.data.default_branch;

        });

    }

    _fork() {

        return new Promise((resolve, reject) => {

            if (this.isBotRepo) {
                this.fork = this.repo;
                return resolve();
            }

            return this.repo.fork().then(res => {
                resolve(res);
                this.fork = this.gh.getRepo(res.data.full_name);
            }).catch(reject);

        });

    }

    _updateForkDefaultBranch() {

        return this.repo.getRef(`heads/${this.branch}`).then((ref) => {
            return this.fork.getRef(`heads/${this.branch}`).then(forkRef => {

                if (forkRef.data.object.sha !== ref.data.object.sha) {
                    return this.fork.createPullRequest({
                        title: `Update fork`,
                        body: `Update fork`,
                        base: this.branch,
                        head: `${this.user}:${this.branch}`,
                        maintainer_can_modify: false
                    }).then(res => {
                        return this.fork.mergePullRequest(res.data.number);
                    }).catch(e => console.log(e.request, e.response.data.errors))
                }

                return true;
            });
        });

    }

    _createBranch() {

        return this.fork.createBranch(this.branch, this.forkBranch);

    }

    _setCurrentCommitSHA(reference = 'heads/master') {

        return this.fork
            .getRef(reference)
            .then((ref) => {
                this.currentCommitSHA = ref.data.object.sha;
            });

    }

    _setCurrentTreeSHA() {

        return this.repo
            .getCommit(this.currentCommitSHA)
            .then((commit) => {
                this.currentTreeSHA = commit.data.tree.sha;
            });

    }

    _getCurrentTimestamp() {

        const date = new Date(),
            yyyy = date.getFullYear().toString(),
            mm = (date.getMonth() + 1).toString(),
            dd = date.getDate().toString(),
            M = date.getMinutes().toString(),
            S = date.getSeconds().toString();

        return yyyy + (mm[1] ? mm : "0" + mm[0]) + (dd[1] ? dd : "0" + dd[0]) + M + S;

    }

    _createFile(file) {

        return this.fork.createBlob(file.content)
            .then((blob) => {
                this.filesToCommit.push({
                    sha: blob.data.sha,
                    path: file.path,
                    mode: '100644',
                    type: 'blob'
                });
            });

    }

    _createTree() {
        return this.fork.createTree(this.filesToCommit, this.currentTreeSHA)
            .then((tree) => {
                this.currentTreeSHA = tree.data.sha;
            });
    }

    _pushFiles(files) {

        return Promise.all(files.map(file => this._createFile(file)));

    }

    _commitChanges() {

        return this.fork.commit(this.currentCommitSHA, this.currentTreeSHA, this.commitMessage, {
            author: this.commitAuthor
        })
            .then((commit) => {
                this.currentCommitSHA = commit.data.sha;
            });

    }

    _updateHead() {

        return this.fork.updateHead(
            `heads/${this.forkBranch}`,
            this.currentCommitSHA
        );

    }

    _createPullRequest() {

        return this.repo.createPullRequest({
            title: this.titlePullRequest || `🤖 PRB0t ${this.forkBranch}`,
            body: `${this.descriptionPullRequest || this.commitMessage}
--
Automated submit by PRB0t`,
            base: this.branch,
            head: `${this.botUser.login}:${this.forkBranch}`
        });

    }


}

http.createServer((request, response) => {
    const { headers, method, url } = request;
    let body = [];
    request.on('error', (err) => {
        console.error(err);
    }).on('data', (chunk) => {
        body.push(chunk);
    }).on('end', () => {
        var json = JSON.parse(body);
        const pr = new PullRequest(json.user, json.repo, json.branch, gh_token);

        pr.configure(
            [
                { "path": json.files[0].path, "content": json.files[0].content }
            ],
            json.commit,
            json.title,
            json.description,
            json.author || {
                name: 'PRB0t',
                email: '34620110+PRB0t@users.noreply.github.com',
            }
        );

        const { data } = pr.send(); // data holds the response of the PR creation.
    });
}).listen(8080);