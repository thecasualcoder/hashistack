# Hashistack

The README covers all steps that need to be done beforehand for the workshop

> It is important that the prerequisite is done as it downloads lot of content from internet. Doing this during workshop will cost significant amount of time.

## Tools required

1. VirtualBox
2. Vagrant
3. Git

## Setup

```bash
git clone https://github.com/thecasualcoder/hashistack.git
cd hashistack
vagrant up
```


### Install

1. VirtualBox

For Mac users, you can install it using `brew cask install virtualbox`. For people using linux or Windows, you can use the following [downloads page](https://www.virtualbox.org/wiki/Downloads).

2. Vagrant

For Mac users, `brew cask install vagrant`. All platforms can be downloaded [here](https://www.vagrantup.com/downloads.html).

### Run

```bash
# This should boot up the necessary VMs and install necessary softwares on it
# This will download a ~500MB image and install lot of things and hence needs internet
vagrant up
```

### Issues

- If you face any issue during `vagrant up` such as Network not found or `/dev/vboxnetctl` missing, please restart your host machine or enable Virtualization technology.
- If you use `kvm` as your provider, you need to change the `Vagrantfile`.
- If you face anyother issue, could you raise a Github Issue in this repository so that we can debug and fix it and update it here.

### Output

To check if the setup is completely up and running, 

```bash
vagrant status

# the above command should output the following
Current machine states:

node0                     running (virtualbox)
node1                     running (virtualbox)
systems                   running (virtualbox)
```