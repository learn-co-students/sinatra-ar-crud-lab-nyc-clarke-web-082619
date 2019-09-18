ENV["SINATRA_ENV"] ||= "test"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require './app/controllers/application_controller'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end