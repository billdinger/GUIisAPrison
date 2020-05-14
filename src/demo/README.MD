# Demo

This contains the code used in the talk to demo creating a new instance and other such shenanigans. Specifically -

- `gcp_auth.yml` is used to setup authentication and as a variable file for the other plays.
- `gcp_conditionals.yml` demos how to handle [conditional statements such as when](https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html#the-when-statement)
- `dcp_debugger.yml` explains the [playbook debugger](https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html)
- `gcp_handlers.yml` demos [ansible handlers](https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html#handlers-running-operations-on-change)
- `gcp_instance_remove.yml` shows you how to delete instances.
- `gcp_instance.yml` creates a GCE instance
- `gcp_loops.yml` demos how to [do loops](https://docs.ansible.com/ansible/latest/user_guide/playbooks_conditionals.html#loops-and-conditionals)
- `gcp_network.yml` shows off creating networks in GCP
- `gcp_state.yml` show the various ways of [maintaing ansible state](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#always-mention-the-state)
- `gcp_tags.yml`  is all about [Ansible tagging](https://docs.ansible.com/ansible/latest/user_guide/playbooks_tags.html).
- `gcp_vars.yml` demonstrates the different [playbook filters](https://docs.ansible.com/ansible/latest/user_guide/playbooks_filters.html#playbooks-filters)you can use. 
- `gcp_zones.yml` is a shared file specifying the zones.
- `inventory.gcp.yml` demos how to use [GCP dynamic inventory](https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html)