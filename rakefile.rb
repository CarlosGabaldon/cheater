require 'yaml'

def p command, description
  puts "#{command} => #{description}."
end


namespace :cheater do
  
  rule "" do |t|
    command_file = "#{t.name.tr(":", "_")}.yml"
    groups = YAML.load(File.open(command_file))
    
    groups.each do |group|
      puts group["group"]
      group["commands"].each do |command|
        p command["command"], command["desc"]
      end
      puts "\n"
    end
    
  end

end