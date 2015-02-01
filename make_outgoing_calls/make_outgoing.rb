require 'sinatra'
require 'rubygems'

get '/' do
    username = "Your SIP Endpoint Username"
    password = "Your SIP Endpoint Password"
    # Render the erb file
    erb :make_outgoing, :locals => {:username => username, :password => password}
end