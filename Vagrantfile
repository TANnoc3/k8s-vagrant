# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
	(1..3).each do |i|
		config.vm.define "node-#{i}" do |s|
			s.vm.box = "ubuntu/bionic64"
			s.vm.hostname = "node-#{i}"

			private_ip = "172.16.20.#{i+10}"
			s.vm.network  "private_network", ip: private_ip 

			s.vm.provider "virtualbox" do |vb|
				vb.cpus = "2"
				vb.gui = false
				vb.customize ["modifyvm", :id, "--ioapic", "on"]
				if i == 1 then
					vb.memory = 2048
				else
					vb.memory = 1024
				end
			end

			s.vm.provision "shell" do |t|
				t.env  = {:PRIVATE_IP => private_ip}
				t.path = "provision.sh"
			end

		end
	end
end
