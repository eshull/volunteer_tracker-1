
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
also_reload('lib/**/*.rb')
require("pg")
require ('pry')
DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  erb(:index)
end
