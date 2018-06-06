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
  vis: Directory
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


outputs:
  crosscal_ms:
    type: Directory
    outputSource: applycal_target_field/vis_out


steps:
  setmodel:
    run: ../steps/casa_setjy.cwl
    in:
      vis: vis
      field: setmodel_field
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
    run: ../steps/casa_bandpass_1.cwl
    in:
      vis: setmodel/vis_out
      field: bpasscal_field
      solint: bpasscal_solint
      combine: bpasscal_combine
      bandtype:
        valueFrom: "B"
      minsnr: bpasscal_minsnr
      fillgaps: bpasscal_fillgaps
      gaintable: [delaycal/caltable]
      caltable_name:
        valueFrom: bpasscal_table.B0
      uvrange: uvrange
    out: 
      [caltable]

  gaincal:
    run: ../steps/casa_gaincal.cwl
    in: 
      vis: setmodel/vis_out
      field: gaincal_field
      solint: gaincal_solint
      combine: gaincal_combine
      gaintype: 
        valueFrom: "G"
      minsnr: gaincal_minsnr
      gaintable: [delaycal/caltable,bpasscal/caltable]
      caltable_name:
        valueFrom: gaintable.G0
      uvrange: uvrange
    out:
      [caltable]

  applycal_gaincal_field:
    run: ../steps/casa_applycal.cwl
    in:
      vis: setmodel/vis_out
      field: gaincal_field
      gaintable: [delaycal/caltable,bpasscal/caltable,gaincal/caltable]
      gainfield: [delaycal_field,bpasscal_field,gaincal_field]
#      interp:
#        valueFrom: [linear, linear, linear]
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
      gaintable: [delaycal/caltable,bpasscal/caltable,gaincal/caltable]
      gainfield: [delaycal_field,bpasscal_field,gaincal_field]
#      interp:
#        valueFrom: [linear, linear, linear]
      applymode: applymode
      parang:
        valueFrom: $(false)
    out:
      [vis_out]
