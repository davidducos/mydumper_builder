
vagrant ssh-config > ssh-config
ansible-playbook test_compilation_deb.yml -i focal,trusty,bionic,buster,jessie,stretch,xenial --ssh-extra-args=" -F ssh-config" --extra-vars "version=0.10.1"

ansible-playbook test_compilation_rpm.yml -i el7,el8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=0.10.1"

