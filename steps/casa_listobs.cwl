## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: stimela/casa:0.3.2
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.vis)
      writable: true
baseCommand: listobs
stdout: log-casa_listobs.txt

inputs:
  overwrite:
    type: boolean
    doc: "If True, tacitly overwrite listfile if it exists."
    inputBinding:
      prefix: -overwrite
      position: 2
  selectdata:
    type: boolean
    doc: "Data selection parameters"
    inputBinding:
      prefix: -selectdata
      position: 3
  field:
    type: string
    doc: "Field names or field index numbers. ''==>all, field='0~2,3C286'"
    inputBinding:
      prefix: -field
      position: 4
  spw:
    type: string
    doc: "spectral-window/frequency/channel"
    inputBinding:
      prefix: -spw
      position: 5
  antenna:
    type: string
    doc: "Antenna/baselines: ''==>all, antenna='3,VA04'"
    inputBinding:
      prefix: -antenna
      position: 6
  timerange:
    type: string
    doc: "time range: ''==>all,timerange='09:14:0~09:54:0'"
    inputBinding:
      prefix: -timerange
      position: 7
  correlation:
    type: string
    doc: "Select data based on correlation"
    inputBinding:
      prefix: -correlation
      position: 8
  scan:
    type: string
    doc: "scan numbers: ''==>all"
    inputBinding:
      prefix: -scan
      position: 9
  intent:
    type: string
    doc: "Select data based on observation intent: ''==>all"
    inputBinding:
      prefix: -intent
      position: 10
  feed:
    type: string
    doc: "Multi-feed numbers: Not yet implemented"
    inputBinding:
      prefix: -feed
      position: 11
  array:
    type: string
    doc: "(sub)array numbers: ''==>all"
    inputBinding:
      prefix: -array
      position: 12
  uvrange:
    type: string
    doc: "uv range: ''==>all; uvrange ='0~100klambda', default units=meters"
    inputBinding:
      prefix: -uvrange
      position: 13
  observation:
    type: string
    doc: "Select data based on observation ID: ''==>all"
    inputBinding:
      prefix: -observation
      position: 14
  verbose:
    type: boolean
    doc: "Verbose output"
    inputBinding:
      prefix: -verbose
      position: 15
  listunfl:
    type: boolean
    doc: "List unflagged row counts? If true, it can have significant negative performance impact."
    inputBinding:
      prefix: -listunfl
      position: 16
  cachesize:
    type: int
    doc: "EXPERIMENTAL. Maximum size in megabytes of cache in which data structures can be held."
    inputBinding:
      prefix: -cachesize
      position: 17
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      position: 18
      valueFrom: $(self.basename)

outputs:
  listfile:
    type: File
    doc: "Name of disk file to write output: ''==>to terminal"
    outputBinding:
      glob: listfile
