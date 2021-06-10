
version=testing
repo="https://github.com/maxbube/mydumper.git"
branch="master"
if [ "$1" != "" ]
then
	version="$1"
	if [ "$2" != "" ]
	then
		repo="$2"
		if [ "$3" != "" ]
		then
			branch="$3"
		fi
	fi
fi
echo "Using"
echo "version=$version"
echo "repo=$repo"
echo "branch=$branch"
function check_error {
number=$1
if (( $number > 0 ))
then
  echo "Error found"
  exit 1
fi


}

ansible-playbook compile_mydumper_rhel7.yml -i el7, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "branch=$branch"  --start-at-task "Start compiling"
check_error $?
ansible-playbook compile_mydumper_rhel8.yml -i el8, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "branch=$branch" --start-at-task "Start compiling"
check_error $?
ansible-playbook compile_mydumper_debian.yml -i buster,stretch,jessie,trusty,xenial,bionic,focal --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "branch=$branch" --start-at-task "Start compiling"
check_error $?
ansible-playbook compile_mydumper_debian.yml -i buster8,stretch8,jessie8,xenial8,bionic8,focal8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "branch=$branch" --start-at-task "Start compiling"
check_error $?
ansible-playbook compile_mydumper_gentoo.yml -i gentoo, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "branch=$branch" --start-at-task "Start compiling"
check_error $?
# ansible-playbook compile_mydumper_rhel7.yml -i el7, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "extra_cmake_options=-DWITH_BINLOG=ON" --start-at-task "Start compiling"
#ansible-playbook compile_mydumper_rhel8.yml -i el8, --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "extra_cmake_options=-DWITH_BINLOG=ON" --start-at-task "Start compiling"

#ansible-playbook compile_mydumper_debian.yml -i buster,stretch,jessie,trusty,xenial,bionic,focal --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "extra_cmake_options=-DWITH_BINLOG=ON" --start-at-task "Start compiling"

#ansible-playbook compile_mydumper_debian.yml -i buster8,stretch8,jessie8,xenial8,bionic8,focal8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=$version" --extra-vars "mydumperrepo=$repo" --extra-vars "extra_cmake_options=-DWITH_BINLOG_8=ON" --start-at-task "Start compiling"
