## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.vis)
      writable: true
    listing:
    - entry: $(inputs.callib)
      writable: false
    listing:
    - entry: $(inputs.gaintable)
      writable: false
baseCommand: applycal
stdout: log-casa_applycal.txt

inputs:
  field:
    type: string
    doc: "Select field using field id(s) or field name(s)"
    inputBinding:
      prefix: -field
      position: 1
  spw:
    type: string
    doc: "Select spectral window/channels"
    inputBinding:
      prefix: -spw
      position: 2
  intent:
    type: string
    doc: "Select observing intent"
    inputBinding:
      prefix: -intent
      position: 3
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
    inputBinding:
      prefix: -selectdata
      position: 4
  timerange:
    type: string
    doc: "Select data based on time range"
    inputBinding:
      prefix: -timerange
      position: 5
  uvrange:
    type: string
    doc: "Select data within uvrange (default units meters)"
    inputBinding:
      prefix: -uvrange
      position: 6
  antenna:
    type: string
    doc: "Select data based on antenna/baseline"
    inputBinding:
      prefix: -antenna
      position: 7
  scan:
    type: string
    doc: "Scan number range"
    inputBinding:
      prefix: -scan
      position: 8
  observation:
    type: string
    doc: "Select by observation ID(s)"
    inputBinding:
      prefix: -observation
      position: 9
  msselect:
    type: string
    doc: "Optional complex data selection (ignore for now)"
    inputBinding:
      prefix: -msselect
      position: 10
  docallib:
    type: boolean
    doc: "Use callib or traditional cal apply parameters"
    inputBinding:
      prefix: -docallib
      position: 11
  gainfield:
    type: string[]
    doc: "Select a subset of calibrators from gaintable(s)"
    inputBinding:
      prefix: -gainfield
      position: 14
  interp:
    type: string[]
    doc: "Temporal interpolation for each gaintable (=linear)"
    inputBinding:
      prefix: -interp
      separate: true
      position: 15
  spwmap:
    type: array[]
    doc: "Spectral windows combinations to form for gaintables(s)"
    inputBinding:
      prefix: -spwmap
      separate: true
      position: 16
  calwt:
    type: boolean[]
    doc: "Calibrate data weights per gaintable."
    inputBinding:
      prefix: -calwt
      separate: true
      position: 17
  parang:
    type: boolean
    doc: "Apply parallactic angle correction on the fly"
    inputBinding:
      prefix: -parang
      position: 18
  applymode:
    type:
      type: enum
      symbols: [calflag,calflagstrict,trial,flagonly,flagonlystrict,calonly]
    doc: "Calibration mode: '' = 'calflag','calflagstrict','trial','flagonly','flagonlystrict', or 'calonly'"
    inputBinding:
      prefix: -applymode
      position: 19
  flagbackup:
    type: boolean
    doc: "Automatically back up the state of flags before the run?"
    inputBinding:
      prefix: -flagbackup
      position: 20
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      position: 21
      valueFrom: $(self.basename)
  callib:
    type: File
    doc: "Cal Library filename"
    inputBinding:
      prefix: -callib
      position: 22
      valueFrom: $(self.basename)
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
    inputBinding:
      prefix: -gaintable
      position: 23
      valueFrom: $(self.basename)

outputs:
