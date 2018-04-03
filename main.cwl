cwlVersion: v1.0
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

steps:
  obs_config:
    run: workflows/obs_config.cwl

  flagging:
    run: workflows/flagging.cwl

  cross_cal:
    run: workflows/cross_cal.cwl

  inspect:
    run: workflows/inspect.cwl

  selfcal:
    run: workflows/selfcal.cwl

