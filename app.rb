require 'sinatra/reloader' if development?

get '/' do
  slim :index
end

get '/temperature' do
  startTime = DateTime.now.strftime("%F")
  endTime   = startTime.next
  @data = Temperature.all(:created_at => (startTime..endTime), :order => [:id.asc])
  slim :temperature
end

get '/disk' do
  info = `df -h / /media/nas/`.split("\n")
  @headers = info.shift.split(" ")
  @headers.pop
  @items = info
  slim :disk
end
