cwlVersion: v1.0
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

inputs:
  ms: Directory
  spw: string
  timerange: string
  quackinterval: float
  strategy: File
  column: string
  fields: string[]
  bands: int[]
  uvrange: string
  spwid: int[]
  mask: File

outputs: []

steps:
#  obs_config:
#    run: workflows/obs_config.cwl
#    in: []
#    out: []

  flagging:
    run: workflows/flagging.cwl
    in:
      ms: ms
      bands: bands
      column: column
      fields: fields
      mask: mask
      quackinterval: quackinterval
      spw: spw
      spwid: spwid
      strategy: strategy
      timerange: timerange
      uvrange: uvrange

    out: [flagged_ms]
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
