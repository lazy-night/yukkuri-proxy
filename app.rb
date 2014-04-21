require 'sinatra'
require 'net/http'
require 'uri'

get '/:string' do |str|
  unless ENV['YUKKURI_URL']
    halt 503
  end

  url = URI.parse(ENV['YUKKURI_URL'])
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.get("/syaberu/#{URI.escape(str)}")
  }
  puts res.body
end

