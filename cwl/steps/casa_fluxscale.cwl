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
  transfer:
    type: string[]
    doc: "Transfer field name(s) (transfer flux scale TO), '' -> all"
  append:
    type: boolean
    doc: "Append solutions?"
  refspwmap:
    type: string[]
    doc: "Scale across spectral window boundaries.  See help fluxscale"
  incremental:
    type: boolean
    doc: "incremental caltable"
  fitorder:
    type: int
    doc: "order of spectral fitting"
  vis:
    type: File
    doc: "Name of input visibility file (MS)"
  caltable:
    type: File
    doc: "Name of input calibration table"
  listfile:
    type: File
    doc: "Name of listfile that contains the fit information. Default is (no file)."

outputs:
  fluxtable:
    type: File
    doc: "Name of output, flux-scaled calibration table"
    outputBinding:
      glob: fluxtable
