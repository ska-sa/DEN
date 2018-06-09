cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement
  - class: MultipleInputFeatureRequirement
  - class: SchemaDefRequirement
    types:
      - $import: ../types/types.yaml


inputs:
  vis: Directory
  gaincal_field: string
  target_field: string
  delaytable: Directory
  bpasstable: Directory
  gaintable: Directory
  plotprefix: string
  avgchannel: int
  avgtime: string

outputs:
  delay_plot:
    type: File[]
    outputSource: plotdelay/plotfile
  bpass_amp_plot:
    type: File[]
    outputSource: plotbpass_amp/plotfile
  bpass_phase_plot:
    type: File[]
    outputSource: plotbpass_phase/plotfile
  gain_amp_plot:
    type: File[]
    outputSource: plotgain_amp/plotfile
  gain_phase_plot:
    type: File[]
    outputSource: plotgain_phase/plotfile
  ap_plot:
    type: File[]
    outputSource: plotvis_ap/plotfiles
  phaseuvwave_plot:
    type: File[]
    outputSource: plotvis_phaseuvwave/plotfiles
  ampuvwave_plot:
    type: File[]
    outputSource: plotvis_ampuvwave/plotfiles
  ampant_plot:
    type: File[]
    outputSource: plotvis_ampant/plotfiles
  ampscan_gcal_plot:
    type: File[]
    outputSource: plotvis_ampscan_gcal/plotfiles
  ampscan_target_plot:
    type: File[]
    outputSource: plotvis_ampscan_target/plotfiles

steps:
  plotdelay:
    run: ../steps/casa_plotcal.cwl
    in:
      caltable: delaytable
      xaxis:
       valueFrom: time
      yaxis:
         valueFrom: delay
      figfile:
        valueFrom: $(inputs.plotprefix)-delaycal.png
    out: [plotfile]

  plotbpass_amp:
    run: ../steps/casa_plotcal.cwl
    in:
      caltable: bpasstable
      xaxis:
        valueFrom: chan
      yaxis:
        valueFrom: amp
      figfile:
        valueFrom: $(inputs.plotprefix)-bpasscal-amp.png
    out: [plotfile]

  plotbpass_phase:
    run: ../steps/casa_plotcal.cwl
    in:
      caltable: bpasstable
      xasis:
        valueFrom: chan
      yaxis:
        valueFrom: phase
      figfile:
        valueFrom: $(inputs.plotprefix)-bpasscal-phase.png
    out: [plotfile]

  plotgain_amp:
    run: ../steps/casa_plotcal.cwl
    in:
      caltable: gaintable
      xasis:
        valueFrom: time
      yaxis:
        valueFrom: amp
      figfile:
        valueFrom: $(inputs.plotprefix)-gaincal-amp.png
    out: [plotfile]

  plotgain_phase:
    run: ../steps/casa_plotcal.cwl
    in:
      caltable: gaintable
      xasis:
        valueFrom: time
      yaxis:
        valueFrom: phase
      figfile:
        valueFrom: $(inputs.plotprefix)-gaincal-phase.png
    out: [plotfile]

  plotvis_ap:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: phase
      yaxis:
        valueFrom: amp
      field: gaincal_field
      correlation:
        valueFrom: XX,YY
      iterxis:
        valueFrom: corr
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-gain-ap.png
    out: [plotfiles]

  plotvis_ampuvwave:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: uvwave
      yaxis:
        valueFrom: amp
      field: gaincal_field
      correlation:
        valueFrom: XX,YY
      iterxis:
        valueFrom: corr
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-ampuvwave.png
    out: [plotfiles]

  plotvis_phaseuvwave:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: uvwave
      yaxis:
        valueFrom: phase
      field: gaincal_field
      correlation:
        valueFrom: XX,YY
      iterxis:
        valueFrom: corr
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-phaseuvwave.png
    out: [plotfiles]

  plotvis_ampant:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: antenna
      yaxis:
        valueFrom: amp
      field: gaincal_field
      correlation:
        valueFrom: XX,YY
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-ampant.png
    out: [plotfiles]

  plotvis_ampscan_gcal:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: scan
      yaxis:
        valueFrom: amp
      field: gaincal_field
      correlation:
        valueFrom: XX,YY
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-ampscan-gcal.png
    out: [plotfiles]

  plotvis_ampscan_target:
    run: ../steps/casa_plotms.cwl
    in:
      vis: vis
      xasis:
        valueFrom: scan
      yaxis:
        valueFrom: amp
      field: target_field
      correlation:
        valueFrom: XX,YY
      avgchannel: avgchannel
      avgtime: avgtime
      plotfile:
        valueFrom: $(inputs.plotprefix)-ampscan_target.png
    out: [plotfiles]
