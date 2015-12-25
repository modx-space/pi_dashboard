get '/' do
  slim :index
end

get '/temperature' do
  startTime = DateTime.now.strftime("%F")
  endTime   = startTime.next
  @data = Temperature.all(:created_at => (startTime..endTime), :order => [:id.asc])
  slim :temperature
end
