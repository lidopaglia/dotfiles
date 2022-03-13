install:
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python get-pip.py --user
	python -m pip install --user ansible
	ansible-galaxy install -r requirements.yml
	ansible-playbook ./bootstrap.yml
clean:
	rm get-pip.py
