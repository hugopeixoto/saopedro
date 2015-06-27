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
end
