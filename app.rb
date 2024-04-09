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


get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @pv = params.fetch("user_pv").to_f

  @r = @apr / 100 / 12
  @denominator = 1- ((1+@r) ** (-@years * 12))
  @numerator = @r * @pv
  @p = @numerator / @denominator
  @apr = @apr.to_fs(:percentage, {:precision => 4})
  @pv = @pv.to_fs(:currency)
  @p = @p.to_fs(:currency)
  
  

  erb(:payment_results)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @result = rand(@min..@max)

  erb(:random_results)
end
