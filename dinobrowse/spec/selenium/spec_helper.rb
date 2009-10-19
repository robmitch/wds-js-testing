require "rubygems"
require "spec"
require 'selenium/client'

$LOAD_PATH << File.dirname(__FILE__)

require "app_server"

dinobrowse_config = File.join(File.dirname(__FILE__), "..", "..", "config.ru")
dinobrowse_server = AppServer.new(dinobrowse_config)

def open_browser
  selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost", 
      :port => 4444, 
      :browser => (ENV["SELENIUM_BROWSER"] || "*firefox"),
      :url => "http://localhost:3000", 
      :timeout_in_second => 30
  selenium_driver.start_new_browser_session
  selenium_driver
end

Spec::Runner.configure do |config|

  config.prepend_before(:suite) do
    dinobrowse_server.start
    $browser = open_browser
  end

  config.append_after(:suite) do
    begin
      $browser.close_current_browser_session
    ensure
      dinobrowse_server.stop
    end
  end

end
