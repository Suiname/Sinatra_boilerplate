require "bundler"
Bundler.require

get '/' do
  return this = {
    :hello => 'hello, world'
    }.to_json
end
