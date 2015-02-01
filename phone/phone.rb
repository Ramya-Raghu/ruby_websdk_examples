require 'sinatra'
require 'rubygems'

get '/' do
    # Render the phone erb file
    erb :phone
end