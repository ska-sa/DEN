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
baseCommand: setjy
stdout: log-casa_setjy.txt

inputs:
  field:
    type: string
    doc: "Field Name(s). Comma separated string of field IDs/names"
    inputBinding:
      prefix: -field
      position: 1
  spw:
    type: string
    doc: "Spectral window identifier (list)"
    inputBinding:
      prefix: -spw
      position: 2
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
    inputBinding:
      prefix: -selectdata
      position: 3
  timerange:
    type: string[]
    doc: "Time range to operate on (for usescratch=T)"
    inputBinding:
      prefix: -timerange
      position: 4
  scan:
    type: string[]
    doc: "Scan number range (for  usescratch=T)"
    inputBinding:
      prefix: -scan
      separate: true
      position: 5
  observation:
    type: string
    doc: "Observation ID range (for  usescratch=T)"
    inputBinding:
      prefix: -observation
      position: 6
  intent:
    type: string
    doc: "Observation intent"
    inputBinding:
      prefix: -intent
      position: 7
  scalebychan:
    type: boolean
    doc: "scale the flux density on a per channel basis or else on a per spw basis"
    inputBinding:
      prefix: -scalebychan
      position: 8
  standard:
    type:
      type: enum
      symbols: [Perley-Butler 2010,Perley-Butler 2013,Baars,Perley 90,Perley-Taylor 95,Perley-Taylor 99,Scaife-Heald 2012,Stevens-Reynolds 2016,Butler-JPL-Horizons 2010,Butler-JPL-Horizons 2012,manual,fluxscale]
    doc: "Flux density standard"
    inputBinding:
      prefix: -standard
      position: 9
  interpolation:
    type:
      type: enum
      symbols: [nearest,linear,cubic,spline]
    doc: "method to be used to interpolate in time"
    inputBinding:
      prefix: -interpolation
      position: 10
  useephemdir:
    type: boolean
    doc: "use directions in the ephemeris table"
    inputBinding:
      prefix: -useephemdir
      position: 11
  fluxdensity:
    type: float[]
    doc: "Specified flux density [I,Q,U,V]; (-1 will lookup values)"
    inputBinding:
      prefix: -fluxdensity
      separate: true
      position: 12
  spix:
    type: string[]
    doc: "Spectral index of fluxdensity"
    inputBinding:
      prefix: -spix
      position: 13
  polindex:
    type: string[]
    doc: "Polarization index of calibrator (taylor expansion modelling frequency dependence, first of which is ratio of sqrt(Q^2+U^2)/I). Auto determined if Q and U are non-zero in fluxdensity option. See NRAO docs."
    inputBinding:
      prefix: -polindex
      position: 14
  polangle:
    type: string[]
    doc: "Polarization angle (rads) of calibrator (taylor expansion modelling frequency dependence, first of which is 0.5*arctan(U/Q). Should be specified in combination with polindex option. Ignored if fluxdensity specified non-zero coefficients for Q and U. See NRAO docs."
    inputBinding:
      prefix: -polangle
      position: 15
  reffreq:
    type: string
    doc: "Reference frequency for spix"
    inputBinding:
      prefix: -reffreq
      position: 16
  fluxdict:
    type: string
    doc: "output dictionary from fluxscale(NB: this is a dictionary)"
    inputBinding:
      prefix: -fluxdict
      position: 17
  listmodels:
    type: boolean
    doc: "List the available modimages for VLA calibrators or Tb models for Solar System objects"
    inputBinding:
      prefix: -listmodels
      position: 18
  model:
    type: string
    doc: "File location for field model"
    inputBinding:
      prefix: -model
      position: 19
  usescratch:
    type: boolean
    doc: "Will create if necessary and use the MODEL_DATA"
    inputBinding:
      prefix: -usescratch
      position: 20
  vis:
    type: File
    doc: "Name of input visibility file"
    inputBinding:
      prefix: -vis
      position: 21
      valueFrom: $(self.basename)

outputs: []
