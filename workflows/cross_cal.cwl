cwlVersion: v1.0
class: Workflow

inputs: []
outputs: []

steps:
  casa_setjy:
    run: ../steps/casa_setjy.cwl
    in: []
    out: []

  casa_gaincal:
    run: ../steps/casa_gaincal.cwl
    in: []
    out: []

  casa_bandpass:
    run: ../steps/casa_bandpass.cwl
    in: []
    out: []

  casa_fluxscale:
    run: ../steps/casa_fluxscale.cwl
    in: []
    out: []

  casa_applycal:
    run: ../steps/casa_applycal.cwl
    in: []
    out: []

  msutils:
    run: ../steps/msutils.cwl
    in: []
    out: []

  casa_plotcal:
    run: ../steps/casa_plotcal.cwl
    in: []
    out: []

