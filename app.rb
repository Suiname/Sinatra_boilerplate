require "bundler"
Bundler.require

get '/' do
  return test = {
    :hello => 'hello, world'
    }.to_json
end
