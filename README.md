# mydumper_builder
mydumper binaries and packages automation

# Requirements

- ansible
- vagrant
- virtualbox

# Directories

/tmp/src/mydumper/ (binaries destination)

/opt/PKGS (packages destination)

# Compiling binaries

```
ln -s Vagrantfile.deploy Vagrantfile
vagrant up [os]
```
Where os is one of:
- el7
- el8
- jessie
- stretch
- buster
- trusty
- xenial
- bionic
- focal

# Creating packages
Install dependecies
```
yum install epel-release
yum install rpm-build dpkg dpkg-devel fakeroot
```
On mydumper repository execute:
```
./new_release.sh $VERSION $BUILD_NUMBER
```
For instance:
```
./new_release.sh 0.10.3 1
```
Testing step:
```
./postbuild.sh
```


 
