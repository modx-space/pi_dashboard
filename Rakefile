require './schema'

desc "collect temperature data into database"
namespace :pi do
  task :collect_temp do
    # run command to get cpu temperature
    data = `vcgencmd measure_temp`.gsub(/[^\d\.]/, '')
    # write into database
    Temperature.create temp: data, created_at: Time.now

    # fake data for local development
    # Temperature.create temp: rand(100), created_at: Time.now
  end
end
