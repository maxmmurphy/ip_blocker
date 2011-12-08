class IpBlocker

  def initialize(app, options = {})
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