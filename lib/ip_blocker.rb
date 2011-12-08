class IpBlocker

  # initialize with :ips_to_block as an array, all IP addresses in this array will be blocked
  def initialize(app, options = {:ips_to_block => []})
     @app = app
     @ips_to_block = options[:ips_to_block]
   end

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

end
