## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: SchemaDefRequirement
    types:
      - $import: ../types/types.yaml
  - class: DockerRequirement
    dockerImageId: ska-sa/den
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
      task = crasa.CasaTask("applycal", **args)
      task.run()


inputs:
  field:
    type: string?
    doc: "Select field using field id(s) or field name(s)"
  spw:
    type: string?
    doc: "Select spectral window/channels"
  intent:
    type: string?
    doc: "Select observing intent"
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
  docallib:
    type: boolean?
    doc: "Use callib or traditional cal apply parameters"
  gainfield:
    type: string[]?
    doc: "Select a subset of calibrators from gaintable(s)"
  interp:
    type: string[]
    doc: "Temporal interpolation for each gaintable (=linear)"
  spwmap:
    type: string?
    doc: "Spectral windows combinations to form for gaintables(s)"
  calwt:
    type: boolean[]?
    default: [$(false)]
    doc: "Calibrate data weights per gaintable."
  parang:
    type: boolean?
    doc: "Apply parallactic angle correction on the fly"
  applymode:
    type: string?
#      type: enum
#      symbols: [calflag,calflagstrict,trial,flagonly,flagonlystrict,calonly]
    doc: "Calibration mode: '' = 'calflag','calflagstrict','trial','flagonly','flagonlystrict', or 'calonly'"
  flagbackup:
    type: boolean?
    doc: "Automatically back up the state of flags before the run?"
  vis:
    type: Directory
    doc: "Name of input visibility file"
  callib:
    type: Directory?
    doc: "Cal Library filename"
  gaintable:
    type: Directory[]
    doc: "Gain calibration table(s) to apply on the fly"

outputs:
  vis_out:
    type: Directory
    outputBinding:
      glob: $(inputs.vis.path)
