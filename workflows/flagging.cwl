cwlVersion: v1.0
class: Workflow

inputs: []
outputs: []

steps:
  casa_flagdata:
    run: ../steps/casa_flagdata.cwl
    in: []
    out: []

  aoflagger:
    run: ../steps/aoflagger.cwl
    in: []
    out: []

  rfimasker:
    run: ../steps/rfimasker.cwl
    in: []
    out: []


