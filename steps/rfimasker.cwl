## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.ms)
      writable: true
    listing:
    - entry: $(inputs.mask)
      writable: false
baseCommand: rfimasker
stdout: log-rfimasker.txt

inputs:
  accumulation_mode:
    type:
      type: enum
      symbols: [or,overide]
    doc: "Specifies whether mask should override current flags or be added (or) to the current"
    inputBinding:
      prefix: --accumulation_mode
      position: 2
  statistics:
    type: boolean
    doc: "Computes and reports some statistics about the flagged RFI in the MS"
    inputBinding:
      prefix: --statistics
      position: 3
  memory:
    type: int
    doc: "Maximum memory to consume in MB for the flag buffer"
    inputBinding:
      prefix: --memory
      position: 4
  spwid:
    type: int[]
    doc: "SPW id (or ids if multiple MSs have been specified)"
    inputBinding:
      prefix: --spwid
      separate: true
      position: 5
  uvrange:
    type: string
    doc: "UV range to select (CASA style range: lower~upper) for flagging. Leave blank for entire array"
    inputBinding:
      prefix: --uvrange
      position: 6
  simulate:
    type: boolean
    doc: "Simulate only. Do not apply flags - useful for statistics"
    inputBinding:
      prefix: --simulate
      position: 7
  ms:
    type: File[]
    doc: "MS(s) to flagged"
    inputBinding:
      prefix: --ms
      position: 8
      valueFrom: $(self.basename)
  mask:
    type: File
    doc: "A numpy array of chan x (boolean, channel_centre[float64])"
    inputBinding:
      prefix: --mask
      position: 9
      valueFrom: $(self.basename)

outputs: []
