get '/' do
  slim :index
end

get '/temperature' do
  slim :temperature
end
