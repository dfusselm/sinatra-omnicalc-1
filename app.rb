require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:square)
end


get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end


get("/square/results") do
  @the_num = params.fetch("number").to_f
  
  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end
