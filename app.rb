require("sinatra")
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
require('pg')

DB = PG.connect({:dbname => "volunteer_tracker"})

also_reload('lib/**/*.rb')

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

patch('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title]})
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  @projects = Project.all
  erb(:projects)
end

post('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.new({:name => params[:name], :project_id => @project.id, :id => nil})
  volunteer.save
  erb(:project)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb(:volunteer)
end
