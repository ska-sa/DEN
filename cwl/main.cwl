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
  target_field: string
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
# Inspect 1GC
  inspect_avgchannel: string
  inspect_avgtime: string
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
  delay_plot:
    type: File[]
    outputSource: inspect/delay_plot
  bpass_amp_plot:
    type: File[]
    outputSource: inspect/bpass_amp_plot
  bpass_phase_plot:
   type: File[]
   outputSource: inspect/bpass_phase_plot
  gain_amp_plot:
    type: File[]
    outputSource: inspect/gain_amp_plot
  gain_phase_plot:
    type: File[]
  ampuvwave_plot:
    type: File[]
    outputSource: inspect/gain_phase_plot
  ap_plot:
    type: File[]
    outputSource: inspect/ap_plot
  ampuvwave_plot:
    type: File[]
    outputSource: inspect/ampuvwave_plot
  phaseuvwave_plot: 
    type: File[]
    outputSource: inspect/phaseuvwave_plot 
  ampant_plot:
    type: File[]
    outputSource: inspect/ampant_plot
  ampscan_gcal_plot:
    type: File[]
    outputSource: inspect/ampscan_gcal_plot 
  ampscan_target_plot:
    type: File[]
    outputSource: inspect/ampscan_target_plot
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

  crosscal:
    run: workflows/crosscal.cwl
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
      target_field: target_field
     
    out: [crosscal_ms,delaytable,bpasstable,gaintable]


  inspect:
    run: workflows/inspect.cwl
    in:
      vis: crosscal/crosscal_ms
      avgchannel: inspect_avgchannel
      avgtime: inspect_avgtime
      gaincal_field: gaincal_field
      target_field: target_field
      bpasstable: crosscal/bpasstable
      gaintable: crosscal/gaintable
      delaytable: crosscal/delaytable
    out: [delay_plot,bpass_amp_plot,bpass_phase_plot,gain_amp_plot,gain_phase_plot,ap_plot,ampuvwave_plot,phaseuvwave_plot,ampant_plot,ampscan_gcal_plot,ampscan_target_plot]
     

  selfcal:
    run: workflows/selfcal.cwl
    in:
      ms: crosscal/crosscal_ms
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
