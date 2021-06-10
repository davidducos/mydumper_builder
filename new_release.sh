
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

ansible-playbook test_compilation_deb.yml -i focal,bionic,xenial,trusty,stretch,buster,jessie --ssh-extra-args=" -F ssh-config" --extra-vars "version=${compiling_version}" -e "iteration=${iteration}" -e "extra_suffix=''" > log
ansible-playbook test_compilation_deb.yml -i focal8,bionic8,xenial8,stretch8,buster8,jessie8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=${compiling_version}" -e "iteration=${iteration}" -e "extra_suffix='-80'" >> log

ansible-playbook test_compilation_rpm.yml -i el7,el8 --ssh-extra-args=" -F ssh-config" --extra-vars "version=${compiling_version}" -e "iteration=${iteration}" -e "extra_suffix==''" >> log

grep -B1 "cat.stdout" log

#vagrant halt
