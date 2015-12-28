require 'sinatra/reloader' if development?

DISK_STATUS_NAME_MAP = {
  "Filesystem" => "文件系统",
  "Size"       => "容量",
  "Used"       => "消耗",
  "Avail"      => "剩余",
  "Use%"       => "使用百分比",
  "Mounted"    => "挂载点"
}.freeze

SERVICES = {
  "[s]mbd"      => "NAS",
  "[p]uma"      => "监控面板",
  "[c]lockwork" => "温度采集"
}.freeze

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
  @headers = []
  info.shift.split(" ").each { |name| @headers << DISK_STATUS_NAME_MAP[name] }
  @items = info

  slim :disk
end

get '/services' do
  @services_with_status = {}
  SERVICES.each do |k,v|
    pid = `ps aux | grep "#{k}" | awk '{print $2}'`
    @services_with_status[v] = (pid.empty? ? "停止" : "正常")
  end

  slim :services
end

before do
  /(?<time>\d{2}\:\d{2}(\:\d{2})?)(\s*up\s*)?(?<run_time>(\d\s*days?\,\s*)?\d{2}\:\d{2})(\,\s*)?(?<connection>(\d*\susers?)?)(\,\s*)?load\saverages?\:\s*(?<load>[\d\.\,\s]*)/ =~ `uptime`
  @info = ["系统时间: #{time}", "已运行: #{run_time.rstrip.chop}", "连接数: #{connection}", "负载: #{load.chop}"]
end
