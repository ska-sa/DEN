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
baseCommand: python

arguments:
  - prefix: -c  
    valueFrom: |
      from __future__ import print_function
      import Crasa.Crasa as crasa
      import sys 

      # JavaScript uses lowercase for bools
      true = True
      false = False
      null = None

      args = ${
        var values = {}; 

        for (var key in inputs) {
            var value = inputs[key];
            if (value) {
              if (value.class == 'Directory') {
                values[key] = value.path;
              } else {
                values[key] = value;
              }
            }
        }
        return values;
      }
      print(args, file=sys.stderr)
      task = crasa.CasaTask("bandpass", **args)
      task.run()


inputs:
  field:
    type: string
    doc: "Field Name or id"
  spw:
    type: string
    doc: "Spectral windows e.g. '0~3', '' is all"
  selectdata:
    type: boolean
    doc: "Other data selection parameters"
  timerange:
    type: string[]
    doc: "Range of time to select from data, e.g. timerange = 'YYYY/MM/DD/hh:mm:ss~YYYY/MM/DD/hh:mm:ss'"
    type: string[]
    doc: "Select data within uvrange"
  antenna:
    type: string[]
    doc: "Select data based on antenna/baseline"
  scan:
    type: string
    doc: "Scan number range"
  observation:
    type: string[]
    doc: "Observation ID range"
  msselect:
    type: string
    doc: "Optional complex data selection (ignore for now)"
  solint:
    type: string[]
    doc: "Solution interval in time[,freq]"
  combine:
    type: string
    doc: "Data axes which to combine for solve (obs, scan, spw, and/or field)"
  refant:
    type: string
    doc: "Reference antenna name(s)"
  minblperant:
    type: int
    doc: "Minimum baselines _per antenna_ required for solve"
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
  solnorm:
    type: boolean
    doc: "Normalize average solution amplitudes to 1.0"
  bandtype:
    type:
      type: enum
      symbols: [B,BPOLY]
    doc: "Type of bandpass solution (B or BPOLY)"
  fillgaps:
    type: int
    doc: "Fill flagged solution channels by interpolation"
  degamp:
    type: int
    doc: "Polynomial degree for BPOLY amplitude solution"
  degphase:
    type: int
    doc: "Polynomial degree for BPOLY phase solution"
  visnorm:
    type: boolean
    doc: "Normalize data prior to BPOLY solution"
  maskcenter:
    type: int
    doc: "Number of channels to avoid in center of each band"
  maskedge:
    type: int
    doc: "Fraction of channels to avoid at each band edge (in %)"
  smodel:
    type: float[]
    doc: "Point source Stokes parameters for source model."
  append:
    type: boolean
    doc: "Append solutions to the (existing) table"
  docallib:
    type: boolean
    doc: "Use callib or traditional cal apply parameters"
  gainfield:
    type: string[]
    doc: "Select a subset of calibrators from gaintable(s)"
  interp:
    type: string[]
    doc: "Interpolation mode (in time) to use for each gaintable"
  spwmap:
    type: string
    doc: "Spectral windows combinations to form for gaintables(s)"
  minsnr:
    type: float
    doc: "Reject solutions below this SNR (only applies for bandtype = B)"
  parang:
    type: boolean
    doc: "Apply parallactic angle correction"
  vis:
    type: File
    doc: "Name of input visibility file"
  gaintable:
    type: File[]
    doc: "Gain calibration table(s) to apply on the fly"
  callib:
    type: File
    doc: "Cal Library filename"

outputs:
  caltable:
    type: File
    doc: "Name of output gain calibration table"
    outputBinding:
      glob: caltable
