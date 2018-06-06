cwlVersion: v1.0
class: Workflow


requirements:
  - class: SubworkflowFeatureRequirement
  - class: SchemaDefRequirement
    types:
      - $import: ../cwl/types/types.yaml


inputs:
  mstar: File
# Flagging
  quackinterval: float
  quackmode: ../cwl/types/types.yaml#quackmode?
  autoflag_strategy: File
  autoflag_column: string
  autoflag_fields: string
# Cross clibration
  refant: string
  uvrange: string
  setmodel_standard: string
  setmodel_field: string
  delaycal_field: string
  delaycal_solint: string
  delaycal_combine: string
  bpasscal_field: string
  bpasscal_solint: string
  bpasscal_combine: string
  bpasscal_fillgaps: int
  bpasscal_minsnr: float
  gaincal_field: string
  gaincal_combine: string
  gaincal_solint: string
  gaincal_minsnr: float
  applymode: string
# Self calibration
  image_name: string
  npix: int[]
  scale: string
  niter: int
  weight: string[]
  channelsout: int
  joinchannels: boolean
  auto_mask: float
  auto_threshold: float
  image_column: string
  image_field: int


outputs:
  calimage:
    type: File[]
    outputSource: selfcal/outimage
  
steps:

  untar:
    run: steps/untar.cwl
    in:
      mstar: mstar
    out: [ms]

  flagging:
    run: workflows/flagging.cwl
    in:
      ms: untar/ms
      quackinterval: quackinterval
      autoflag_strategy: autoflag_strategy
      autoflag_column: autoflag_column
      autoflag_fields: autoflag_fields

    out: [flagged_ms]

  cross_cal:
    run: workflows/cross_cal.cwl
    in:
      vis: flagging/flagged_ms
      refant: refant
      uvrange: uvrange
      setmodel_standard: setmodel_standard
      setmodel_field: setmodel_field
      delaycal_field: delaycal_field
      delaycal_solint: delaycal_solint
      delaycal_combine: delaycal_combine
      bpasscal_field: bpasscal_field
      bpasscal_solint: bpasscal_solint
      bpasscal_combine: bpasscal_combine
      bpasscal_fillgaps: bpasscal_fillgaps
      bpasscal_minsnr: bpasscal_minsnr
      gaincal_field: gaincal_field
      gaincal_combine: gaincal_combine
      gaincal_solint: gaincal_solint
      gaincal_minsnr: gaincal_minsnr
      applymode: applymode
     
    out: [crosscal_ms]


  selfcal:
    run: workflows/selfcal.cwl
    in:
      ms: cross_cal/crosscal_ms
      image_name: image_name
      npix: npix
      scale: scale
      niter: niter
      weight: weight
      channelsout: channelsout
      joinchannels: joinchannels
      auto_mask: auto_mask
      auto_threshold: auto_threshold
      image_column: image_column
      image_field: image_field

    out: [outimage]
