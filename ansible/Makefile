setup: install

install:
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy role install -r requirements.yml

deploy:
	ansible-playbook -i ./inventory.ini ./playbook.yml --vault-password-file ./.vault_password

vault-encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml --vault-password-file ./.vault_password

vault-view:
	ansible-vault view group_vars/webservers/vault.yml --vault-password-file ./.vault_password

vault-edit:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file ./.vault_password