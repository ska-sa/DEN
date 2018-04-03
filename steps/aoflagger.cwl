## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: stimela/aoflagger:0.3.2
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.msname)
      writable: true
    listing:
    - entry: $(inputs.strategy)
      writable: false
baseCommand: aoflagger
stdout: log-autoflagger.txt

inputs:
  v:
    type: boolean
    doc: "Produce verbose output"
    inputBinding:
      prefix: -v
      position: 1
  j:
    type: int
    doc: "overrides the number of threads specified in the strategy (default: one thread for each CPU core)"
    inputBinding:
      prefix: -j
      position: 2
  indirect-read:
    type: boolean
    doc: "will reorder the measurement set before starting, which is normally faster but requires free disk space to reorder the data to"
    inputBinding:
      prefix: -indirect-read
      position: 4
  memory-read:
    type: boolean
    doc: "will read the entire measurement set in memory. This is the fastest, but requires much memory."
    inputBinding:
      prefix: -memory-read
      position: 5
  auto-read-mode:
    type: boolean
    doc: "will select either memory or direct mode based on available memory"
    inputBinding:
      prefix: -auto-read-mode
      position: 6
  uvw:
    type: boolean
    doc: "reads uvw values (some exotic strategies require these)"
    inputBinding:
      prefix: -uvw
      position: 7
  column:
    type: string
    doc: "specify column to flag"
    inputBinding:
      prefix: -column
      position: 8
  skip-flagged:
    type: boolean
    doc: "will skip an ms if it has already been processed by AOFlagger according to its HISTORY table."
    inputBinding:
      prefix: -skip-flagged
      position: 9
  bands:
    type: int[]
    doc: "comma separated list of (zero-indexed) band ids to process"
    inputBinding:
      prefix: -bands
      separate: true
      position: 10
  fields:
    type: string[]
    doc: "Field ID(s). Comma separated string if more than one field"
    inputBinding:
      prefix: -fields
      position: 11
  msname:
    type: File[]
    doc: "MS name(s) to be flagged"
    inputBinding:
      prefix: -msname
      position: 12
      valueFrom: $(self.basename)
  strategy:
    type: File
    doc: "specifies a possible customized strategy"
    inputBinding:
      prefix: -strategy
      position: 13
      valueFrom: $(self.basename)

outputs:
