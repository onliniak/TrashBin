# Server configuration
DATABASE = "sqlite3://./mPub.db?journal_mode=wal"
DOMAIN = "0.0.0.0"
PORT   = 3000

# Namespaces aliases
#
# module Bar
#  extend Foo
# end
#
# The equivalent of 'use Foo as Bar' in other languages.
module Auth
  extend IndieAuthOnliniak
end
