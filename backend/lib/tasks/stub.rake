namespace :stub do

  desc "Creates stub providers and machines from stub_data_file"
  task providers_and_machines: :environment do
    puts "Spinning up some providers and machine templates"
    file = File.read(File.join("lib", "data", "providers_stubs.json"))
    JSON.parse(file)["providers"].each do |prov|
      Provider.find_or_create_by(name: prov["name"]) do |p|
        p.api_key = prov["api_key"]
        p.machine_templates = prov["machine_templates"].map do |tpl|
          MachineTemplate.new(
            name: tpl["name"],
            disk: tpl["disk"],
            cores: tpl["cores"],
            ram: tpl["ram"],
            price: tpl["price"],
            location: tpl["location"],
            transfer: tpl["transfer"]
          )
        end
      end
      print "."
    end
  end

  desc "Creates stub machines from existing providers and their templates"
  task machines: :environment do
    puts "Creating machines from templates"
    MachineTemplate.all.each do |tpl|
      (1...5).each do |i|
        Machine.find_or_create_by(name: "Machine #{SecureRandom.hex(3)}") do |m|
          m.status = i.even? ? "ON" : "OFF"
          m.disk_usage = tpl.disk / i
          m.machine_template_id = tpl.id
          m.tag_list = [SecureRandom.hex(3), SecureRandom.hex(4)]
        end
        print "."
      end
    end
  end

  desc "Creates stub runscripts"
  task runscripts: :environment do
    tags = %w{node python rails django php postgresql redis }

    5.times do
      Runscript.find_or_create_by(name: "Runscript #{SecureRandom.hex(3)}") do |rs|
        rs.script = "#! /usr/bin/env #{%w{ruby python node}.sample}\nputs \"Hello, world\""
        rs.tag_list += tags.sample(2)
      end
      print "."
    end

    puts ""
  end
end
