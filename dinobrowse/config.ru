class DefaultToIndex
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    if env["PATH_INFO"] == "/"
      env["PATH_INFO"] = "/index.html"
    end
    @app.call(env)
  end
  
end

use DefaultToIndex

run Rack::File.new(File.dirname(__FILE__) + "/src")
