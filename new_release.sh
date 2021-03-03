
version=$1
iteration=$2

rm -rf /tmp/src/mydumper /opt/PKGS/*

# We are not going to destroy
# vagrant destroy -f

compiling_version=${version}
vagrant up
vagrant ssh-config > ssh-config

./compile_all.sh ${version}
./build.sh ${version} ${iteration}

ansible-playbook test_compilation_deb.yml -i focal,trusty,bionic,buster,jessie,stretch,xenial --ssh-extra-args=" -F ssh-config" --extra-vars "version=${compiling_version}" -e "iteration=${iteration}" 

ansible-playbook test_compilation_rpm.yml -i el7,el8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=${compiling_version}" -e "iteration=${iteration}"

#vagrant halt
