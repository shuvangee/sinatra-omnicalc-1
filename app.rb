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


get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num= params.fetch("number")
  @the_result=params.fetch("number").to_f**0.5
  erb(:sq_root_results)
end



get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr= params.fetch("perc").to_f
  monthlyapr= @apr/1200
  @years=params.fetch("years").to_f
  monthlyyears=@years*12
  @princ=params.fetch("princ").to_f

  @formatted_apr = @apr.to_fs(:percentage, precision: 4)
  @formatted_princ = @princ.to_fs(:currency)

  num=monthlyapr*@princ
  den= 1-((1+monthlyapr)**(-monthlyyears))
  @pay=num/den
  @formatted_pay = @pay.to_fs(:currency)
  erb(:payment_results)
end



get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @the_min= params.fetch("min").to_f
  @the_max=params.fetch("max").to_f
  @random= rand(@the_min..@the_max)
  erb(:random_results)
end
