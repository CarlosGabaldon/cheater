require 'yaml'

def p command, description
  puts " #{command} # #{description}."
end

namespace :cheater do
  
  task :default => [:docs]
  
  task :docs do
    files = Dir.glob("*.yml")
    puts "Available Cheet Sheets"
    files.each do |file|
      command = "rake #{file.gsub(/.yml/, '').tr('_', ':')}"
      desc = "Cheat Sheet for #{command.gsub(/rake cheater:/, '')}"
      p command, desc
    end
  end
  
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