

version=testing
if [ "$1" != "" ]
then
	version="$1"
fi

ansible-playbook compile_mydumper_rhel7.yml -i el7, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --start-at-task "Start compiling"
ansible-playbook compile_mydumper_rhel8.yml -i el8, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --start-at-task "Start compiling"

ansible-playbook compile_mydumper_debian.yml -i buster,stretch,jessie,trusty,xenial,bionic,focal --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --start-at-task "Start compiling"
