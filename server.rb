require 'socket'

def start_server
  app = Proc.new do
    begin
      ['200', {'Content-Type' => 'text/html'}, [File.read('./index.html')]]
    rescue
      ['400', {'Content-Type' => 'text/html'}, ['index.html not found!']]
    end
  end

  app_ip, app_port = ENV.values_at('APP_IP', 'APP_PORT')
  server = TCPServer.new app_ip, app_port
  puts "Server running at http://#{app_ip}:#{app_port}/"
  ['TERM', 'INT'].each do |sig|
    Signal.trap(sig) {
      puts "SIG#{sig} signal received, server is stopping..."
      Thread.current.terminate
    }
  end
  while session = server.accept
    request = session.gets

    status, headers, body = app.call({})

    session.print "HTTP/1.1 #{status}\r\n"

    headers.each do |key, value|
      session.print "#{key}: #{value}\r\n"
    end

    session.print "\r\n"

    body.each do |part|
      session.print part
    end
    session.close
  end
end

if __FILE__ == $0
  start_server
end
