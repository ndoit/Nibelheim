Nibelheim
===

This is a replacement for deprecated [Midgar](https://github.com/ndoit/midgar).

There are several steps to set up the box.

- Install Vagrant
- Install VirtualBox
- Install Xcode
- Install Pip
- Install Ansible
- Ability to SSH to github from your Mac
- Install rvm ansible community role
- Install the official centos 6 box and startup

You will need to be able to ssh to github from you Mac.

You need [vagrant](https://www.vagrantup.com/downloads.html) and
virtual box installed to start.

Install Xcode
---
Go to the app store on mac and search for Xcode. It should be the top result.
Download and install, and agree to the license. What you need is a C compiler.
Go to the terminal when finished installing and make sure `gcc -v` works.

Virtual Box Install
---

Install Pip
---

```
sudo easy_install pip
```

Ansible install
---

You will need to [install Ansible](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-on-mac-osx).
Because our development team consists of only mac developers, this installation
will feature installation steps for Mac OSX. At least version 2.2 for the
community role in the next step.

You need to have pip installed. See the last section.



If you have problems for this step for upgrading, there is a known issue
with mac osx security settings not letting Ansible update to latest 2.2 version.
[See here](https://github.com/ansible/ansible/issues/13116#issuecomment-239844113)

The command that I have seen work when upgrading is
`sudo pip install --ignore-installed --upgrade ansible`

RVM Ansible Community Role Install
---

Next you will need to install an Ansible community role for rvm
[rvm_io.ruby](https://galaxy.ansible.com/rvm_io/ruby/) which will
handle our ruby installs and rvm install.

The command for this is `sudo ansible-galaxy install rvm_io.ruby`

Virtual Box Guest Additions Install
---

Next install is VirtualBox guest additions. These enable file sharing between
the guest and host machines. There are several ways to do this. The easiest
being the vagrant-vbguest plugin.

#### [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest)

This is the easiest install, and involves only running one command

```
vagrant plugin install vagrant-vbguest
```

#### Manual Install

The other way is to do it manually. The versions in this doc is 5.1.22, it must
match your virtualbox version. Consequently, every time you upgrade virtualbox,
you must also upgrade the guest additions.
```
# Remember the guest additions must be installed on your guest machine.
wget http://download.virtualbox.org/virtualbox/5.1.22/VBoxGuestAdditions_5.1.22.iso
sudo mkdir /media/VBoxGuestAdditions
sudo mount -o loop,ro VBoxGuestAdditions_5.1.22.iso /media/VBoxGuestAdditions
sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
rm VBoxGuestAdditions_5.1.22.iso
sudo umount /media/VBoxGuestAdditions
sudo rmdir /media/VBoxGuestAdditions
```

To check what version of guest additions you have installed-
```
# lsmod | grep -i vbox

Output:

vboxvideo 12575 2
drm 242038 3 vboxvideo
vboxsf 39436 0
vboxguest 228550 8 vboxsf

# modinfo vboxguest

Output:

filename: /lib/modules/3.2.0-29-generic/misc/vboxguest.ko
>>> version: 4.1.20 <<<
license: GPL
description: Oracle VM VirtualBox Guest Additions for Linux Module
author: Oracle Corporation
srcversion: F257C1B923A2AC55436E41D
alias: pci:v000080EEd0000CAFEsv00000000sd00000000bc*sc*i*
depends:
vermagic: 3.2.0-29-generic SMP mod_unload modversions

Or if you *really* want to be picky about it ;-)

# lsmod | grep -io vboxguest | xargs modinfo | grep -iw version

Output:

version: 4.1.20
```

Install Centos 6 Box
---

Make sure when you cd into Nibelheim folder that you use the
[official box](https://atlas.hashicorp.com/centos/boxes/6) from Centos.

It should be this simple command and this starts up the box.
```
vagrant init centos/6; vagrant up --provider virtualbox
```

You're Done!
---

Once you have the environment setup, the next thing should be to clone this git
repo and `vagrant up`
