require 'net/http'
require 'net/https'
require 'json'

owner = 'OWNER'
repo = 'GIT REPO'
branch_name = 'main' #since "Black Lives Matter" social movement
directory = 'directory/file.txt'
file_content = 'test test test'
message = 'Test Message'
author_name = 'John Doe'
author_email = 'feultrafe@sec.ret'

def get(path)
    https = Net::HTTP.new('api.github.com', 443)
    https.use_ssl = true
    req = Net::HTTP::Get.new(path)
    res = https.request(req)
    return res.body
end

def post(path, json)
    https = Net::HTTP.new('api.github.com', 443)
    https.use_ssl = true
    req = Net::HTTP::Post.new(path, {'Content-Type' => 'application/json', "Accept": "application/vnd.github.v3+json"})
    req.basic_auth('OWNER', 'PASSWORD')
    req.body = json.to_json
    res = https.request(req)
    return res.body
end

public_repo = get("/repos/#{owner}/#{repo}/branches/#{branch_name}")
get_sha = JSON.parse(public_repo)
sha = get_sha['commit']['sha']

content = {:content => 'file_content',
          :encoding => 'utf-8'}
get_blob_sha = post("/repos/#{owner}/#{repo}/git/blobs", content)
blob_sha = JSON.parse(get_blob_sha)['sha']

specify_directory = {
    :path => directory,
    :mode => '100644',
    :type => 'blob',
    :sha  => blob_sha
}
tree = {:base_tree => sha,
        :tree => [specify_directory]}
get_tree_sha = post("/repos/#{owner}/#{repo}/git/trees/", tree)
tree_sha = get_tree_sha['sha']

puts tree.to_json

# author = {:name => author_name,
#           :email => author_email}
# commit = {
#     :message => message,
#     :author => author,
#     :parents => [sha],
#     :tree  => tree_sha
# }
# new_commit = post("https://api.github.com/repos/#{owner}/#{repo}/git/commits", commit)
# new_commit_sha = new_commit['sha']

# puts new_commit_sha

# update = {:ref => "refs/heads/master",
#           :sha => new_commit_sha}
# post("/repos/#{owner}/#{repo}/git/refs/heads/master", update)

# Inspired by https://stackoverflow.com/a/63461333
