require "socket"

class AppServer

  def initialize(config_file, port = 3000)
    @config_file = config_file
    @port = port
  end
  
  def start
    boot
    wait_until_started
    puts "Server running on port #{@port}"
  end

  def boot
    fork do
      File.open(pid_file, 'w') { |fp| fp.write Process.pid }
      exec("rackup", File.expand_path(@config_file), "-p", @port.to_s)
    end
  end

  def wait_until_started
    until server_listening?
      sleep 1
    end
  end

  def server_listening?
    begin
      TCPSocket.new("localhost", @port)
    rescue Errno::ECONNREFUSED
      false
    end
  end
  
  def stop
    pid = File.read(pid_file)
    system("kill -9 #{pid}")
    FileUtils.rm_f pid_file
    puts "Server stopped"
  end

  private
  
  def pid_file
    "rack.pid"
  end
  
end
