require 'rubygems'
require 'sinatra'

get '/hi' do
  output = `cd /etc/puppet; /usr/bin/git pull`
  return output
end

post '/github' do
  output = `cd /etc/puppet; /usr/bin/git pull`
  puts output
  "OK"
end

