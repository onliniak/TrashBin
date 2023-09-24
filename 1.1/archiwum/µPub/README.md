# µPub

TODO: Write a description here

It all started when I found a free ($0.00) shared server with SSH access. 
The only problem was FreeBSD 11 x64 instead of Linux.

- This is not a problem.
- After all, there is a cross-compilation.

That's the problem. I have a FreeBSD11 virtual machine and can't fix the 
"dwarf4 not available" error. All I can do is write programs on Crystal 0.27.

That's why I decided to write the whole server from scratch, without 
the help of frameworks. By the way I had to make the first "seriously" application 
compatible with OOP and MVC(?) anyway, why not ?

There were two reasons why I choosed at IndieAuth and Micropub:
- These are the easiest to understand W3C-style protocols
- I have an excuse to add a client in javascript + mobile application.

I don't think I will maintain the application regularly after it is launched. 
Just as I doubt that new databases outside SQLite3 and MySQL will be added in the future.

Micropub's biggest mistake is extensions. Each client has its own and works a little differently.

At the moment I support only:
- Original protocol https://www.w3.org/TR/micropub/ and https://www.w3.org/TR/indieauth/.
- Support for h-x-app and h-app
- mp-slug
- Post Status (no future entries) https://github.com/indieweb/micropub-extensions/issues/19
- Tag list https://github.com/indieweb/micropub-extensions/issues/5
- Query for Post List https://github.com/indieweb/micropub-extensions/issues/4

## Installation

TODO: Write installation instructions here

Install the dependencies.
```shards install --production```

Create database by running
```crystal run src/µPub/Models/Migrations.cr```

You can also use MySQL by changing connection in config.cr
In this case, change the dependency from sqlite3 to mysql in 
µPub.cr and shard.yml 
(Read More: https://github.com/crystal-lang/crystal-mysql#installation)

## Usage

TODO: Write usage instructions here

Binaries for Linux 64bit and FreeBSD11 64bit can be found under /build/x64. 
If you use a different operating system you have to build the program yourself. 
Under the legacy branch you will find code for Crystal 0.27.2 and under the master branch for 0.35 or higher.

### Build
```crystal build app.cr --release --no-debug --progress```

## Development

TODO: Write development instructions here

I generally recommend [Sentry](https://github.com/samueleaton/sentry)
+ [Ameba linter](https://github.com/crystal-ameba/ameba)
+ [Ngrok](https://ngrok.com/)

### Directory structure

```
- spec
- src
  - µPub
    - Controllers   # Crystal files
    - Models
      - Migrations  # Create tables
      - …           # Database queries
    - Views         # ECR/HTML files
    µPub.cr         # Start app
config.cr
.editorconfig
.gitignore
.travis.yml
LICENSE
README.md
shard.yml           # Dependencies
```

## Contributing

1. Fork it (<https://github.com/your-github-user/mpub/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [your-name-here](https://github.com/your-github-user) - creator and maintainer
