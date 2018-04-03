cwlVersion: v1.0
class: Workflow

inputs: []
outputs: []

steps:
  wsclean:
    run: ../steps/wsclean.cwl
    in: []
    out: []

  cubical:
    run: ../steps/cubical.cwl
    in: []
    out: []

  pybdsf:
    run: ../steps/pybdsf.cwl
    in: []
    out: []

  tigger:
    run: ../steps/tigger.cwl
    in: []
    out: []

