# -*- mode: ruby -*-
# vi: set ft=ruby :

compiling_version="testing"

if ! ENV['compiling_version'].nil?
  compiling_version=ENV['compiling_version']
end 

Vagrant.configure(2) do |config|

  # Prevent VirtualBox from enable the COM port which causes issues on some OS.
  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uart1", "off" ]
    vb.customize [ "modifyvm", :id, "--uart2", "off" ]
    vb.customize [ "modifyvm", :id, "--uart3", "off" ]
    vb.customize [ "modifyvm", :id, "--uart4", "off" ]
  end
# I decided not support el6 anymore until I have time to sort the issues out
#  config.vm.define :el6 do |el6|
#    el6.vm.box = "centos/6"
#    el6.vm.provision :ansible do |ansible|
#      ansible.playbook = "compile_mydumper_rhel.yml"
#    end
#    el6.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
#      v.customize ["modifyvm", :id, "--audio", "none"]
#    end
#  end

  config.vm.define :el7 do |el7|
    el7.vm.box = "centos/7"
    el7.vm.provision :ansible do |ansible|  
      ansible.playbook = "compile_mydumper_rhel7.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    el7.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end
  end

  config.vm.define :el8 do |el8|
    el8.vm.box = "centos/8"
    el8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_rhel8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end
  
  # Debian 11
#  config.vm.define :bullseye do |bullseye|
#    bullseye.vm.box = "debian/bullseye64"
#    bullseye.vm.provision :ansible do |ansible|
#      ansible.playbook = "compile_mydumper_debian.yml"
#    end
#  end

  # Debian 10
  config.vm.define :buster do |buster|
    buster.vm.box = "debian/buster64"
    buster.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Debian 9
  config.vm.define :stretch do |stretch|
    stretch.vm.box = "debian/stretch64"
    stretch.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Debian 8
  config.vm.define :jessie do |jessie|
    jessie.vm.box = "debian/jessie64"
    #debian8.vm.box_url = "https://github.com/kraksoft/vagrant-box-debian/releases/download/8.1.0/debian-8.1.0-amd64.box"
    jessie.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Debian 7
# I decided not support wheezy anymore until I have time to sort the issues out 
#  config.vm.define :wheezy do |wheezy|
#    wheezy.vm.box = "debian/wheezy64"
    #debian7.vm.box_url = "https://github.com/kraksoft/vagrant-box-debian/releases/download/7.8.0/debian-7.8.0-amd64.box"
#    wheezy.vm.provision :ansible do |ansible|
#      ansible.playbook = "compile_mydumper_debian.yml"
#    end
#  end

  # Ubuntu 14
  config.vm.define :trusty do |trusty|
    trusty.vm.box = "ubuntu/trusty64"
    trusty.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Ubuntu 16
  config.vm.define :xenial do |xenial|
    xenial.vm.box = "ubuntu/xenial64"
#    xenial.vm.provision "install pyhton 2.7",
#      type: "shell",
#      preserve_order: true,
#      inline: "apt-get -y install python"
    xenial.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Ubuntu 18
  config.vm.define :bionic do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
#    bionic.vm.provision "install pyhton 2.7",
#      type: "shell",
#      preserve_order: true,
#      inline: "apt-get -y install python"
    bionic.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    bionic.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end
  end

  # Ubuntu 20.04
  config.vm.define :focal do |focal|
    focal.vm.box = "ubuntu/focal64"
#    focal.vm.provision "install pyhton 2.7",
#      type: "shell",
#      preserve_order: true,
#      inline: "apt-get -y install python"
    focal.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version 
      }
    end
  end

  # Ubuntu 20.04
  config.vm.define :focal8 do |focal8|
    focal8.vm.box = "ubuntu/focal64"
    focal8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  # Gentoo
  config.vm.define :gentoo do |gentoo|
    gentoo.vm.box = "generic/gentoo"
    gentoo.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_gentoo.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true

end
