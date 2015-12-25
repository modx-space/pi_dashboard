require './schema'

desc "collect temperature data into database"
namespace :pi do
  task :collect_temp do
    # TODO: run command to get cpu temperature
    Temperature.create temp: rand(100), created_at: Time.now
  end
end
