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
      v.memory = 1024
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
    el8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
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
  config.vm.define :buster8 do |buster8|
    buster8.vm.box = "debian/buster64"
    buster8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    buster8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Debian 10
  config.vm.define :buster do |buster|
    buster.vm.box = "debian/buster64"
    buster.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    buster.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
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
    stretch.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Debian 9
  config.vm.define :stretch8 do |stretch8|
    stretch8.vm.box = "debian/stretch64"
    stretch8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    stretch8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Debian 8
  config.vm.define :jessie do |jessie|
    jessie.vm.box = "debian/jessie64"
    jessie.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    jessie.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Debian 8
  config.vm.define :jessie8 do |jessie8|
    jessie8.vm.box = "debian/jessie64"
    jessie8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    jessie8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 14.04
  config.vm.define :trusty do |trusty|
    trusty.vm.box = "ubuntu/trusty64"
    trusty.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    trusty.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 16.04
  config.vm.define :xenial do |xenial|
    xenial.vm.box = "ubuntu/xenial64"
    xenial.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    xenial.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 16.04
  config.vm.define :xenial8 do |xenial8|
    xenial8.vm.box = "ubuntu/xenial64"
    xenial8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    xenial8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 18.04
  config.vm.define :bionic do |bionic|
    bionic.vm.box = "ubuntu/bionic64"
    bionic.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    bionic.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 18.04
  config.vm.define :bionic8 do |bionic8|
    bionic8.vm.box = "ubuntu/bionic64"
    bionic8.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian_8.yml"
      ansible.extra_vars = {
        version: compiling_version
      }
    end
    bionic8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  # Ubuntu 20.04
  config.vm.define :focal do |focal|
    focal.vm.box = "ubuntu/focal64"
    focal.vm.provision :ansible do |ansible|
      ansible.playbook = "compile_mydumper_debian.yml"
      ansible.extra_vars = {
        version: compiling_version 
      }
    end
    focal.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
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
    focal8.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
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
    gentoo.vm.provider "virtualbox" do |v|
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.memory = 1024
    end
  end

  config.vm.synced_folder '.', '/vagrant', disabled: true

end
