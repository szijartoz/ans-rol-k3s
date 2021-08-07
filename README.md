ans-rol-k3s
=========

Simple kubernetes install role

Requirements
------------

linux host
python3
user with sudo access

Role Variables
--------------

    ans_rol_k3s:
	dashboard: false
	helm: false
	namespace: false
	service_account: false
	service_account_names:
          - itadmin
          - jenkins


Dependencies
------------

N/A

Example Playbook
----------------

    ---
    - hosts: all
      gather_facts: yes
      become: true
      vars:
        ansible_ssh_user: "{{ zuser }}" 
        ansible_ssh_pass: "{{ zpass }}"
        ansible_become_pass: "{{ zpass }}"
    
        ans_rol_k3s:
          dashboard: true
    
      roles:
        - name: K3S service
          role: ans-rol-k3s

Use it with ssh port forward, remote host 8001 port to your laptop/host.

- http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/secret?namespace=default

If acsess not work, you can check the dashboard proxy on remote host

1) ssh remote host 
2) sudo to root user
3) ./k3s-proxy.sh

Get the token

1) ssh remote host 
2) sudo to root user
3) ./k3s-get-secret.sh

Example, how can call thhis methdo from command line? (like Jenkins)

    ansible-playbook k3s.yml -i hosts --limit 192.168.1.41 --extra-vars "zuser=itadmin zpass=itadmin"

License
-------

BSD

Author Information
------------------

- ZOLTAN SZIJARTO <zoltan.szijarto@gmail.com>

Links
-----

- https://medium.com/@k.sahanshah/setup-helm-in-a-k3s-6376acf00b18
