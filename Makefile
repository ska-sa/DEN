
.PHONY: run

all: run

.venv2/:
	virtualenv -p python2 .venv2/

.venv2/bin/cwltool: .venv2/
	.venv2/bin/pip install -r requirements.txt

run: .venv2/bin/cwltool docker
	.venv2/bin/cwltool main.cwl

docker:
	docker build -t ska-sa/den .
