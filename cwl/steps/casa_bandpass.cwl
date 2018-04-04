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
  spw:
    type: string
    doc: "Spectral windows e.g. '0~3', '' is all"
    inputBinding:
      prefix: -spw
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
    inputBinding:
      prefix: -selectdata
  timerange:
    type: string[]
    doc: "Range of time to select from data, e.g. timerange = 'YYYY/MM/DD/hh:mm:ss~YYYY/MM/DD/hh:mm:ss'"
    inputBinding:
      prefix: -timerange
      separate: true
  uvrange:
    type: string[]
    doc: "Select data within uvrange"
    inputBinding:
      prefix: -uvrange
      separate: true
  antenna:
    type: string[]
    doc: "Select data based on antenna/baseline"
    inputBinding:
      prefix: -antenna
      separate: true
  scan:
    type: string
    doc: "Scan number range"
    inputBinding:
      prefix: -scan
  observation:
    type: string[]
    doc: "Observation ID range"
    inputBinding:
      prefix: -observation
      separate: true
  msselect:
    type: string
    doc: "Optional complex data selection (ignore for now)"
    inputBinding:
      prefix: -msselect
  solint:
    type: string[]
    doc: "Solution interval in time[,freq]"
    inputBinding:
      prefix: -solint
  combine:
    type: string
    doc: "Data axes which to combine for solve (obs, scan, spw, and/or field)"
    inputBinding:
      prefix: -combine
  refant:
    type: string
    doc: "Reference antenna name(s)"
    inputBinding:
      prefix: -refant
  minblperant:
    type: int
    doc: "Minimum baselines _per antenna_ required for solve"
    inputBinding:
      prefix: -minblperant
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
    inputBinding:
      prefix: -minsnr
  solnorm:
    type: boolean
    doc: "Normalize average solution amplitudes to 1.0"
    inputBinding:
      prefix: -solnorm
  bandtype:
    type:
      type: enum
      symbols: [B,BPOLY]
    doc: "Type of bandpass solution (B or BPOLY)"
    inputBinding:
      prefix: -bandtype
  fillgaps:
    type: int
    doc: "Fill flagged solution channels by interpolation"
    inputBinding:
      prefix: -fillgaps
  degamp:
    type: int
    doc: "Polynomial degree for BPOLY amplitude solution"
    inputBinding:
      prefix: -degamp
  degphase:
    type: int
    doc: "Polynomial degree for BPOLY phase solution"
    inputBinding:
      prefix: -degphase
  visnorm:
    type: boolean
    doc: "Normalize data prior to BPOLY solution"
    inputBinding:
      prefix: -visnorm
  maskcenter:
    type: int
    doc: "Number of channels to avoid in center of each band"
    inputBinding:
      prefix: -maskcenter
  maskedge:
    type: int
    doc: "Fraction of channels to avoid at each band edge (in %)"
    inputBinding:
      prefix: -maskedge
  smodel:
    type: float[]
    doc: "Point source Stokes parameters for source model."
    inputBinding:
      prefix: -smodel
      separate: true
  append:
    type: boolean
    doc: "Append solutions to the (existing) table"
    inputBinding:
      prefix: -append
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
    doc: "Interpolation mode (in time) to use for each gaintable"
    inputBinding:
      prefix: -interp
      separate: true
  spwmap:
    type: string
    doc: "Spectral windows combinations to form for gaintables(s)"
    inputBinding:
      prefix: -spwmap
      separate: true
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
    inputBinding:
      prefix: -minsnr
  parang:
    type: boolean
    doc: "Apply parallactic angle correction"
    inputBinding:
      prefix: -parang
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      valueFrom: $(self.basename)
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
    inputBinding:
      prefix: -gaintable
      valueFrom: $(self.basename)
  callib:
    type: File
    doc: "Cal Library filename"
    inputBinding:
      prefix: -callib
      valueFrom: $(self.basename)

outputs:
  caltable:
    type: File
    doc: "Name of output gain calibration table"
    outputBinding:
      glob: caltable
