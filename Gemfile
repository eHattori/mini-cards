source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use portgres as the database
gem 'pg', '~> 0.21.0'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'rspec-rails'
  gem 'ruby-prof'
  gem 'seed_dump'
end

group :test do
end

group :development do
  gem 'annotate'
  gem 'isolator'
  gem 'listen', '~> 3.0.5'
  gem 'prosopite'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'faker'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'
