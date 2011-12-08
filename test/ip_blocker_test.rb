require 'test/unit'
require File.join(File.dirname(__FILE__), '../' ,'lib/ip_blocker.rb')

class App

  def call(env)
    [200, {"Content-Type" => "text/html"}, "OK"]
  end

end

class IpBlockerTest < Test::Unit::TestCase

  def setup
    @app = App.new
    @ip_blocker = IpBlocker.new(@app, :ips_to_block => ["0.0.0.0", "1.2.3.4", "127.0.0.1"])
  end
  
  def test_block_list
    assert @ip_blocker.ip_blocked?("0.0.0.0")
    assert @ip_blocker.ip_blocked?("1.2.3.4")
    assert @ip_blocker.ip_blocked?("127.0.0.1")
    assert !@ip_blocker.ip_blocked?("4.4.4.4")
    assert !@ip_blocker.ip_blocked?("4.4.3.4")
  end
  
  def test_denied_response
    @env = {
      'REMOTE_ADDR' => '0.0.0.0',
      'PATH_INFO'   => '/somewhere',
      'HTTP_USER_AGENT' => 'AwesomeAgent 1.0'
    }
    assert_equal 403, @ip_blocker.call(@env).first
  end
  
  def test_allowed_response
    @env = {
      'REMOTE_ADDR' => '17.24.25.26',
      'PATH_INFO'   => '/somewhere',
      'HTTP_USER_AGENT' => 'AwesomeAgent 1.0'
    }
    assert_equal 200, @ip_blocker.call(@env).first
  end
  
end
