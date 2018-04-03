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
    listing:
    - entry: $(inputs.gaintable)
      writable: false
    listing:
    - entry: $(inputs.callib)
      writable: false
baseCommand: bandpass
stdout: log-casa_bandpass.txt

inputs:
  field:
    type: string
    doc: "Field Name or id"
    inputBinding:
      prefix: -field
      position: 2
  spw:
    type: string
    doc: "Spectral windows e.g. '0~3', '' is all"
    inputBinding:
      prefix: -spw
      position: 3
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
    inputBinding:
      prefix: -selectdata
      position: 4
  timerange:
    type: string[]
    doc: "Range of time to select from data, e.g. timerange = 'YYYY/MM/DD/hh:mm:ss~YYYY/MM/DD/hh:mm:ss'"
    inputBinding:
      prefix: -timerange
      separate: true
      position: 5
  uvrange:
    type: string[]
    doc: "Select data within uvrange"
    inputBinding:
      prefix: -uvrange
      separate: true
      position: 6
  antenna:
    type: string[]
    doc: "Select data based on antenna/baseline"
    inputBinding:
      prefix: -antenna
      separate: true
      position: 7
  scan:
    type: string
    doc: "Scan number range"
    inputBinding:
      prefix: -scan
      position: 8
  observation:
    type: string[]
    doc: "Observation ID range"
    inputBinding:
      prefix: -observation
      separate: true
      position: 9
  msselect:
    type: string
    doc: "Optional complex data selection (ignore for now)"
    inputBinding:
      prefix: -msselect
      position: 10
  solint:
    type: string[]
    doc: "Solution interval in time[,freq]"
    inputBinding:
      prefix: -solint
      position: 11
  combine:
    type: string
    doc: "Data axes which to combine for solve (obs, scan, spw, and/or field)"
    inputBinding:
      prefix: -combine
      position: 12
  refant:
    type: string
    doc: "Reference antenna name(s)"
    inputBinding:
      prefix: -refant
      position: 13
  minblperant:
    type: int
    doc: "Minimum baselines _per antenna_ required for solve"
    inputBinding:
      prefix: -minblperant
      position: 14
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
    inputBinding:
      prefix: -minsnr
      position: 15
  solnorm:
    type: boolean
    doc: "Normalize average solution amplitudes to 1.0"
    inputBinding:
      prefix: -solnorm
      position: 16
  bandtype:
    type:
      type: enum
      symbols: [B,BPOLY]
    doc: "Type of bandpass solution (B or BPOLY)"
    inputBinding:
      prefix: -bandtype
      position: 17
  fillgaps:
    type: int
    doc: "Fill flagged solution channels by interpolation"
    inputBinding:
      prefix: -fillgaps
      position: 18
  degamp:
    type: int
    doc: "Polynomial degree for BPOLY amplitude solution"
    inputBinding:
      prefix: -degamp
      position: 19
  degphase:
    type: int
    doc: "Polynomial degree for BPOLY phase solution"
    inputBinding:
      prefix: -degphase
      position: 20
  visnorm:
    type: boolean
    doc: "Normalize data prior to BPOLY solution"
    inputBinding:
      prefix: -visnorm
      position: 21
  maskcenter:
    type: int
    doc: "Number of channels to avoid in center of each band"
    inputBinding:
      prefix: -maskcenter
      position: 22
  maskedge:
    type: int
    doc: "Fraction of channels to avoid at each band edge (in %)"
    inputBinding:
      prefix: -maskedge
      position: 23
  smodel:
    type: float[]
    doc: "Point source Stokes parameters for source model."
    inputBinding:
      prefix: -smodel
      separate: true
      position: 24
  append:
    type: boolean
    doc: "Append solutions to the (existing) table"
    inputBinding:
      prefix: -append
      position: 25
  docallib:
    type: boolean
    doc: "Use callib or traditional cal apply parameters"
    inputBinding:
      prefix: -docallib
      position: 26
  gainfield:
    type: string[]
    doc: "Select a subset of calibrators from gaintable(s)"
    inputBinding:
      prefix: -gainfield
      position: 28
  interp:
    type: string[]
    doc: "Interpolation mode (in time) to use for each gaintable"
    inputBinding:
      prefix: -interp
      separate: true
      position: 29
  spwmap:
    type: array[]
    doc: "Spectral windows combinations to form for gaintables(s)"
    inputBinding:
      prefix: -spwmap
      separate: true
      position: 30
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
    inputBinding:
      prefix: -minsnr
      position: 32
  parang:
    type: boolean
    doc: "Apply parallactic angle correction"
    inputBinding:
      prefix: -parang
      position: 33
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      position: 34
      valueFrom: $(self.basename)
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
    inputBinding:
      prefix: -gaintable
      position: 35
      valueFrom: $(self.basename)
  callib:
    type: File
    doc: "Cal Library filename"
    inputBinding:
      prefix: -callib
      position: 36
      valueFrom: $(self.basename)

outputs:
  caltable:
    type: File
    doc: "Name of output gain calibration table"
    outputBinding:
      glob: caltable
