cwlVersion: v1.0
class: Workflow

steps:
  casa_setjy:
    run: ../steps/casa_setjy.cwl

  casa_gaincal:
    run: ../steps/casa_gaincal.cwl

  casa_bandpass:
    run: ../steps/casa_bandpass.cwl

  casa_fluxscale:
    run: ../steps/casa_fluxscale.cwl

  casa_applycal:
    run: ../steps/casa_applycal.cwl

  msutils:
    run: ../steps/msutils.cwl

  casa_plotcal:
    run: ../steps/casa_plotcal.cwl
