# Installing servers & deploying

## Prerequisites (Mac)
* HomeBrew [(https://brew.sh)](https://brew.sh)
* Maven [(https://maven.apache.org/)](https://maven.apache.org/)
	* Preferred installation method `brew install maven`
* Vagrant [()https://www.vagrantup.com/](https://www.vagrantup.com/)
    * Preferred installation method `brew cask install vagrant`
* Ansible
	* Preferred installation method `sudo pip install ansible`

## Prerequisites (Windows 10)
* Windows Subsystem For linux [(https://docs.microsoft.com/en-us/windows/wsl/install-win10)](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* Ubuntu
	* Install from Store
	* Required packages:
	 * Java 8 (sudo apt-get install openjdk-8-jdk)
	 * Maven (sudo apt-get install maven)
	 * Ansible (sudo apt-get install ansible)
	 * Sshpass (sudo apt-get install sshpass)
	 * Node [(https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)

## Windows 10 notes
* C-drive is located in /mnt/c/
* All files have full access --> you need to move create separate password.txt in Ubuntu homewolder without execution permission and change ansible.cfg to use that new file

## Vagrant
vagrant-folder contains required init-skript to start local Oracle Linux 7.4 server. Normally you don't need this, but you may use it to test ansible-changes.

* Start: run commant `vagrant up` in vagrant-folder
* You can ssh to machine using two methods
	* `vagrant ssh` (password is vagrant)
	* `ssh vagrant@192.168.60.80 -i vagrant_rsa`
* installing tomcat, haproxy etc is done using vagrant `ansible-playbook tasks/install_server.yml -i inventory/inventory_local`. Installing packages to test and prod is made same way - just change inventory-file.

## Deployment
* Go to folder `deployment`
* Ansible-vault password is stored in [CRED-811](https://jira.solita.fi/browse/CRED-811). Copy it to password.txt
* Decrypt inventory-files `ansible-vault decrypt inventory/inventory_test` and `ansible-vault decrypt inventory/inventory_prod`.
* If you add new variables and want save updated inventories encrypt inventories before saving `ansible-vault encrypt <filename>`. Asked password is same that you just copied to password.txt.
* Edit `./inventory/inventory_[prod/test]` -file
	* Change value of `ansible_ssh_user` to your livi-username
	* Change value of `ansible_ssh_private_key_file` to point to your local ssh-key for livi servers
* Connect to livi vpn: `https://etayhteys.liikennevirasto.fi/vpn/index.html`
* Deployment to test: `./deploy_livi_test.sh`
* Deployment to prod: `./deploy_livi_prod.sh`
* The ssh password asked is for your K-username
* Test the new version:
	* Test server ui (disable vpn first): `https://testintranet.liikennevirasto.fi/tiesu/#/`
