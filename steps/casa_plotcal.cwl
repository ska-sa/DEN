## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerPull: stimela/casa:0.3.1
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.caltable)
      writable: false
baseCommand: plotcal
stdout: log-casa_plotcal.txt

inputs:
  xaxis:
    type:
      type: enum
      symbols: [time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain]
    doc: "Value to plot along x axis (time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain)"
    inputBinding:
      prefix: -xaxis
      position: 1
  yaxis:
    type:
      type: enum
      symbols: [time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain]
    doc: "Value to plot along y axis (time,chan,freq,antenna,antenna1,antenna2,scan,amp,phase,real,imag,snr,tsys,delay,spgain)"
    inputBinding:
      prefix: -yaxis
      position: 2
  poln:
    type:
      type: enum
      symbols: [RL,R,L,XY,X,Y,/]
    doc: "Antenna polarization to plot (RL,R,L,XY,X,Y,/)"
    inputBinding:
      prefix: -poln
      position: 3
  field:
    type: string
    doc: "field names or index of calibrators: ''==>all"
    inputBinding:
      prefix: -field
      position: 4
  antenna:
    type: string
    doc: "antenna/baselines: ''==>all, antenna = '3,VA04'"
    inputBinding:
      prefix: -antenna
      position: 5
  spw:
    type: string
    doc: "spectral window:channels: ''==>all, spw='1:5~57'"
    inputBinding:
      prefix: -spw
      position: 6
  timerange:
    type: string
    doc: "time range: ''==>all"
    inputBinding:
      prefix: -timerange
      position: 7
  subplot:
    type: int
    doc: "Panel number on display screen (yxn)"
    inputBinding:
      prefix: -subplot
      position: 8
  overplot:
    type: boolean
    doc: "Overplot solutions on existing display"
    inputBinding:
      prefix: -overplot
      position: 9
  clearpanel:
    type: string
    doc: "Specify if old plots are cleared or not (ignore)"
    inputBinding:
      prefix: -clearpanel
      position: 10
  iteration:
    type: string
    doc: "Iterate plots on antenna,time,spw,field"
    inputBinding:
      prefix: -iteration
      position: 11
  plotrange:
    type: float[]
    doc: "plot axes ranges: [xmin,xmax,ymin,ymax]"
    inputBinding:
      prefix: -plotrange
      separate: true
      position: 12
  showflags:
    type: boolean
    doc: "If true, show flagged solutions"
    inputBinding:
      prefix: -showflags
      position: 13
  plotsymbol:
    type: string
    doc: "pylab plot symbol"
    inputBinding:
      prefix: -plotsymbol
      position: 14
  plotcolor:
    type: string
    doc: "initial plotting color"
    inputBinding:
      prefix: -plotcolor
      position: 15
  markersize:
    type: float
    doc: "Size of plotted marks"
    inputBinding:
      prefix: -markersize
      position: 16
  fontsize:
    type: float
    doc: "Font size for labels"
    inputBinding:
      prefix: -fontsize
      position: 17
  showgui:
    type: boolean
    doc: "Show plot on gui"
    inputBinding:
      prefix: -showgui
      position: 19
  caltable:
    type: File
    doc: "Name of input calibration table"
    inputBinding:
      prefix: -caltable
      position: 20
      valueFrom: $(self.basename)

outputs:
  figfile:
    type: File
    doc: "''= no plot hardcopy, otherwise supply name"
    outputBinding:
      glob: figfile
