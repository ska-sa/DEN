cwlVersion: v1.0
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

inputs:
  vis: Directory

outputs: []

steps:
#  obs_config:
#    run: workflows/obs_config.cwl
#    in: []
#    out: []

  flagging:
    run: workflows/flagging.cwl
    in:
      vis: vis 
    out: []
#
#  cross_cal:
#    run: workflows/cross_cal.cwl
#    in: []
#    out: []
#
#  inspect:
#    run: workflows/inspect.cwl
#    in: []
#    out: []
#
#  selfcal:
#    run: workflows/selfcal.cwl
#    in: []
#    out: []
