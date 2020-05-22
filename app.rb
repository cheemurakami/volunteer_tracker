require("sinatra")
require('sinatra/reloader')
require('./lib/album')
require('pry')
require('./lib/song')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

also_reload('lib/**/*.rb')