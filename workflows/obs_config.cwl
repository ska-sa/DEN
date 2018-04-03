cwlVersion: v1.0
class: Workflow

steps:
  msutils:
    run: ../steps/msutils.cwl

  casa_listobs:
    run: ../steps/casa_listobs.cwl

