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
baseCommand: plotms
stdout: log-casa_plotms.txt

inputs:
  gridrows:
    type: int
    doc: "Number of subplot rows (default 1)."
    inputBinding:
      prefix:  gridrows
      position: 1
  gridcols:
    type: int
    doc: "Number of subplot columns"
    inputBinding:
      prefix:  gridcols
      position: 2
  rowindex:
    type: int
    doc: "Row location of the plot"
    inputBinding:
      prefix:  rowindex
      position: 3
  colindex:
    type: int
    doc: "Column location of the plot"
    inputBinding:
      prefix:  colindex
      position: 4
  plotindex:
    type: int
    doc: "Index to address a subplot"
    inputBinding:
      prefix:  plotindex
      position: 5
  xaxis:
    type: string
    doc: " plot x-axis (blank for default/current)"
    inputBinding:
      prefix:  xaxis
      position: 6
  yaxis:
    type: string
    doc: "Plot y-axis (blank for default/current)"
    inputBinding:
      prefix:  yaxis
      position: 7
  xdatacolumn:
    type: string
    doc: "which data column to use for Visibility values"
    inputBinding:
      prefix:  xdatacolumn
      position: 8
  ydatacolumn:
    type: string
    doc: "which data column to use for Visibility values"
    inputBinding:
      prefix:  ydatacolumn
      position: 9
  field:
    type: string
    doc: "Field names or field index numbers"
    inputBinding:
      prefix:  field
      position: 10
  spw:
    type: string
    doc: "Spectral windows:channels"
    inputBinding:
      prefix:  spw
      position: 11
  timerange:
    type: string
    doc: "Time range (blank for all)"
    inputBinding:
      prefix:  timerange
      position: 12
  uvrange:
    type: string
    doc: "Uv range (blank for all)"
    inputBinding:
      prefix:  uvrange
      position: 13
  antenna:
    type: string
    doc: "Antenna/baselines (blank for all)"
    inputBinding:
      prefix:  antenna
      position: 14
  scan:
    type: string
    doc: "Scan numbers (blank for all)"
    inputBinding:
      prefix:  scan
      position: 15
  correlation:
    type: string
    doc: "Correlations (blank for all)"
    inputBinding:
      prefix:  correlation
      position: 16
  array:
    type: string
    doc: "(sub)array numbers (blank for all)"
    inputBinding:
      prefix:  array
      position: 17
  selectdata:
    type: boolean
    doc: "Select data"
    inputBinding:
      prefix:  selectdata
      position: 18
  observation:
    type: string
    doc: "Select by observation ID(s)"
    inputBinding:
      prefix:  observation
      position: 19
  msselect:
    type: string
    doc: "MS selection (blank for all)"
    inputBinding:
      prefix:  msselect
      position: 20
  averagedata:
    type: boolean
    doc: "Average data"
    inputBinding:
      prefix:  averagedata
      position: 21
  avgchannel:
    type: string
    doc: "Average over channel?  (blank = False, otherwise value in channels)"
    inputBinding:
      prefix:  avgchannel
      position: 22
  avgtime:
    type: string
    doc: "Average over time? (blank = False, otherwise value in seconds)"
    inputBinding:
      prefix:  avgtime
      position: 23
  avgscan:
    type: boolean
    doc: "Only valid if time averaging is turned on.  average over scans?"
    inputBinding:
      prefix:  avgscan
      position: 24
  avgfield:
    type: boolean
    doc: "Only valid if time averaging is turned on.  average over fields?"
    inputBinding:
      prefix:  avgfield
      position: 25
  avgbaseline:
    type: boolean
    doc: "Average over all baselines?  (mutually exclusive with avgantenna)"
    inputBinding:
      prefix:  avgbaseline
      position: 26
  avgantenna:
    type: boolean
    doc: "Average by per-antenna?  (mutually  exclusive with avgbaseline)"
    inputBinding:
      prefix:  avgantenna
      position: 27
  avgspw:
    type: boolean
    doc: "Average over all spectral windows?"
    inputBinding:
      prefix:  avgspw
      position: 28
  scalar:
    type: boolean
    doc: "Do scalar averaging?"
    inputBinding:
      prefix:  scalar
      position: 29
  freqframe:
    type: string
    doc: "The frame in which to render frequency and velocity axes"
    inputBinding:
      prefix:  freqframe
      position: 30
  restfreq:
    type: string
    doc: "Rest frequency to use for velocity  conversions"
    inputBinding:
      prefix:  restfreq
      position: 31
  veldef:
    type: string
    doc: "The definition in which to render velocity"
    inputBinding:
      prefix:  veldef
      position: 32
  shift:
    type: float[]
    doc: "Adjust phases by this phase center shift [dx,dy] (arcsec)"
    inputBinding:
      prefix:  shift
      separate: true
      position: 33
  extcorr:
    type: boolean
    doc: "Extend flags based on correlation?"
    inputBinding:
      prefix:  extcorr
      position: 34
  extchannel:
    type: boolean
    doc: "Extend flags based on channel?"
    inputBinding:
      prefix:  extchannel
      position: 35
  iteraxis:
    type:
      type: enum
      symbols: [scan,field,spw,baseline,antenna,time,corr,]
    doc: "the axis over which to iterate"
    inputBinding:
      prefix:  iteraxis
      position: 36
  xselfscale:
    type: boolean
    doc: "If true, iterated plots should share a common x-axis label per column."
    inputBinding:
      prefix:  xselfscale
      position: 37
  yselfscale:
    type: boolean
    doc: "If true, iterated plots should share a common y-axis label per row."
    inputBinding:
      prefix:  yselfscale
      position: 38
  xsharedaxis:
    type: boolean
    doc: "Plots should share a common x-axis."
    inputBinding:
      prefix:  xsharedaxis
      position: 39
  ysharedaxis:
    type: boolean
    doc: "Plots should share a common y-axis."
    inputBinding:
      prefix:  ysharedaxis
      position: 40
  customsymbol:
    type: boolean
    doc: "set a custom symbol(s) for unflagged points"
    inputBinding:
      prefix:  customsymbol
      position: 41
  symbolshape:
    type:
      type: enum
      symbols: [autoscaling,circle,square,diamond,pixel,nosymbol]
    doc: "shape of plotted unflagged symbols"
    inputBinding:
      prefix:  symbolshape
      position: 42
  symbolsize:
    type: int
    doc: "size of plotted unflagged symbols"
    inputBinding:
      prefix:  symbolsize
      position: 43
  symbolcolor:
    type: string
    doc: "color of plotted unflagged symbols"
    inputBinding:
      prefix:  symbolcolor
      position: 44
  symbolfill:
    type:
      type: enum
      symbols: [fill,mesh1,mesh2,mesh3,nofill]
    doc: "fill type of plotted unflagged symbols"
    inputBinding:
      prefix:  symbolfill
      position: 45
  symboloutline:
    type: boolean
    doc: "selects outlining plotted unflagged points"
    inputBinding:
      prefix:  symboloutline
      position: 46
  coloraxis:
    type: string
    doc: "selects which data to use for colorizing"
    inputBinding:
      prefix:  coloraxis
      position: 47
  customflaggedsymbol:
    type: boolean
    doc: "set a custom plot symbol for flagged points"
    inputBinding:
      prefix:  customflaggedsymbol
      position: 48
  flaggedsymbolshape:
    type:
      type: enum
      symbols: [autoscaling,circle,square,diamond,pixel,nosymbol]
    doc: "shape of plotted flagged symbols"
    inputBinding:
      prefix:  flaggedsymbolshape
      position: 49
  flaggedsymbolsize:
    type: int
    doc: "size of plotted flagged symbols"
    inputBinding:
      prefix:  flaggedsymbolsize
      position: 50
  flaggedsymbolcolor:
    type: string
    doc: "color of plotted flagged symbols"
    inputBinding:
      prefix:  flaggedsymbolcolor
      position: 51
  flaggedsymbolfill:
    type:
      type: enum
      symbols: [fill,mesh1,mesh2,mesh3,nofill]
    doc: "fill type of plotted flagged symbols"
    inputBinding:
      prefix:  flaggedsymbolfill
      position: 52
  flaggedsymboloutline:
    type: boolean
    doc: "selects outlining plotted flagged points"
    inputBinding:
      prefix:  flaggedsymboloutline
      position: 53
  plotrange:
    type: float[]
    doc: "plot axes ranges: [xmin,xmax,ymin,ymax]"
    inputBinding:
      prefix:  plotrange
      separate: true
      position: 54
  title:
    type: string
    doc: "Title written along top of plot"
    inputBinding:
      prefix:  title
      position: 55
  xlabel:
    type: string
    doc: "Text for horizontal axis. Blank for default."
    inputBinding:
      prefix:  xlabel
      position: 56
  ylabel:
    type: string
    doc: "Text for vertical axis. Blank for default."
    inputBinding:
      prefix:  ylabel
      position: 57
  showmajorgrid:
    type: boolean
    doc: "Show major grid lines (horiz and vert.)"
    inputBinding:
      prefix:  showmajorgrid
      position: 58
  majorwidth:
    type: int
    doc: "Line width in pixels of major grid lines"
    inputBinding:
      prefix:  majorwidth
      position: 59
  majorstyle:
    type:
      type: enum
      symbols: [solid,dash,dot,more]
    doc: "Major grid line style: solid dash dot none"
    inputBinding:
      prefix:  majorstyle
      position: 60
  majorcolor:
    type: string
    doc: "Color as name or hex code of major grid lines"
    inputBinding:
      prefix:  majorcolor
      position: 61
  showminorgrid:
    type: boolean
    doc: "Show minor grid lines (horiz and vert.)"
    inputBinding:
      prefix:  showminorgrid
      position: 62
  showlegend:
    type: boolean
    doc: "Show a legend on the plot."
    inputBinding:
      prefix:  showlegend
      position: 63
  minorwidth:
    type: int
    doc: "Line width in pixels of minor grid lines"
    inputBinding:
      prefix:  minorwidth
      position: 64
  minorstyle:
    type:
      type: enum
      symbols: [solid,dash,dot,more]
    doc: "Line width in pixels of minor grid lines"
    inputBinding:
      prefix:  minorstyle
      position: 65
  minorcolor:
    type: string
    doc: "Color as name or hex code of minor grid lines"
    inputBinding:
      prefix:  minorcolor
      position: 66
  clearplots:
    type: boolean
    doc: "Remove any existing plots so new ones can replace them."
    inputBinding:
      prefix:  clearplots
      position: 68
  expformat:
    type:
      type: enum
      symbols: [png,jpg,pdf,ps,txt]
    doc: "Export format type (jpg, png, ps, pdf, txt), if not provided, plotfile extension will be used"
    inputBinding:
      prefix:  expformat
      position: 69
  exprange:
    type:
      type: enum
      symbols: [all,current]
    doc: "Export all iteration plots or only the current one"
    inputBinding:
      prefix:  exprange
      position: 70
  overwrite:
    type: boolean
    doc: "Overwrite exsting file"
    inputBinding:
      prefix:  overwrite
      position: 71
  showgui:
    type: boolean
    doc: "Show gui"
    inputBinding:
      prefix:  showgui
      position: 72
  vis:
    type: File
    doc: "MS name"
    inputBinding:
      prefix:  vis
      position: 73
      valueFrom: $(self.basename)

outputs:
  plotfile:
    type: File
    doc: "Name of plot file to save automatically."
    outputBinding:
      glob: plotfile
