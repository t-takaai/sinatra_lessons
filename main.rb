require 'sinatra'
require 'sinatra/reloader'

=begin
get '/hello/:name' do
  "hello #{params[:name]}"
end

get '/hello/:name' do |n|
  "hello #{n}"
end

get '/hello/:fname/?:lname?' do |f, n|
  "hello #{f} #{n}"
end

get '/from/*/to/*' do |f, t|
  "from #{f} to #{t}"
end

get %r{/users/([0-9]*)} do |i|
  "user id = #{i}"
end

get '/:name' do |n|
  @name = n
  @title = "main index"
  erb :index
end
=end

before '/admin/*' do
  @msg = "admin area!"
end

before do
  @author = "takaai"
end

after do
  logger.info "page displayed successfully"  
end

helpers do
  
  def strong(s)
    "<strong>#{s}</strong>"
  end
  
end

get '/' do
  @title = "main index"
  @content = "main content by " + @author
  erb :index
end

get '/about' do
  @title = "about this page"
  @content = "this page is ... by " + strong(@author)
  @email = "takoyaj@gmail.com"
  erb :about
end

