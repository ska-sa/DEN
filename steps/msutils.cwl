## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.msname)
      writable: true
    listing:
    - entry: $(inputs.stats_data)
      writable: false
    listing:
    - entry: $(inputs.ctable)
      writable: false
baseCommand: msutils
stdout: log-msutils.txt

inputs:
  command:
    type:
      type: enum
      symbols: [addcol,sumcols,copycol,compute_vis_noise,verify_antpos,prep,addnoise,summary,estimate_weights,plot_gains]
    doc: "MSUtils command to execute"
    inputBinding:
      prefix:  command
  colname:
    type: string
    doc: "Column name"
    inputBinding:
      prefix:  colname
  display:
    type: boolean
    doc: "Display MS summary to stdout"
    inputBinding:
      prefix:  display
  shape:
    type: string
    doc: "Shape of column to add to MS"
    inputBinding:
      prefix:  shape
  valuetype:
    type: string
    doc: "Column data type"
    inputBinding:
      prefix:  valuetype
  data_desc_type:
    type:
      type: enum
      symbols: [array,scalar]
    doc: "Data description type for data in column to be added"
    inputBinding:
      prefix:  data_desc_type
  init_with:
    type: float
    doc: "Value to initialize new data column with"
    inputBinding:
      prefix:  init_with
  col1:
    type: string
    doc: "First column to add/subtract"
    inputBinding:
      prefix:  col1
  col2:
    type: string
    doc: "Second column to add/subtract"
    inputBinding:
      prefix:  col2
  cols:
    type: string[]
    doc: "Columns to sum"
    inputBinding:
      prefix:  cols
      separate: true
  subtract:
    type: boolean
    doc: "Subtract 'col2' from 'col1' "
    inputBinding:
      prefix:  subtract
  fromcol:
    type: string
    doc: "Column to copy data from"
    inputBinding:
      prefix:  fromcol
  tocol:
    type: string
    doc: "Column to copy data to"
    inputBinding:
      prefix:  tocol
  addnoise:
    type: boolean
    doc: "Add noise to MS. Will add to 'column/colname'"
    inputBinding:
      prefix:  addnoise
  sefd:
    type: float
    doc: "System Equivalent Flux Density, in Jy. The noise will be calculated using this value"
    inputBinding:
      prefix:  sefd
  addToCol:
    type: string
    doc: "Add noise to data in this column"
    inputBinding:
      prefix:  addToCol
  noise:
    type: float
    doc: "Noise in Jy to 'column/colname' data in Jy"
    inputBinding:
      prefix:  noise
  spw_id:
    type: int
    doc: "SPW ID"
    inputBinding:
      prefix:  spw_id
  verify:
    type: boolean
    doc: "Verifies antenna Y positions in MS. If Y coordinate convention is wrong, either fixes the positions (fix=True) or raises an error. hemisphere=-1 makes it assume that the observatory is in the Western hemisphere, hemisphere=1 in the Eastern, or else tries to find observatory name using MS and pyrap.measure"
    inputBinding:
      prefix:  verify
  mode:
    type:
      type: enum
      symbols: [specs]
    doc: "Mode when estimating spectral weights. If mode=specs, then the weights will be based on the instrument spec sensitivity that is provided via the stats_data option"
    inputBinding:
      prefix:  mode
  fit_order:
    type: int
    doc: "Fit order for function used to smooth noise/weights"
    inputBinding:
      prefix:  fit_order
  smooth:
    type:
      type: enum
      symbols: [polyn,spline]
    doc: "Function to use for smoothing the noise/weights"
    inputBinding:
      prefix:  smooth
  write_to_ms:
    type: boolean
    doc: "Save estimated noise/weights in MS"
    inputBinding:
      prefix:  write_to_ms
  noise_columns:
    type: string[]
    doc: "columns to save noise and corresponding noise spectrum"
    inputBinding:
      prefix:  noise_columns
      separate: true
  weight_columns:
    type: string[]
    doc: "columns to save noise and corresponding noise spectrum"
    inputBinding:
      prefix:  weight_columns
      separate: true
  tabtype:
    type:
      type: enum
      symbols: [bandpass,gain,delay]
    doc: "Type of the calibration table"
    inputBinding:
      prefix:  tabtype
  plot_dpi:
    type: int
    doc: "DPI for the gain plot"
    inputBinding:
      prefix:  plot_dpi
  subplot_scale:
    type: int
    doc: "Scale for the subplots in the gain plot"
    inputBinding:
      prefix:  subplot_scale
  msname:
    type: File
    doc: "MS name"
    inputBinding:
      prefix:  msname
      valueFrom: $(self.basename)
  stats_data:
    type: File[]
    doc: "File or array containing information about sensitivity as a function of frequency (in Hz). For MeerKAT use the string 'use_package_meerkat_spec' unless you have your own (updated) specs"
    inputBinding:
      prefix:  stats_data
      valueFrom: $(self.basename)
  ctable:
    type: File
    doc: "Calibration table to plot"
    inputBinding:
      prefix:  ctable
      valueFrom: $(self.basename)

outputs:
  outfile:
    type: File
    doc: "Output file for MS summary (json format)"
    outputBinding:
      glob: outfile
  plot_stats:
    type: File
    doc: "Plot of estimated spectral noise/weights"
    outputBinding:
      glob: plot_stats
  plot_file:
    type: string
    doc: "Filename for gain plot"
    outputBinding:
      glob: plot_file
