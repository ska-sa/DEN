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
baseCommand: listobs
stdout: log-casa_listobs.txt

inputs:
  overwrite:
    type: boolean
    doc: "If True, tacitly overwrite listfile if it exists."
  selectdata:
    type: boolean
    doc: "Data selection parameters"
  field:
    type: string
    doc: "Field names or field index numbers. ''==>all, field='0~2,3C286'"
  spw:
    type: string
    doc: "spectral-window/frequency/channel"
  antenna:
    type: string
    doc: "Antenna/baselines: ''==>all, antenna='3,VA04'"
  timerange:
    type: string
    doc: "time range: ''==>all,timerange='09:14:0~09:54:0'"
  correlation:
    type: string
    doc: "Select data based on correlation"
  scan:
    type: string
    doc: "scan numbers: ''==>all"
  intent:
    type: string
    doc: "Select data based on observation intent: ''==>all"
  feed:
    type: string
    doc: "Multi-feed numbers: Not yet implemented"
  array:
    type: string
    doc: "(sub)array numbers: ''==>all"
  uvrange:
    type: string
    doc: "uv range: ''==>all; uvrange ='0~100klambda', default units=meters"
  observation:
    type: string
    doc: "Select data based on observation ID: ''==>all"
  verbose:
    type: boolean
    doc: "Verbose output"
  listunfl:
    type: boolean
    doc: "List unflagged row counts? If true, it can have significant negative performance impact."
  cachesize:
    type: int
    doc: "EXPERIMENTAL. Maximum size in megabytes of cache in which data structures can be held."
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      valueFrom: $(self.basename)

outputs:
  listfile:
    type: File
    doc: "Name of disk file to write output: ''==>to terminal"
    outputBinding:
      glob: listfile
