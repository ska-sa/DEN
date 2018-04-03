cwlVersion: v1.0
class: Workflow

steps:
  wsclean:
    run: ../steps/wsclean.cwl

  cubical:
    run: ../steps/cubical.cwl

  pybdsf:
    run: ../steps/pybdsf.cwl

  tigger:
    run: ../steps/tigger.cwl

