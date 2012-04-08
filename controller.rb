require 'haml'
require 'coffee_script'

ignore *%w{.gitignore LICENSE Gemfile Gemfile.lock Rakefile}
ignore(/\.swp$/, %r{/\.git/}, %r{/\.sass-cache/})
