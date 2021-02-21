app_dir = ENV["APP_PATH"]
app_port = ENV["APP_PORT"]
app_ip = ENV["APP_IP"]
working_directory app_dir

# Set unicorn options
worker_processes 4
preload_app true
timeout 30

# Set up socket location
listen "#{app_ip}:#{app_port}"
