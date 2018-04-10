## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.caltable)
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
      task = crasa.CasaTask("plotcal", **args)
      task.run()

inputs:
  xaxis:
    type:
      type: enum
      symbols: [time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain]
    doc: "Value to plot along x axis (time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain)"
  yaxis:
    type:
      type: enum
      symbols: [time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain]
    doc: "Value to plot along y axis (time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain)"
  poln:
    type:
      type: enum
      symbols: [RL,R,L,XY,X,Y,/]
    doc: "Antenna polarization to plot (RL,R,L,XY,X,Y,/)"
  field:
    type: string
    doc: "field names or index of calibrators: ''==>all"
  antenna:
    type: string
    doc: "antenna/baselines: ''==>all, antenna = '3,VA04'"
  spw:
    type: string
    doc: "spectral window:channels: ''==>all, spw='1:5~57'"
  timerange:
    type: string
    doc: "time range: ''==>all"
  subplot:
    type: int
    doc: "Panel number on display screen (yxn)"
  overplot:
    type: boolean
    doc: "Overplot solutions on existing display"
  clearpanel:
    type: string
    doc: "Specify if old plots are cleared or not (ignore)"
  iteration:
    type: string
    doc: "Iterate plots on antenna,time,spw,field"
  plotrange:
    type: float[]
    doc: "plot axes ranges: [xmin,xmax,ymin,ymax]"
  showflags:
    type: boolean
    doc: "If true, show flagged solutions"
  plotsymbol:
    type: string
    doc: "pylab plot symbol"
  plotcolor:
    type: string
    doc: "initial plotting color"
  markersize:
    type: float
    doc: "Size of plotted marks"
  fontsize:
    type: float
    doc: "Font size for labels"
  showgui:
    type: boolean
    doc: "Show plot on gui"
  caltable:
    type: File
    doc: "Name of input calibration table"

outputs:
  figfile:
    type: File
    doc: "''= no plot hardcopy, otherwise supply name"
    outputBinding:
      glob: figfile
