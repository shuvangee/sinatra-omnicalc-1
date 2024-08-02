require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:howdy)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @the_num= params.fetch("number")
  @the_result=params.fetch("number").to_f**2
  erb(:square_results)
end
