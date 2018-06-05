cwlVersion: v1.0
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement

inputs:
# flagging
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
  flag_mode_quack: string
  flag_mode: string
# Cross calibration
  fluxcal_field: string
  gaincal_field: string
  bpasscal_field: string
  refant: string
  setmodel_standard: string
  delaycal_field: string
  delaycal_solint: string
  delaycal_combine: string
  pre_bpasscal_solint: string
  pre_bpasscal_minsnr: float
  pre_gaincal_solint: string
  pre_gaincal_minsnr: float
  bpasscal_solint: string
  bpasscal_interp: string
  bpasscal_combine: string
  bpasscal_fillgaps: int 
  bpasscal_minsnr: float
  gaincal_combine: string
  gaincal_solint: string
  gaincal_minsnr: float
  gaincal_interp: string
  apply_bpass: string[]
  apply_gaincal: string[]
  apply_target: string[]
  applymode: string
  uvrange: string

outputs: []

steps:
#  obs_config:
#    run: workflows/obs_config.cwl
#    in: []
#    out: []

#  flagging:
#    run: workflows/flagging.cwl
#    in:
#      ms: ms
#      bands: bands
#      column: column
#      fields: fields
#      mask: mask
#      quackinterval: quackinterval
#      spw: spw
#      spwid: spwid
#      strategy: strategy
#      timerange: timerange
#      uvrange: uvrange
#      flag_mode_quack: flag_mode_quack
#      flag_mode: flag_mode
#
#    out: [flagged_ms]

  cross_cal:
    run: workflows/cross_cal.cwl
    in:
      ms: ms #flagging/flagged_ms
      fluxcal_field: fluxcal_field
      gaincal_field: gaincal_field
      bpasscal_field: bpasscal_field
      refant: refant
      setmodel_standard: setmodel_standard
      delaycal_field: delaycal_field
      delaycal_solint: delaycal_solint
      delaycal_combine: delaycal_combine
      pre_bpasscal_solint: pre_bpasscal_solint
      pre_bpasscal_minsnr: pre_bpasscal_minsnr
      pre_gaincal_solint: pre_gaincal_solint
      pre_gaincal_minsnr: pre_gaincal_minsnr
      bpasscal_solint: bpasscal_solint
      bpasscal_interp: bpasscal_interp
      bpasscal_combine: bpasscal_combine
      bpasscal_fillgaps: bpasscal_fillgaps
      bpasscal_minsnr: bpasscal_minsnr
      gaincal_combine: gaincal_combine
      gaincal_solint: gaincal_solint
      gaincal_minsnr: gaincal_minsnr
      gaincal_interp: gaincal_interp
      apply_bpass: apply_bpass
      apply_gaincal: apply_gaincal
      apply_target: apply_target
      applymode: applymode
      uvrange: uvrange
    out: [crosscal_ms]
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
