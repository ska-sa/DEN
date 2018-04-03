cwlVersion: v1.0
class: Workflow

inputs: []
outputs: []

steps:
  msutils:
    run: ../steps/msutils.cwl
    in: []
    out: []

  casa_listobs:
    run: ../steps/casa_listobs.cwl
    in: []
    out: []

