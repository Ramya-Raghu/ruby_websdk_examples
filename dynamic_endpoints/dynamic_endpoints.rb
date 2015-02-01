require 'sinatra'
require 'rubygems'

get '/' do
    auth_id = "Your AUTH_ID"
    auth_token = "Your AUTH_TOKEN"
    
    p = RestAPI.new(auth_id, auth_token)

    username = (0...8).map{ ('a'..'z').to_a[rand(26)]  }.join
    password = (0...8).map{ ('a'..'z').to_a[rand(26)]  }.join

    # Create an Endpoint
    params = {
        'username' => username, # The username for the endpoint to be created
        'password'=> password, # The password for your endpoint username
        'alias' => username # Alias for the endpoint
    }

    response = p.create_endpoint(params)
    
    # Print the response
    print response

    # Fetch the username of the created Endpoint
    uname = response[1]['username']
    pwd = params['password']
    # Fetch the Endpoint ID
    endpoint_id = response[1]['endpoint_id']

    erb :phone, :locals => {:username => username, :password => password, :end_id => endpoint_id}

end

# Delete an Endpoint
get '/delete_endpoint/:endpoint_id/' do

    endpoint_id = params[:endpoint_id]
    print endpoint_id
    auth_id = "Your AUTH_ID"
    auth_token = "Your AUTH_TOKEN"

    p = RestAPI.new(auth_id, auth_token)

    params = {
        'endpoint_id' => endpoint_id # ID of the endpoint that as to be deleted
    }

    # Delete the created Enpoint
    response = p.delete_endpoint(params)

    # Print the response
    print response
    
end