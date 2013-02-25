source "http://rubygems.org"
source "http://gems.github.com"


gem "rake"
gem "git", ">= 1.2.5"
if RUBY_VERSION >= "2.0.0"
  gem "bundler", "~>1.3.0.pre"
else
  gem "bundler", "~>1.0"
end
gem "rdoc"

group :development do
  gem "yard", "~> 0.8.4"
  gem "rdoc"
  gem "bluecloth"
  gem "cucumber", "~> 1.1.4"
  if RUBY_VERSION <= "1.9.0"
    gem "rcov"
  else
    gem "simplecov"
  end
end

group :test do
  gem "timecop"
  gem "activesupport", "~> 2.3.5"
  gem "shoulda"
  gem "mhennemeyer-output_catcher"
  gem "rr", "~> 1.0.4"
  gem "mocha"
  gem "redgreen"
  gem "test-construct"
  gem "rake"
end

# yo dawg, i herd u lieked jeweler
group :xzibit do
  # steal a page from bundler's gemspec:
  # add this directory as jeweler, in order to bundle exec jeweler and use the current working directory
  gem 'jeweler', :path => '.'
end


group :debug do
  # Debugging is not yet available for rubes 2.0.0
  if "1.9.0" <= RUBY_VERSION && RUBY_VERSION < "2.0.0" 
    gem "ruby-debug19"
  elsif "1.9.0" >= RUBY_VERSION
    gem "ruby-debug"
  end
end
