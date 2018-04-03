## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.input-skymodel)
      writable: false
baseCommand: tigger-tag
stdout: log-tigger_tag.txt

inputs:
  tag:
    type: string
    doc: "Tag"
    inputBinding:
      prefix: --tag
      position: 2
  force:
    type: boolean
    doc: "Saves changes to model without prompting. Default is to prompt."
    inputBinding:
      prefix: --force
      position: 3
  transfer-tags:
    type: boolean
    doc: "Transfers tags from a reference 'input-skymodel' to the 'output-skymodel/output'. That is, for every tag in the given list, finds all sources with those tags in the reference LSM,  then applies these tags to all nearby sources in LSM  (within a radius of 'tolerance' [ARCSEC]).  Saves the result to an LSM file given by -o/--output."
    inputBinding:
      prefix: --transfer-tags
      position: 4
  tolerance:
    type: float
    doc: "Tolerance for transfer tags. In arcseconds"
    inputBinding:
      prefix: --tolerance
      position: 5
  debug:
    type: int
    doc: "(for debugging Python code) sets verbosity level of the named Python context. May be used multiple times."
    inputBinding:
      prefix: --debug
      position: 6
  input-skymodel:
    type: File
    doc: "Input sky model"
    inputBinding:
      prefix: --input-skymodel
      position: 7
      valueFrom: $(self.basename)

outputs:
  output:
    type: File
    doc: "Saves changes to different output model. Default is to save in place."
    outputBinding:
      glob: output
