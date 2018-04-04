
.PHONY: run docker

all: run

data/meerkat_0h60s.MS/:
	cd data && tar Jxvf meerkat.ms.tar.xz

demodata: data/meerkat_0h60s.MS/

.venv2/:
	virtualenv -p python2 .venv2/

.venv2/bin/cwltool: .venv2/
	.venv2/bin/pip install -r requirements.txt

run: .venv2/bin/cwltool demodata docker
	.venv2/bin/cwltool \
		--tmpdir=$(PWD)/results/tmp/ \
		--cachedir=$(PWD)/results/cache/ \
		--outdir=$(PWD)/results/results/ \
		cwl/main.cwl \
		cwl/jobs/demo.yaml

docker:
	docker build -t ska-sa/den .
