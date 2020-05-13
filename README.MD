## The Gui is a Prison: Automate your infrastructure with Ansible!

This is the repo for the talk on automating your infrastructure with ansible. The root `dockerfile` contains all you need to get started!

### Getting Started
If wanting to use GCP follow the steps under Pre-Reqs.

1. Pull repo down.
2. from repo directory run `docker build --tag guiprison:1.0 .`
3. from root run `docker-compose run guiprison bash`
4. Get ansibling! All playbooks are in the `src` directory.

### Pre-Reqs for GCP

1. You will need docker desktop installed OR [manually install Ansible locally](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your computer.
2. You will need to setup a [google service account](https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html) for the project you wish to test this on.
3. For the service account download the json credentials to the root of repository. Save the file as `ansible.json`. 
# 4. Edit the `src/vars/gce_auth.yml` file and add 

#### Optional: Add SSH Keys for GCP
If you are wanting to administer google compute instances you'll need to also add the SSH keys so Ansible can use them to authenticate to the computer.

1. [Generate a ssh key](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#linux-and-macos). Make sure you associate a username - i.e. `ansible` - to the ssh key. You can do this as a comment when generating the key refer to the link above about generating a ssh key.
2. In GCP go to Compute Engine -> Metadata
3. Click `SSH Keys`.
4. Add the public key you generate in step 1 to the box and click `save`.
![Example](https://i.imgur.com/2OtFF52.png)
5. Export the public & private keys and save them in the root of repository. By default, we expect them to be named `gcp.pub` for public key and `gcp.private` for private key. 
6. Uncomment lines 15-20 in the `Dockerfile`. 




