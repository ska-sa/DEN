## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: SchemaDefRequirement
    types: 
      - $import: ../types/types.yaml

  - class: DockerRequirement
    dockerImageId: ska-sa/den

  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.vis)
      writable: true

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
              if ((value.class == "Directory") || (value.class == "Directory[]")) {
                values[key] = value.path;
              } else if ((value.class == "File") || (value.class == "File[]")) {
                  values[key] = value.path;
              } else {
                values[key] = value;
              }
            }
        }
        return values;
      }
      if isinstance(args.get("gaintable", None), list):
          for i,gt in enumerate(args["gaintable"]):
              args["gaintable"][i] = args["gaintable"][i]["path"]
      args["caltable"] = args.pop("caltable_name")
      task = crasa.CasaTask("gaincal", **args)
      task.run()


inputs:
  field:
    type: string?
    doc: "Select field using field id(s) or field name(s)"
  spw:
    type: string?
    doc: "Select spectral window/channels"
  selectdata:
    type: boolean?
    doc: "Other data selection parameters"
  timerange:
    type: string?
    doc: "Select data based on time range"
  uvrange:
    type: string?
    doc: "Select data within uvrange (default units meters)"
  antenna:
    type: string?
    doc: "Select data based on antenna/baseline"
  scan:
    type: string?
    doc: "Scan number range"
  observation:
    type: string?
    doc: "Select by observation ID(s)"
  msselect:
    type: string?
    doc: "Optional complex data selection (ignore for now)"
  solint:
    type: string?
    doc: "Solution interval: egs. 'inf', '60s' (see help)"
  combine:
    type: string?
    doc: "Data axes which to combine for solve (obs, scan, spw, and/or, field)"
  preavg:
    type: float?
    doc: "Pre-averaging interval (sec) (rarely needed)"
  refant:
    type: string?
    doc: "Reference antenna name(s)"
  minblperant:
    type: int?
    doc: "Minimum baselines _per antenna_ required for solve"
  minsnr:
    type: float?
    doc: "Reject solutions below this SNR"
  solnorm:
    type: boolean?
    doc: "Normalize average solution amplitudes to 1.0 (G, T only)"
  gaintype:
    type: string?
    doc: "Type of gain solution (G,T,GSPLINE,K,KCROSS)"
  splinetime:
    type: float?
    doc: "Spline timescale(sec); All spw's are first averaged."
  npointaver:
    type: int?
    doc: "The phase-unwrapping algorithm"
  phasewrap:
    type: float?
    doc: "Wrap the phase for jumps greater than this value (degrees)"
  smodel:
    type: string[]?
    doc: "Point source Stokes parameters for source model."
  calmode:
    type: ../types/types.yaml#calmode?
    doc: "Type of solution: ('ap', 'p', 'a')"
  append:
    type: boolean?
    doc: "Append solutions to the (existing) table"
  docallib:
    type: boolean?
    doc: "Use callib or traditional cal apply parameters"
  gainfield:
    type: string[]?
    doc: "Select a subset of calibrators from gaintable(s)"
  interp:
    type: string?
    doc: "Temporal interpolation for each gaintable (=linear)"
  spwmap:
    type: string[]?
    doc: "Spectral windows combinations to form for gaintables(s)"
  parang:
    type: boolean?
    doc: "Apply parallactic angle correction on the fly"
  vis:
    type: Directory
    doc: "Name of input visibility file"
  callib:
    type: File?
    doc: "Cal Library filename"
  gaintable:
    type: Directory[]?
    doc: "Gain calibration table(s) to apply on the fly"
  caltable_name:
    type: string?
    doc: "Name Output gain calibration table"

outputs:
  caltable:
    type: Directory
    doc: "Output gain calibration table"
    outputBinding:
      glob: $(inputs.caltable_name)
