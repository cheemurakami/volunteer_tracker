require("sinatra")
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

also_reload('lib/**/*.rb')