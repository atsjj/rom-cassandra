# encoding: utf-8

require "rubygems"
require "bundler/setup"

# Loads bundler tasks
Bundler::GemHelper.install_tasks

# Loads the Hexx::RSpec and its tasks
begin
  require "hexx-suit"
  Hexx::Suit.install_tasks
rescue LoadError
  require "hexx-rspec"
  Hexx::RSpec.install_tasks
end

# Sets the Hexx::RSpec :test task to default
task :default do
  system "bundle exec rake test:coverage:run"
end

desc "Runs mutation metric for testing"
task :mutant do
  system "mutant -r rom-cassandra --use rspec ROM::Cassandra* --fail-fast"
end

desc "Exhort all evils"
task :exhort do
  system "mutant -r rom-cassandra --use rspec ROM::Cassandra*"
end

desc "Runs all the necessary metrics before making a commit"
task prepare: %w(exhort check:inch check:rubocop check:fu)
