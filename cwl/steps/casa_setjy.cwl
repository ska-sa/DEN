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
              if (value.class == "Directory") {
                values[key] = value.path;
              } else {
                values[key] = value;
              }
            }
        }
        return values;
      }
      print(args, file=sys.stderr)
      task = crasa.CasaTask("setjy", **args)
      task.run()


inputs:
  field:
    type: string
    doc: "Field Name(s). Comma separated string of field IDs/names"
  spw:
    type: string?
    doc: "Spectral window identifier (list)"
  selectdata:
    type: boolean?
    doc: "Other data selection parameters"
  timerange:
    type: string[]?
    doc: "Time range to operate on (for usescratch=T)"
  scan:
    type: string[]?
    doc: "Scan number range (for  usescratch=T)"
  observation:
    type: string?
    doc: "Observation ID range (for  usescratch=T)"
  intent:
    type: string?
    doc: "Observation intent"
  scalebychan:
    type: boolean?
    doc: "scale the flux density on a per channel basis or else on a per spw basis"
  standard:
    type: string
#      type: enum
#      symbols: [Perley-Butler 2010,Perley-Butler 2013,Baars,Perley 90,Perley-Taylor 95,Perley-Taylor 99,Scaife-Heald 2012,Stevens-Reynolds 2016,Butler-JPL-Horizons 2010,Butler-JPL-Horizons 2012,manual,fluxscale]
    doc: "Flux density standard"
  interpolation:
    type: string?
#      type: enum
#      symbols: [nearest,linear,cubic,spline]
    doc: "method to be used to interpolate in time"
  useephemdir:
    type: boolean?
    doc: "use directions in the ephemeris table"
  fluxdensity:
    type: float[]?
    doc: "Specified flux density [I,Q,U,V]; (-1 will lookup values)"
  spix:
    type: string[]?
    doc: "Spectral index of fluxdensity"
  polindex:
    type: string[]?
    doc: "Polarization index of calibrator (taylor expansion modelling frequency dependence, first of which is ratio of sqrt(Q^2+U^2)/I). Auto determined if Q and U are non-zero in fluxdensity option. See NRAO docs."
  polangle:
    type: string[]?
    doc: "Polarization angle (rads) of calibrator (taylor expansion modelling frequency dependence, first of which is 0.5*arctan(U/Q). Should be specified in combination with polindex option. Ignored if fluxdensity specified non-zero coefficients for Q and U. See NRAO docs."
  reffreq:
    type: string?
    doc: "Reference frequency for spix"
  fluxdict:
    type: string?
    doc: "output dictionary from fluxscale(NB: this is a dictionary)"
  listmodels:
    type: boolean?
    doc: "List the available modimages for VLA calibrators or Tb models for Solar System objects"
  model:
    type: string?
    doc: "File location for field model"
  usescratch:
    type: boolean?
    doc: "Will create if necessary and use the MODEL_DATA"
  vis:
    type: Directory
    doc: "Name of input visibility file"
    inputBinding:
      valueFrom: $(self.path)

outputs:
  vis_out:
    type: Directory
    outputBinding:
      glob: $(inputs.vis.basename)
