namespace :stub do

  desc "Creates stub providers and machines from stub_data_file"
  task providers_and_machines: :environment do
    file = File.read(File.join("lib", "data", "providers_stubs.json"))
    JSON.parse(file)["providers"].each do |prov|
      provider = Provider.create(
        name: prov["name"],
        api_key: prov["api_key"],
        machine_templates: prov["machine_templates"].map do |tpl|
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
      )
      puts "Added #{provider.name}"
    end
  end

  desc "Creates stub machines from existing providers and their templates"
  task machines: :environment do
    puts "Creating machines from templates"
    MachineTemplate.all.each do |tpl|
      (1...5).each do |i|
        Machine.create(
          name: "Machine #{SecureRandom.hex(3)}",
          status: i.even? ? "ON" : "OFF",
          disk_usage: tpl.disk / i,
          machine_template_id: tpl.id
        )
        print "."
      end
    end
  end
end
