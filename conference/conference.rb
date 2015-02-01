require 'sinatra'
require 'rubygems'

get '/' do
    # Render the conference erb file
    erb :conference
end