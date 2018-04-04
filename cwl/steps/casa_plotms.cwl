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
baseCommand: plotms
stdout: log-casa_plotms.txt

inputs:
  gridrows:
    type: int
    doc: "Number of subplot rows (default 1)."
  gridcols:
    type: int
    doc: "Number of subplot columns"
  rowindex:
    type: int
    doc: "Row location of the plot"
  colindex:
    type: int
    doc: "Column location of the plot"
  plotindex:
    type: int
    doc: "Index to address a subplot"
    type: string
    doc: " plot x-axis (blank for default/current)"
  yaxis:
    type: string
    doc: "Plot y-axis (blank for default/current)"
  xdatacolumn:
    type: string
    doc: "which data column to use for Visibility values"
  ydatacolumn:
    type: string
    doc: "which data column to use for Visibility values"
  field:
    type: string
    doc: "Field names or field index numbers"
  spw:
    type: string
    doc: "Spectral windows:channels"
  timerange:
    type: string
    doc: "Time range (blank for all)"
  uvrange:
    type: string
    doc: "Uv range (blank for all)"
  antenna:
    type: string
    doc: "Antenna/baselines (blank for all)"
  scan:
    type: string
    doc: "Scan numbers (blank for all)"
  correlation:
    type: string
    doc: "Correlations (blank for all)"
  array:
    type: string
    doc: "(sub)array numbers (blank for all)"
  selectdata:
    type: boolean
    doc: "Select data"
  observation:
    type: string
    doc: "Select by observation ID(s)"
  msselect:
    type: string
    doc: "MS selection (blank for all)"
  averagedata:
    type: boolean
    doc: "Average data"
  avgchannel:
    type: string
    doc: "Average over channel?  (blank = False, otherwise value in channels)"
  avgtime:
    type: string
    doc: "Average over time? (blank = False, otherwise value in seconds)"
  avgscan:
    type: boolean
    doc: "Only valid if time averaging is turned on.  average over scans?"
  avgfield:
    type: boolean
    doc: "Only valid if time averaging is turned on.  average over fields?"
  avgbaseline:
    type: boolean
    doc: "Average over all baselines?  (mutually exclusive with avgantenna)"
  avgantenna:
    type: boolean
    doc: "Average by per-antenna?  (mutually  exclusive with avgbaseline)"
  avgspw:
    type: boolean
    doc: "Average over all spectral windows?"
  scalar:
    type: boolean
    doc: "Do scalar averaging?"
  freqframe:
    type: string
    doc: "The frame in which to render frequency and velocity axes"
  restfreq:
    type: string
    doc: "Rest frequency to use for velocity  conversions"
  veldef:
    type: string
    doc: "The definition in which to render velocity"
  shift:
    type: float[]
    doc: "Adjust phases by this phase center shift [dx,dy] (arcsec)"
  extcorr:
    type: boolean
    doc: "Extend flags based on correlation?"
  extchannel:
    type: boolean
    doc: "Extend flags based on channel?"
  iteraxis:
    type:
      type: enum
      symbols: [scan,field,spw,baseline,antenna,time,corr,]
    doc: "the axis over which to iterate"
  xselfscale:
    type: boolean
    doc: "If true, iterated plots should share a common x-axis label per column."
  yselfscale:
    type: boolean
    doc: "If true, iterated plots should share a common y-axis label per row."
  xsharedaxis:
    type: boolean
    doc: "Plots should share a common x-axis."
  ysharedaxis:
    type: boolean
    doc: "Plots should share a common y-axis."
  customsymbol:
    type: boolean
    doc: "set a custom symbol(s) for unflagged points"
  symbolshape:
    type:
      type: enum
      symbols: [autoscaling,circle,square,diamond,pixel,nosymbol]
    doc: "shape of plotted unflagged symbols"
  symbolsize:
    type: int
    doc: "size of plotted unflagged symbols"
  symbolcolor:
    type: string
    doc: "color of plotted unflagged symbols"
  symbolfill:
    type:
      type: enum
      symbols: [fill,mesh1,mesh2,mesh3,nofill]
    doc: "fill type of plotted unflagged symbols"
  symboloutline:
    type: boolean
    doc: "selects outlining plotted unflagged points"
  coloraxis:
    type: string
    doc: "selects which data to use for colorizing"
  customflaggedsymbol:
    type: boolean
    doc: "set a custom plot symbol for flagged points"
  flaggedsymbolshape:
    type:
      type: enum
      symbols: [autoscaling,circle,square,diamond,pixel,nosymbol]
    doc: "shape of plotted flagged symbols"
  flaggedsymbolsize:
    type: int
    doc: "size of plotted flagged symbols"
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
  flaggedsymboloutline:
    type: boolean
    doc: "selects outlining plotted flagged points"
  plotrange:
    type: float[]
    doc: "plot axes ranges: [xmin,xmax,ymin,ymax]"
  title:
    type: string
    doc: "Title written along top of plot"
  xlabel:
    type: string
    doc: "Text for horizontal axis. Blank for default."
  ylabel:
    type: string
    doc: "Text for vertical axis. Blank for default."
  showmajorgrid:
    type: boolean
    doc: "Show major grid lines (horiz and vert.)"
  majorwidth:
    type: int
    doc: "Line width in pixels of major grid lines"
  majorstyle:
    type:
      type: enum
      symbols: [solid,dash,dot,more]
    doc: "Major grid line style: solid dash dot none"
  majorcolor:
    type: string
    doc: "Color as name or hex code of major grid lines"
  showminorgrid:
    type: boolean
    doc: "Show minor grid lines (horiz and vert.)"
  showlegend:
    type: boolean
    doc: "Show a legend on the plot."
  minorwidth:
    type: int
    doc: "Line width in pixels of minor grid lines"
  minorstyle:
    type:
      type: enum
      symbols: [solid,dash,dot,more]
    doc: "Line width in pixels of minor grid lines"
  minorcolor:
    type: string
    doc: "Color as name or hex code of minor grid lines"
    inputBinding:
      prefix:  minorcolor
      position: 66
  clearplots:
    type: boolean
    doc: "Remove any existing plots so new ones can replace them."
  expformat:
    type:
      type: enum
      symbols: [png,jpg,pdf,ps,txt]
    doc: "Export format type (jpg, png, ps, pdf, txt), if not provided, plotfile extension will be used"
  exprange:
    type:
      type: enum
      symbols: [all,current]
    doc: "Export all iteration plots or only the current one"
  overwrite:
    type: boolean
    doc: "Overwrite exsting file"
  showgui:
    type: boolean
    doc: "Show gui"
  vis:
    type: File
    doc: "MS name"
    inputBinding:
      valueFrom: $(self.basename)

outputs:
  plotfile:
    type: File
    doc: "Name of plot file to save automatically."
    outputBinding:
      glob: plotfile
