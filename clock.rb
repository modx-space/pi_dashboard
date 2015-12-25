require 'clockwork'

module Clockwork
  handler do |job, time|
    puts "Running #{job}, at #{time}"
  end

  every(30.minutes, 'collect temperature') { `rake pi:collect_temp` }
end
