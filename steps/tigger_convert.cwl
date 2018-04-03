## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.input-skymodel)
      writable: false
    listing:
    - entry: $(inputs.append)
      writable: false
    listing:
    - entry: $(inputs.primary-beam)
      writable: false
    listing:
    - entry: $(inputs.pa-from-ms)
      writable: true
baseCommand: tigger-convert
stdout: log-tigger-convert.txt

inputs:
  force:
    type: boolean
    doc: "Forces overwrite of output model."
    inputBinding:
      prefix: --force
      position: 3
  type:
    type:
      type: enum
      symbols: [Tigger,ASCII,BBS,NEWSTAR,AIPSCC,AIPSCCFITS,Gaul,auto]
    doc: "Input model type"
    inputBinding:
      prefix: --type
      position: 4
  output-type:
    type:
      type: enum
      symbols: [Tigger,ASCII,BBS,NEWSTAR,auto]
    doc: "Output model type."
    inputBinding:
      prefix: --output-type
      position: 5
  append-type:
    type:
      type: enum
      symbols: [Tigger,ASCII,BBS,NEWSTAR,AIPSCC,AIPSCCFITS,Gaul,auto]
    doc: "Append another model to input model. May be given multiple times. --append-type=TYPE  Appended model type (Tigger, ASCII, BBS, NEWSTAR, AIPSCC, AIPSCCFITS, Gaul, auto). Default is none."
    inputBinding:
      prefix: --append-type
      position: 6
  format:
    type: string
    doc: "Input format, for ASCII or BBS tables. For ASCII tables, default is 'name ra_h ra_m ra_s dec_d dec_m dec_s i q u v spi rm emaj_s emin_s pa_d freq0 tags...'. For BBS tables, the default format is specified in the file header."
    inputBinding:
      prefix: --format
      position: 7
  append-format:
    type:
      type: enum
      symbols: [Tigger,ASCII,BBS,NEWSTAR,AIPSCC,AIPSCCFITS,Gaul,auto]
    doc: "Format of appended file, for ASCII or BBS tables. Default is to use 'format'."
    inputBinding:
      prefix: --append-format
      position: 8
  output-format:
    type:
      type: enum
      symbols: [Tigger,ASCII,BBS,NEWSTAR,AIPSCC,AIPSCCFITS,Gaul,auto]
    doc: "Output format, for ASCII or BBS tables. If the model was originally imported from an ASCII or BBS table, the default output format will be the same as the original format."
    inputBinding:
      prefix: --output-format
      position: 9
  help-format:
    type: boolean
    doc: "Prints help on format strings."
    inputBinding:
      prefix: --help-format
      position: 10
  min-extent:
    type: float
    doc: "Minimal source extent, when importing NEWSTAR or ASCII files. Sources with a smaller extent will be treated as point sources."
    inputBinding:
      prefix: --min-extent
      position: 11
  tags:
    type: string
    doc: "Extract sources with the specified tags."
    inputBinding:
      prefix: --tags
      position: 12
  select:
    type: string
    doc: "Selects a subset of sources by comparing the named TAG to a float VALUE. '<>' represents the comparison operator, and can be one of == (or =),!=,<=,<,>,>=. Alternatively, you may use the FORTRAN-style operators .eq.,.ne.,.le.,.lt.,.gt.,.ge. Multiple select options may be given, in which case the effect is a logical- AND. Note that VALUE may be followed by one of the characters d, m or s, in which case it will be converted from degrees, minutes or seconds into radians. This is useful for selections such as 'r<5d'. 'remove-nans' Removes the named source(s) from the model. NAME may contain * and ? wildcards."
    inputBinding:
      prefix: --select
      position: 13
  app-to-int:
    type: boolean
    doc: "Treat fluxes as apparent, and rescale them into intrinsic using the supplied primary beam model (see 'primary-beam' option)."
    inputBinding:
      prefix: --app-to-int
      position: 14
  int-to-app:
    type: boolean
    doc: "Treat fluxes as intrinsic, and rescale them into apparent using the supplied primary beam model (see 'primary-beam' option)."
    inputBinding:
      prefix: --int-to-app
      position: 15
  newstar-app-to-int:
    type: boolean
    doc: "Convert NEWSTAR apparent fluxes in input model to intrinsic. Only works for NEWSTAR or NEWSTAR-derived input models."
    inputBinding:
      prefix: --newstar-app-to-int
      position: 16
  newstar-int-to-app:
    type: boolean
    doc: "Convert NEWSTAR intrinsic fluxes in input model to apparent. Only works for NEWSTAR or NEWSTAR-derived input models."
    inputBinding:
      prefix: --newstar-int-to-app
      position: 17
  center:
    type: string
    doc: "Override coordinates of the nominal field center specified in the input model. Use the form 'Xdeg,Ydeg' or 'Xdeg,Yrad' to specify RA,Dec in degrees or radians, or else a a pyrap.measures direction string of the form REF,C1,C2, for example 'j2000,1h5m0.2s,+30d14m15s'. See the pyrap.measures documentation for more details."
    inputBinding:
      prefix: --center
      position: 18
  refresh-r:
    type: boolean
    doc: "Recompute the 'r' (radial distance from center) attribute of each source based on the current field  center. 'ref-freq'=MHz Set or change the reference frequency of the model."
    inputBinding:
      prefix: --refresh-r
      position: 19
  linear-pol:
    type: string
    doc: "Use XY basis correlations for beam filenames and Mueller matrices."
    inputBinding:
      prefix: --linear-pol
      position: 21
  fits-l-axis:
    type: string
    doc: "CTYPE for L axis in the FITS PB file. Note that our internal L points East (increasing RA), if the FITS beam axis points the opposite way, prefix the CTYPE with a '-'' character."
    inputBinding:
      prefix: --fits-l-axis
      position: 22
  fits-m-axis:
    type: string
    doc: "CTYPE for M axis in the FITS PB file. Note that our internal M points North (increasing Dec), if the FITS beam axis points the opposite way, prefix the CTYPE with a '-'' character."
    inputBinding:
      prefix: --fits-m-axis
      position: 23
  beam-freq:
    type: float
    doc: "Use given frequency (in MHz) for primary beam model, rather than the model reference frequency"
    inputBinding:
      prefix: --beam-freq
      position: 24
  beam-clip:
    type: float
    doc: "when using a FITS beam, clip (power) beam gains at this level to keep intrinsic source fluxes from blowing up. Sources below this beamgain will be tagged 'nobeam'. Default: 0.001"
    inputBinding:
      prefix: --beam-clip
      position: 25
  beam-spi:
    type: float
    doc: "perform a spectral index fit to each source based on a frequency dependent FITS beam, requires --primary-beam option to be used with a FITS file. Apply this spectral index to LSM sources. Must supply a band width (centred on --beam-freq) over which the beam spi is estimated"
    inputBinding:
      prefix: --beam-spi
      position: 26
  force-beam-spi-wo-spectrum:
    type: boolean
    doc: "Apply beam-derived spectral indices even to sources without an intrinsic spectrum. Default is to only apply to sources that already have a spectrum. 'beam-nopol' apply intensity beam model only, ignoring polarization. Default is to use polarization. 'beam-diag' use diagonal Jones terms only for beam model. Default is to use all four terms if available."
    inputBinding:
      prefix: --force-beam-spi-wo-spectrum
      position: 27
  pa:
    type: float
    doc: "Rotate the primary beam pattern through a parallactic angle (in degrees)."
    inputBinding:
      prefix: --pa
      position: 28
  pa-range:
    type: float[]
    doc: "Rotate the primary beam pattern through a range of parallactic angles (in degrees) and use the average value over PA."
    inputBinding:
      prefix: --pa-range
      separate: true
      position: 29
  field-id:
    type: int[]
    doc: "Field ID for 'pa-from-ms' calculation"
    inputBinding:
      prefix: --field-id
      separate: true
      position: 31
  beam-average-jones:
    type: boolean
    doc: "Correct approach to rotational averaging is to convert Jones(PA) to Mueller(PA), then average over PA. Tigger versions<=1.3.3 took the incorrect approach of averaging Jones over PA, then converting to Mueller. Use this option to mimic the old approach."
    inputBinding:
      prefix: --beam-average-jones
      position: 32
  cluster-dist:
    type: float
    doc: "Distance parameter for source clustering, 0 to disable. Default is 60."
    inputBinding:
      prefix: --cluster-dist
      position: 33
  rename:
    type: boolean
    doc: "Rename sources according to the COPART (cluster ordering, P.A., radial distance, type) scheme"
    inputBinding:
      prefix: --rename
      position: 34
  radial-step:
    type: float
    doc: "Size of one step in radial distance for the COPART scheme."
    inputBinding:
      prefix: --radial-step
      position: 35
  merge-clusters:
    type: string
    doc: "Merge source clusters bearing the specified tags, replacing them with a single point source. Multiple tags may be given separated by commas. Use 'ALL' to merge all clusters."
    inputBinding:
      prefix: --merge-clusters
      position: 36
  prefix:
    type: string
    doc: "Prefix all source names with the given string"
    inputBinding:
      prefix: --prefix
      position: 37
  remove-source:
    type: string
    doc: " Removes the named source(s) from the model. NAME may contain * and ? wildcards."
    inputBinding:
      prefix: --remove-source
      position: 38
  recenter:
    type: boolean
    doc: "Shift the sky model from the nominal center to a different field center. COORDINATES specified as per the --center option."
    inputBinding:
      prefix: --recenter
      position: 39
  verbose:
    type: boolean
    doc: "Increase verbosity"
    inputBinding:
      prefix: --verbose
      position: 40
  enable-plots:
    type: boolean
    doc: "Enables various diagnostic plots"
    inputBinding:
      prefix: --enable-plots
      position: 41
  input-skymodel:
    type: File
    doc: "Input skymodel"
    inputBinding:
      prefix: --input-skymodel
      position: 42
      valueFrom: $(self.basename)
  append:
    type: File
    doc: "Append this model to input-skymodel, then write to output-skymodel"
    inputBinding:
      prefix: --append
      position: 43
      valueFrom: $(self.basename)
  primary-beam:
    type: File
    doc: "Apply a primary beam expression to estimate apparent fluxes. Any valid Python expression using the variables 'r' and 'fq' is accepted. Use 'refresh' to re-estimate fluxes using the current expression. Example (for the WSRT-like 25m dish PB): 'cos(min(65*fq*1e-9*r,1.0881))**6'. OR: give a set of FITS primary beam patterns of the form e.g. FILENAME_$(xy)_$(reim).fits, these are the  same FITS files used in MeqTrees pybeams_fits."
    inputBinding:
      prefix: --primary-beam
      position: 44
      valueFrom: $(self.basename)
  pa-from-ms:
    type: File[]
    doc: "Rotate the primary beam pattern through a range of parallactic angles as given by the MS and take the average over time. This is more accurate than --pa-range."
    inputBinding:
      prefix: --pa-from-ms
      position: 45
      valueFrom: $(self.basename)

outputs:
  output-skymodel:
    type: File
    doc: "Output skymodel"
    outputBinding:
      glob: output-skymodel
