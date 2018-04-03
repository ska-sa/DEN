## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.vis)
      writable: true

baseCommand: applycal
stdout: log-casa_applycal.txt

inputs:
  field:
    type: string
    doc: "Select field using field id(s) or field name(s)"
    inputBinding:
      prefix: -field
  spw:
    type: string
    doc: "Select spectral window/channels"
    inputBinding:
      prefix: -spw
  intent:
    type: string
    doc: "Select observing intent"
    inputBinding:
      prefix: -intent
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
    inputBinding:
      prefix: -selectdata
  timerange:
    type: string
    doc: "Select data based on time range"
    inputBinding:
      prefix: -timerange
  uvrange:
    type: string
    doc: "Select data within uvrange (default units meters)"
    inputBinding:
      prefix: -uvrange
  antenna:
    type: string
    doc: "Select data based on antenna/baseline"
    inputBinding:
      prefix: -antenna
  scan:
    type: string
    doc: "Scan number range"
    inputBinding:
      prefix: -scan
  observation:
    type: string
    doc: "Select by observation ID(s)"
    inputBinding:
      prefix: -observation
  msselect:
    type: string
    doc: "Optional complex data selection (ignore for now)"
    inputBinding:
      prefix: -msselect
  docallib:
    type: boolean
    doc: "Use callib or traditional cal apply parameters"
    inputBinding:
      prefix: -docallib
  gainfield:
    type: string[]
    doc: "Select a subset of calibrators from gaintable(s)"
    inputBinding:
      prefix: -gainfield
  interp:
    type: string[]
    doc: "Temporal interpolation for each gaintable (=linear)"
    inputBinding:
      prefix: -interp
      separate: true
  spwmap:
    type: string
    doc: "Spectral windows combinations to form for gaintables(s)"
    inputBinding:
      prefix: -spwmap
      separate: true
  calwt:
    type: boolean[]
    doc: "Calibrate data weights per gaintable."
    inputBinding:
      prefix: -calwt
      separate: true
  parang:
    type: boolean
    doc: "Apply parallactic angle correction on the fly"
    inputBinding:
      prefix: -parang
  applymode:
    type:
      type: enum
      symbols: [calflag,calflagstrict,trial,flagonly,flagonlystrict,calonly]
    doc: "Calibration mode: '' = 'calflag','calflagstrict','trial','flagonly','flagonlystrict', or 'calonly'"
    inputBinding:
      prefix: -applymode
  flagbackup:
    type: boolean
    doc: "Automatically back up the state of flags before the run?"
    inputBinding:
      prefix: -flagbackup
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      valueFrom: $(self.basename)
  callib:
    type: File
    doc: "Cal Library filename"
    inputBinding:
      prefix: -callib
      valueFrom: $(self.basename)
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
    inputBinding:
      prefix: -gaintable
      valueFrom: $(self.basename)

outputs:
  vis_out:
    type: Directory
    outputBinding:
      glob: $( inputs.vis.basename )
