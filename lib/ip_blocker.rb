# IpBlocker middleware for rack applications to return a 403 to blocked ip addresses.
#
# usage:
#
# <tt> IpBlocker, :ips_to_block => ["1.2.3.4", "0.0.0.0", "127.0.0.1"] </tt>

class IpBlocker

  # initialize with :ips_to_block as an array, all IP addresses in this array will be blocked
  def initialize(app, options = {})
     @app = app
     @ips_to_block = options[:ips_to_block]
   end
  
   # call only if ip is not blocked
   def call(env)
     if ip_blocked?(env["REMOTE_ADDR"])
       [403, {"Content-Type" => "text/html"}, ["<h1>403 Forbidden</h1>"]]
     else
       @app.call(env)
     end
   end
   
   # If the ip is blocked, return true.
   def ip_blocked?(ip)
     @ips_to_block.include?(ip)
   end
   
   attr_reader :ips_to_block
end
