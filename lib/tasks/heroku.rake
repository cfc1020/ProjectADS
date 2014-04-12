namespace :heroku do
  task :config do
    puts "Reading config/api_keys.yml and sending config vars to Heroku..."
    CONFIG = YAML.load_file("#{Rails.root}/config/api_keys.yml")['production'] rescue {}
    command = "heroku config:add"
    CONFIG.each {|key, val| command << " #{key}=#{val} " if val }
    system command  
  end
end
