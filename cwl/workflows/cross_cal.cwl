cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: MultipleInputFeatureRequirement
  - class: SchemaDefRequirement
    types:
      - $import: ../types/types.yaml

inputs:
  ms: Directory
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


outputs:
  crosscal_ms:
    type: Directory
    outputSource: applycal_target_field/vis_out


steps:
  setmodel:
    run: ../steps/casa_setjy.cwl
    in:
      vis: ms
      field: fluxcal_field
      standard: setmodel_standard
      scalebychan: 
        valueFrom: $(true)
      usescratch:
        valueFrom: $(true)
    out: 
      [vis_out]

  delaycal:
    run: ../steps/casa_gaincal.cwl
    in:
      vis: setmodel/vis_out
      field: delaycal_field
      solint: delaycal_solint
      combine:
        valueFrom: ""
      refant: refant
      gaintype:
        valueFrom: K
      uvrange: uvrange
      caltable_name:
        valueFrom: delaycal_table.K0
    out:
       [caltable]

  bpasscal:
    run: ../steps/casa_bandpass.cwl
    in:
      vis: delaycal/vis_out
      field: bpasscal_field
      solint: bpasscal_solint
      combine: bpasscal_combine
      bandtype:
        valueFrom: "B"
      minsnr: bpasscal_minsnr
#      interp: bpasscal_interp
      fillgaps: bpasscal_fillgaps
      gaintable: [delaycal/caltable]
      caltable_name:
        valueFrom: bpasscal_table.B0
      uvrange: uvrange
    out: 
      [caltable]

  gaincal_flux:
    run: ../steps/casa_gaincal.cwl
    in: 
      vis: setmodel/vis_out
      field: gaincal_field
      solint: gaincal_solint
      combine: gaincal_combine
      gaintype: 
        valueFrom: "G"
      minsnr: gaincal_minsnr
#      interp: gaincal_interp
      gaintable: [delaycal/caltable,bpasscal/caltable]
      caltable_name:
        valueFrom: gaintable.G0
      uvrange: uvrange
    out:
      [caltable]

  gaincal_gain:
    run: ../steps/casa_gaincal.cwl
    in: 
      vis: setmodel/vis_out
      field: gaincal_field
      solint: gaincal_solint
      ombine: gaincal_combine
      gaintype:
        valueFrom: "G"
      minsnr: bpasscal_minsnr
      interp: bpasscal_interp
      append:
        valueFrom: $(true)
      gaintable: [delaycal/caltable,bpasscal/caltable]
      caltable_name:
        valueFrom: gaintable.G0
      uvrange: uvrange
    out:
      [caltable]

  fluxscale:
    run: ../steps/casa_fluxscale.cwl
    in:
      vis: setmodel/vis_out
      caltable: gaincal_gain/caltable
      reference: fluxcal_field
      transfer: gaincal_field
      fluxtable_name:
        valueFrom: fluxtable.F0
    out:
      [fluxtable]

  applycal_bpasscal_field:
    run: ../steps/casa_applycal.cwl
    in:
      vis: setmodel/vis_out
      field: bpasscal_field
      gaintable: [delaycal/caltable,bpasscal/caltable,fluxscale/fluxtable]
      gainfield: [delaycal_field,bpasscal_field,gaincal_field]
      interp: apply_bpass
      applymode: applymode
      parang:
        valueFrom: $(false)
    out:
      [vis_out]

  applycal_gaincal_field:
    run: ../steps/casa_applycal.cwl
    in:
      vis: applycal_bpasscal_field/vis_out
      field: gaincal_field
      gaintable: [delaycal/caltable,bpasscal/caltable,fluxscale/fluxtable]
      gainfield: [delaycal_field,bpasscal_field,gaincal_field]
      interp: apply_gaincal
      applymode: applymode
      parang:
        valueFrom: $(false)
    out:
      [vis_out]

  applycal_target_field:
    run: ../steps/casa_applycal.cwl
    in:
      vis: applycal_gaincal_field/vis_out
      field: gaincal_field
      gaintable: [delaycal/caltable,bpasscal/caltable,fluxscale/fluxtable]
      gainfield: [delaycal_field,bpasscal_field,gaincal_field]
      interp: apply_target
      applymode: applymode
      parang:
        valueFrom: $(false)
    out:
      [vis_out]
