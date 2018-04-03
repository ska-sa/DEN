cwlVersion: v1.0
class: Workflow

steps:
  casa_flagdata:
    run: ../steps/casa_flagdata.cwl

  aoflagger:
    run: ../steps/aoflagger.cwl

  rfimasker:
    run: ../steps/rfimasker.cwl


