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
vagrant up [os]
```
Where os is one of:
- el6
- el7
- el8
- stretch
- jessie
- wheezy
- trusty
- xenial
- bionic

# Creating packages

yum install epel-release

yum install rpm-build dpkg dpkg-devel fakeroot

./package/build.sh $VERSION $BUILD_NUMBER
