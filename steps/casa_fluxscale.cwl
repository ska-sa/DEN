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
    - entry: $(inputs.caltable)
      writable: false
    listing:
    - entry: $(inputs.listfile)
      writable: false
baseCommand: fluxscale
stdout: log-casa_fluxscale.txt

inputs:
  reference:
    type: string[]
    doc: "Reference field name(s) (transfer flux scale FROM)"
    inputBinding:
      prefix: -reference
      separate: true
      position: 3
  transfer:
    type: string[]
    doc: "Transfer field name(s) (transfer flux scale TO), '' -> all"
    inputBinding:
      prefix: -transfer
      separate: true
      position: 4
  append:
    type: boolean
    doc: "Append solutions?"
    inputBinding:
      prefix: -append
      position: 6
  refspwmap:
    type: string[]
    doc: "Scale across spectral window boundaries.  See help fluxscale"
    inputBinding:
      prefix: -refspwmap
      separate: true
      position: 7
  incremental:
    type: boolean
    doc: "incremental caltable"
    inputBinding:
      prefix: -incremental
      position: 8
  fitorder:
    type: int
    doc: "order of spectral fitting"
    inputBinding:
      prefix: -fitorder
      position: 9
  vis:
    type: File
    doc: "Name of input visibility file (MS)"
    inputBinding:
      prefix: -vis
      position: 10
      valueFrom: $(self.basename)
  caltable:
    type: File
    doc: "Name of input calibration table"
    inputBinding:
      prefix: -caltable
      position: 11
      valueFrom: $(self.basename)
  listfile:
    type: File
    doc: "Name of listfile that contains the fit information. Default is (no file)."
    inputBinding:
      prefix: -listfile
      position: 12
      valueFrom: $(self.basename)

outputs:
  fluxtable:
    type: File
    doc: "Name of output, flux-scaled calibration table"
    outputBinding:
      glob: fluxtable
