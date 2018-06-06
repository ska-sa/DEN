
.PHONY: run docker

all: run

.venv2/:
	virtualenv -p python2 .venv2/

.venv2/bin/cwltool: .venv2/
	.venv2/bin/pip install -r requirements.txt

run: .venv2/bin/cwltool docker
	.venv2/bin/cwltool \
		--tmpdir=$(PWD)/results/tmp/ \
		--cachedir=$(PWD)/results/cache/ \
		--outdir=$(PWD)/results/results/ \
        --verbose \
		cwl/main.cwl \
		cwl/jobs/meerkat-job.yml

docker:
	docker build -t ska-sa/den .
