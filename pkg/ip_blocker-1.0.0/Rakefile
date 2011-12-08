require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('ip_blocker', '1.0.0') do |gem|
  gem.description              = "Block ip addresses in middleware"
  gem.url                      = "http://github.com/maxmmurphy/ip_blocker"
  gem.author                   = "Max M. Murphy"
  gem.email                    = "max@maxmurphy.net"
  gem.ignore_pattern           = ["tmp/*"]
  gem.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
