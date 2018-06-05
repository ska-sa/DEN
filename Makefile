
.PHONY: run docker

all: run

data/meerkat_0h60s.MS/:
	cd data && tar xvf 1477074305.ms.tar

demodata: data/meerkat_0h60s.MS/

.venv2/:
	virtualenv -p python2 .venv2/

.venv2/bin/cwltool: .venv2/
	.venv2/bin/pip install -r requirements.txt

run: .venv2/bin/cwltool docker #demodata
	.venv2/bin/cwltool \
		--tmpdir=$(PWD)/results/tmp/ \
		--cachedir=$(PWD)/results/cache/ \
		--outdir=$(PWD)/results/results/ \
        --verbose \
		cwl/main.cwl \
		cwl/jobs/NGC4993_test.yml

docker:
	docker build -t ska-sa/den .
