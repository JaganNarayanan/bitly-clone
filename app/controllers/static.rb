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
  @url = Url.new(long: params[:long])
  if @url.save
    # redirect '/'
    @url.to_json
  else
    @errors = @url.errors.full_messages
  end
  erb :"static/index"
end

get '/:short' do
  #puts "[LOG] #{params[:short]}"
  row = Url.find_by(short: "#{params[:short]}")
    #puts "[LOG] #{row}"

  row.update(click_count: row.click_count + 1)
  # id = row.id
  @long_url = row.long
  # counter_update = row.click_count + 1
  # Url.update(id, :click_count => counter_update)
  redirect "#{@long_url}"
end
