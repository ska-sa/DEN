## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.filename)
      writable: false
    listing:
    - entry: $(inputs.detection_image)
      writable: false
    listing:
    - entry: $(inputs.bbs_patches_mask)
      writable: false
baseCommand: python
stdout: log-pybdsm.txt

inputs:
  adaptive_rms_box:
    type: boolean
    doc: "Use adaptive rms_box when determining rms and mean maps"
    inputBinding:
      prefix:  adaptive_rms_box
      position: 1
  atrous_do:
    type: boolean
    doc: "Decompose Gaussian residual image into multiple scales"
    inputBinding:
      prefix:  atrous_do
      position: 2
  atrous_bdsm_do:
    type: boolean
    doc: "Perform source extraction on each wavelet scale"
    inputBinding:
      prefix:  atrous_bdsm_do
      position: 3
  atrous_jmax:
    type: int
    doc: "Max allowed wavelength order, 0 => calculate inside program"
    inputBinding:
      prefix:  atrous_jmax
      position: 4
  atrous_lpf:
    type:
      type: enum
      symbols: [b3,tr]
    doc: "Low pass filter, either 'b3' or 'tr', for B3 spline or Triangle"
    inputBinding:
      prefix:  atrous_lpf
      position: 5
  atrous_orig_isl:
    type: boolean
    doc: "Restrict wavelet Gaussians to islands found in original image"
    inputBinding:
      prefix:  atrous_orig_isl
      position: 6
  atrous_sum:
    type: boolean
    doc: "Fit to the sum of remaining wavelet scales"
    inputBinding:
      prefix:  atrous_sum
      position: 7
  use_scipy_fft:
    type: boolean
    doc: "Use fast SciPy FFT for convolution"
    inputBinding:
      prefix:  use_scipy_fft
      position: 8
  beam:
    type: float[]
    doc: "FWHM of restoring beam. Specify as (maj, min, pos ang E of N) in degrees. E.g., beam = (0.06, 0.02, 13.3). None => get from header"
    inputBinding:
      prefix:  beam
      separate: true
      position: 9
  flagging_opts:
    type: boolean
    doc: "Show options for Gaussian flagging"
    inputBinding:
      prefix:  flagging_opts
      position: 10
  frequency:
    type: float
    doc: "Frequency in Hz of input image. E.g., frequency = 74e6. None => get from header."
    inputBinding:
      prefix:  frequency
      position: 11
  mean_map:
    type:
      type: enum
      symbols: [default,zero,const,map]
    doc: "Background mean map: 'default' => calc whether to use or not, 'zero' => 0, 'const' => clipped mean, 'map' => use 2-D map"
    inputBinding:
      prefix:  mean_map
      position: 12
  beam_sp_derive:
    type: boolean
    doc: "If True and beam_spectrum is None, then assume header beam is for median frequency and scales with frequency for channels"
    inputBinding:
      prefix:  beam_sp_derive
      position: 13
  multi_chan_beam:
    type: boolean
    doc: "Get beams for each channel in FITS header. Eg. BMAJ1, BMAJ1, BPA1; BMAJ2, BMIN2, BPA2"
    inputBinding:
      prefix:  multi_chan_beam
      position: 14
  beam_spectrum:
    type: array[]
    doc: "FWHM of synthesized beam per channel. Specify as [(bmaj_ch1, bmin_ch1, bpa_ch1), (bmaj_ch2, bmin_ch2, bpa_ch2), etc.] in degrees. E.g., beam_spectrum = [(0.01, 0.01, 45.0), (0.02,0.01, 34.0)] for two channels. None => all equal to beam"
    inputBinding:
      prefix:  beam_spectrum
      separate: true
      position: 15
  collapse_av:
    type: int[]
    doc: "List of channels to average if collapse_mode = 'average', starting from 0. E.g., collapse_av = [0, 1, 5]. [] => all"
    inputBinding:
      prefix:  collapse_av
      separate: true
      position: 16
  collapse_ch0:
    type: int
    doc: "Number of the channel for source extraction, if collapse_mode = 'single', starting from 0"
    inputBinding:
      prefix:  collapse_ch0
      position: 17
  collapse_mode:
    type:
      type: enum
      symbols: [average,single]
    doc: "Collapse method: 'average' or 'single'. Average channels or take single channel to perform source detection on"
    inputBinding:
      prefix:  collapse_mode
      position: 18
  frequency_sp:
    type: float[]
    doc: "Frequency in Hz of channels in input image when more than one channel is present. E.g., frequency_sp = [74e6, 153e6]. None => get from header"
    inputBinding:
      prefix:  frequency_sp
      separate: true
      position: 19
  rms_box:
    type: int[]
    doc: "Box size, step size for rms/mean map calculation. Specify as (box, step) in pixels. E.g., rms_box = (40, 10) => box of 40x40 pixels, step of 10 pixels. None => calculate inside program"
    inputBinding:
      prefix:  rms_box
      separate: true
      position: 20
  rms_map:
    type: boolean
    doc: "Background rms map: True => use 2-D rms map; False => use constant rms; None => calculate inside program"
    inputBinding:
      prefix:  rms_map
      position: 21
  thresh:
    type:
      type: enum
      symbols: [fdr,hard,None]
    doc: "Type of thresholding: None => calculate inside program, 'fdr' => use false detection rate algorithm, 'hard' => use sigma clipping"
    inputBinding:
      prefix:  thresh
      position: 22
  thresh_isl:
    type: float
    doc: "Threshold for the island boundary in number of sigma above the mean. Determines extent of island used for fitting"
    inputBinding:
      prefix:  thresh_isl
      position: 23
  thresh_pix:
    type: float
    doc: "Source detection threshold: threshold for the island peak in number of sigma above the mean. If false detection rate thresholding is used, this value is ignored and thresh_pix is calculated inside the program"
    inputBinding:
      prefix:  thresh_pix
      position: 24
  aperture:
    type: boolean
    doc: "Radius of aperture in pixels inside which aperture fluxes are measured for each source. None => no aperture fluxes measured"
    inputBinding:
      prefix:  aperture
      position: 25
  aperture_posn:
    type:
      type: enum
      symbols: [centroid,peak]
    doc: "Position the aperture (if aperture is not None) on: 'centroid' or 'peak' of the source."
    inputBinding:
      prefix:  aperture_posn
      position: 26
  blank_limit:
    type: float
    doc: "Limit in Jy/beam below which pixels are blanked. None => no such blanking is done"
    inputBinding:
      prefix:  blank_limit
      position: 27
  bmpersrc_th:
    type: float
    doc: "Theoretical estimate of number of beams per source. None => calculate inside program"
    inputBinding:
      prefix:  bmpersrc_th
      position: 28
  check_outsideuniv:
    type: boolean
    doc: "Check for pixels outside the universe"
    inputBinding:
      prefix:  check_outsideuniv
      position: 29
  do_cache:
    type: boolean
    doc: "Cache internally derived images to disk"
    inputBinding:
      prefix:  do_cache
      position: 31
  do_mc_errors:
    type: boolean
    doc: "stimate uncertainties for 'M'-type sources using Monte Carlo method"
    inputBinding:
      prefix:  do_mc_errors
      position: 32
  fdr_alpha:
    type: float
    doc: "Alpha for FDR algorithm for thresholds"
    inputBinding:
      prefix:  fdr_alpha
      position: 33
  fdr_ratio:
    type: float
    doc: "For thresh = None; if #false_pix / #source_pix < fdr_ratio, thresh = 'hard' else thresh = 'fdr'"
    inputBinding:
      prefix:  fdr_ratio
      position: 34
  fittedimage_clip:
    type: float
    doc: "Sigma for clipping Gaussians while creating fitted image"
    inputBinding:
      prefix:  fittedimage_clip
      position: 35
  fix_to_beam:
    type: boolean
    doc: "Fix major and minor axes and PA of Gaussians to beam?"
    inputBinding:
      prefix:  fix_to_beam
      position: 36
  group_by_isl:
    type: boolean
    doc: "Group all Gaussians in each island into a single source"
    inputBinding:
      prefix:  group_by_isl
      position: 37
  group_method:
    type:
      type: enum
      symbols: [intensity,curvature]
    doc: "Group Gaussians into sources using 'intensity' map or 'curvature' map"
    inputBinding:
      prefix:  group_method
      position: 38
  group_tol:
    type: float
    doc: "Tolerance for grouping of Gaussians into sources: larger values will result in larger sources"
    inputBinding:
      prefix:  group_tol
      position: 39
  ini_gausfit:
    type:
      type: enum
      symbols: [default,simple,nobeam]
    doc: "Initial guess for Gaussian parameters: 'default', 'simple', or 'nobeam'"
    inputBinding:
      prefix:  ini_gausfit
      position: 40
  ini_method:
    type:
      type: enum
      symbols: [intensity,curvature]
    doc: "Method by which inital guess for fitting of Gaussians is chosen: 'intensity' or 'curvature'"
    inputBinding:
      prefix:  ini_method
      position: 41
  kappa_clip:
    type: float
    doc: "Kappa for clipped mean and rms. None => calculate inside program"
    inputBinding:
      prefix:  kappa_clip
      position: 42
  minpix_isl:
    type: int
    doc: "Minimum number of pixels with emission per island (minimum is 6 pixels). None -> calculate inside program"
    inputBinding:
      prefix:  minpix_isl
      position: 43
  ncores:
    type: int
    doc: "Number of cores to use during fitting, None => use all"
    inputBinding:
      prefix:  ncores
      position: 44
  peak_fit:
    type: boolean
    doc: "Find and fit peaks of large islands iteratively"
    inputBinding:
      prefix:  peak_fit
      position: 45
  peak_maxsize:
    type: float
    doc: "If island size in beam area is more than this, attempt to fit peaks iteratively (if peak_fit = True). Min value is 30"
    inputBinding:
      prefix:  peak_maxsize
      position: 46
  rms_value:
    type: float
    doc: "Value of constant rms in Jy/beam to use if rms_map = False. None => calculate inside program"
    inputBinding:
      prefix:  rms_value
      position: 47
  spline_rank:
    type: int
    doc: "Rank of the interpolating function for rms/mean map"
    inputBinding:
      prefix:  spline_rank
      position: 48
  split_isl:
    type: boolean
    doc: "Split island if it is too large, has a large convex deficiency and it opens well."
    inputBinding:
      prefix:  split_isl
      position: 49
  splitisl_maxsize:
    type: float
    doc: "If island size in beam area is more than this, consider splitting island. Min value is 50"
    inputBinding:
      prefix:  splitisl_maxsize
      position: 50
  src_ra_dec:
    type: array[]
    doc: "List of source positions at which fitting is done.  E.g., src_ra_dec = [(197.1932, 47.9188), (196.5573, 42.4852)]"
    inputBinding:
      prefix:  src_ra_dec
      separate: true
      position: 51
  src_radius_pix:
    type: int
    doc: "Radius of the island (if src_ra_dec is not None) in pixels. None => radius is set to the FWHM of the beam major axis."
    inputBinding:
      prefix:  src_radius_pix
      position: 52
  stop_at:
    type:
      type: enum
      symbols: [isl,read]
    doc: "Stops after: 'isl' = island finding step or 'read' = image reading step"
    inputBinding:
      prefix:  stop_at
      position: 53
  trim_box:
    type: int[]
    doc: "Do source detection on only a part of the image. Specify as (xmin, xmax, ymin, ymax) in pixels. E.g., trim_box = (120, 840, 15, 895). None => use entire image"
    inputBinding:
      prefix:  trim_box
      separate: true
      position: 54
  bbs_patches:
    type:
      type: enum
      symbols: [single,gaussian,source,mask,None]
    doc: "BBS format, type of patch to use: None => no patches. 'single' => all Gaussians in one patch. 'gaussian' => each Gaussian gets its own patch. 'source' => all Gaussians belonging to a single source are grouped into one patch. 'mask' => use mask file specified by bbs_patches_mask"
    inputBinding:
      prefix:  bbs_patches
      position: 56
  catalog_type:
    type:
      type: enum
      symbols: [srl,gaul,shap]
    doc: "Type of catalog to write:  'gaul' - Gaussian list, 'srl' - source list (formed by grouping Gaussians), 'shap' - shapelet list (FITS format only)"
    inputBinding:
      prefix:  catalog_type
      position: 58
  clobber:
    type: boolean
    doc: "Overwrite existing file?"
    inputBinding:
      prefix:  clobber
      position: 59
  correct_proj:
    type: boolean
    doc: "Correct source parameters for image projection (BBS format only)?"
    inputBinding:
      prefix:  correct_proj
      position: 60
  format:
    type:
      type: enum
      symbols: [bbs,ds9,fits,star,kvis,ascii,csv,casabox,sagecal]
    doc: "Format of output catalog"
    inputBinding:
      prefix:  format
      position: 61
  incl_chan:
    type: boolean
    doc: "Include flux densities from each channel (if any)?"
    inputBinding:
      prefix:  incl_chan
      position: 62
  incl_empty:
    type: boolean
    doc: "Include islands without any valid Gaussians (source list only)?"
    inputBinding:
      prefix:  incl_empty
      position: 63
  port2tigger:
    type: boolean
    doc: "Convert output model to tigger format"
    inputBinding:
      prefix:  port2tigger
      position: 65
  spectralindex_do:
    type: boolean
    doc: "Calculate spectral indices (for multi-channel image)"
    inputBinding:
      prefix:  spectralindex_do
      position: 66
  freq0:
    type: float
    doc: "Start frequency (unit => Hz)"
    inputBinding:
      prefix:  freq0
      position: 67
  filename:
    type: File
    doc: "Input image file name"
    inputBinding:
      prefix:  filename
      position: 68
      valueFrom: $(self.basename)
  detection_image:
    type: File
    doc: "Detection image file name used only for detecting islands of emission. Source measurement is still done on the main image"
    inputBinding:
      prefix:  detection_image
      position: 69
      valueFrom: $(self.basename)
  bbs_patches_mask:
    type: File
    doc: "Name of the mask file (of same size as input image) that defines the patches if bbs_patches = 'mask'"
    inputBinding:
      prefix:  bbs_patches_mask
      position: 70
      valueFrom: $(self.basename)

outputs:
  outfile:
    type: File
    doc: "Output file name. None => file is named automatically; 'SAMP' => send to SAMP hub (e.g., to TOPCAT, ds9, or Aladin)"
    outputBinding:
      glob: outfile
  srcroot:
    type: File
    doc: "Name for entries in the output catalog (BBS format only). None => use image file name"
    outputBinding:
      glob: srcroot
