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
baseCommand: gaincal
stdout: log-casa_gaincal.txt

inputs:
  field:
    type: string
    doc: "Select field using field id(s) or field name(s)"
    inputBinding:
      prefix: -field
      position: 2
  spw:
    type: string
    doc: "Select spectral window/channels"
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
  solint:
    type: string[]
    doc: "Solution interval: egs. 'inf', '60s' (see help)"
    inputBinding:
      prefix: -solint
      position: 11
  combine:
    type: string
    doc: "Data axes which to combine for solve (obs, scan, spw, and/or, field)"
    inputBinding:
      prefix: -combine
      position: 12
  preavg:
    type: float
    doc: "Pre-averaging interval (sec) (rarely needed)"
    inputBinding:
      prefix: -preavg
      position: 13
  refant:
    type: string
    doc: "Reference antenna name(s)"
    inputBinding:
      prefix: -refant
      position: 14
  minblperant:
    type: int
    doc: "Minimum baselines _per antenna_ required for solve"
    inputBinding:
      prefix: -minblperant
      position: 15
  minsnr:
    type: float
    doc: "Reject solutions below this SNR"
    inputBinding:
      prefix: -minsnr
      position: 16
  solnorm:
    type: boolean
    doc: "Normalize average solution amplitudes to 1.0 (G, T only)"
    inputBinding:
      prefix: -solnorm
      position: 17
  gaintype:
    type:
      type: enum
      symbols: [G,T,GSPLINE,K,KCROSS]
    doc: "Type of gain solution (G,T,GSPLINE,K,KCROSS)"
    inputBinding:
      prefix: -gaintype
      position: 18
  splinetime:
    type: float
    doc: "Spline timescale(sec); All spw's are first averaged."
    inputBinding:
      prefix: -splinetime
      position: 19
  npointaver:
    type: int
    doc: "The phase-unwrapping algorithm"
    inputBinding:
      prefix: -npointaver
      position: 20
  phasewrap:
    type: float
    doc: "Wrap the phase for jumps greater than this value (degrees)"
    inputBinding:
      prefix: -phasewrap
      position: 21
  smodel:
    type: string[]
    doc: "Point source Stokes parameters for source model."
    inputBinding:
      prefix: -smodel
      separate: true
      position: 22
  calmode:
    type:
      type: enum
      symbols: [ap,p,a]
    doc: "Type of solution: ('ap', 'p', 'a')"
    inputBinding:
      prefix: -calmode
      position: 23
  append:
    type: boolean
    doc: "Append solutions to the (existing) table"
    inputBinding:
      prefix: -append
      position: 24
  docallib:
    type: boolean
    doc: "Use callib or traditional cal apply parameters"
    inputBinding:
      prefix: -docallib
      position: 25
  gainfield:
    type: string[]
    doc: "Select a subset of calibrators from gaintable(s)"
    inputBinding:
      prefix: -gainfield
      position: 28
  interp:
    type: array
    doc: "Temporal interpolation for each gaintable (=linear)"
    inputBinding:
      prefix: -interp
      position: 29
  spwmap:
    type: array[]
    doc: "Spectral windows combinations to form for gaintables(s)"
    inputBinding:
      prefix: -spwmap
      separate: true
      position: 30
  parang:
    type: boolean
    doc: "Apply parallactic angle correction on the fly"
    inputBinding:
      prefix: -parang
      position: 31
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      position: 32
      valueFrom: $(self.basename)
  callib:
    type: File
    doc: "Cal Library filename"
    inputBinding:
      prefix: -callib
      position: 33
      valueFrom: $(self.basename)
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
    inputBinding:
      prefix: -gaintable
      position: 34
      valueFrom: $(self.basename)

outputs:
  caltable:
    type: File
    doc: "Name of output gain calibration table"
    outputBinding:
      glob: caltable
