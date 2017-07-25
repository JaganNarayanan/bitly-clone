get '/' do #'/' usually refers to 'root path' in programming, i.e. the beginning of everything
  puts "[LOG] Getting /"
  puts "[LOG] Params: #{params.inspect}"
  erb :"static/index"
end

get '/about' do
  erb :"static/about"
end

get "/posts" do
  @posts = Post.all
  erb :"posts/index"
end

post '/urls' do
  url = Url.new(long: params[:long])
  url.save
  redirect '/'
end

get '/:short' do
  row = Url.find_by(short: "#{params[:short]}")
  @long_url = row.long
  redirect "#{@long_url}"
  #erb :"static/redirect"
end
