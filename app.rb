require "bundler"
Bundler.require

# get '/' do
#   return {:hello => 'hello, world'}.to_json
# end

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'popular_things'
)

get '/' do
  return Things.all.to_json
end

get '/create' do
  i = 3
  while i>0
    create_thing
    i -= 1
  end
  return Things.all.to_json
end

get '/update' do

end

get '/find' do
  array_of_things = Array.new
  i = 3
  while i > 0
    array_of_things.push(find_thing)
    i -= 1
  end
  return array_of_things.to_json
end

get '/destroy' do

end

def create_thing
    new_thing = Things.new
    new_thing.name = Faker::Hacker.say_something_smart
    new_thing.save
end

def find_thing
  Things.find(rand(Things.all.length))
end
# get '/worlds' do
#   erb :world
# end
#
# get '/submit' do
#   erb :submit
# end
#
# post '/submit_form' do
#   p params
#   return params.to_json
# end
#
# get '/happy' do
#   happy_things = Dictionary.new({
#     :theworld => 'is awesome'
#     })
#     return happy_things.to_json
# end
