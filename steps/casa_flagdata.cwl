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
    listing:
    - entry: $(inputs.inpfile)
      writable: false
    listing:
    - entry: $(inputs.addantenna)
      writable: false
baseCommand: flagdata
stdout: log-casa_flagdata.txt


arguments:
  - prefix: -c 
    valueFrom: |
      # JavaScript uses lowercase for bools
      true = True
      false = False

      flagdata(
        vis=$( inputs.vis.path ),
        mode=$( inputs.mode ),
        autocorr=$( inputs.autocorr ),
        quackmode=$( inputs.quackmode ),
        quackinterval=$( inputs.quackinterval ),
        spw=$( inputs.spw )
        timerange=$( inputs.timerange ),
        scan=$( inputs.scan ),
        antenna=$( inputs.antenna ),
        )

inputs:
  mode:
    type:
      type: enum
      symbols: [manual,list,clip,quack,shadow,elevation,tfcrop,rflag,extend,unflag,summary]
    doc: "Flagging mode"
    inputBinding:
      prefix:  mode
      position: 1
  field:
    type: string
    doc: "Field names or field index numbers:'' ==> all, field='0~2,3C286'"
    inputBinding:
      prefix:  field
      position: 2
  spw:
    type: string
    doc: "Spectral-window/frequency/channel: '' ==> all, spw='0:17~19'"
    inputBinding:
      prefix:  spw
      position: 3
  antenna:
    type: string
    doc: "Antenna/baselines: '' ==> all, antenna ='3,VA04'"
    inputBinding:
      prefix:  antenna
      position: 4
  timerange:
    type: string
    doc: "Time range: '' ==> all,timerange='09:14:0~09:54:0'"
    inputBinding:
      prefix:  timerange
      position: 5
  correlation:
    type: string
    doc: "Correlation: '' ==> all, correlation='XX,YY'"
    inputBinding:
      prefix:  correlation
      position: 6
  scan:
    type: string
    doc: "Scan numbers: '' ==> all"
    inputBinding:
      prefix:  scan
      position: 7
  intent:
    type: string
    doc: "Observation intent: '' ==> all, intent='CAL*POINT*'"
    inputBinding:
      prefix:  intent
      position: 8
  array:
    type: string
    doc: "(Sub)array numbers: '' ==> all"
    inputBinding:
      prefix:  array
      position: 9
  uvrange:
    type: string
    doc: "UV range: '' ==> all; uvrange ='0~100klambda', default units=meters"
    inputBinding:
      prefix:  uvrange
      position: 10
  observation:
    type: string
    doc: "Observation ID: '' ==> all"
    inputBinding:
      prefix:  observation
      position: 11
  feed:
    type: string
    doc: " Multi-feed numbers: Not yet implemented"
    inputBinding:
      prefix:  feed
      position: 12
  autocorr:
    type: boolean
    doc: "Flag only the auto-correlations"
    inputBinding:
      prefix:  autocorr
      position: 13
  reason:
    type: string[]
    doc: "Select by REASON types"
    inputBinding:
      prefix:  reason
      separate: true
      position: 15
  tbuff:
    type: float[]
    doc: "List of time buffers (sec) to pad timerange in flag commands"
    inputBinding:
      prefix:  tbuff
      separate: true
      position: 16
  datacolumn:
    type: string
    doc: "Data column on which to operate (data,corrected,model,weight,etc.)"
    inputBinding:
      prefix:  datacolumn
      position: 17
  clipminmax:
    type: float[]
    doc: "Range to use for clipping"
    inputBinding:
      prefix:  clipminmax
      separate: true
      position: 18
  clipoutside:
    type: boolean
    doc: "Clip outside the range, or within it"
    inputBinding:
      prefix:  clipoutside
      position: 19
  channelavg:
    type: boolean
    doc: "Average over channels (scalar average)"
    inputBinding:
      prefix:  channelavg
      position: 20
  clipzeros:
    type: boolean
    doc: "Clip zero-value data"
    inputBinding:
      prefix:  clipzeros
      position: 21
  quackinterval:
    type: float
    doc: "Quack n seconds from scan beginning or end"
    inputBinding:
      prefix:  quackinterval
      position: 22
  quackmode:
    type:
      type: enum
      symbols: [beg,endb,end,tail]
    doc: "Quack mode. 'beg' ==> first n seconds of scan.'endb' ==> last n seconds of scan. 'end' ==> all but first n seconds of scan. 'tail' ==> all but last n seconds of scan."
    inputBinding:
      prefix:  quackmode
      position: 23
  quackincrement:
    type: boolean
    doc: "Flag incrementally in time?"
    inputBinding:
      prefix:  quackincrement
      position: 24
  tolerance:
    type: float
    doc: "Amount of shadow allowed (in meters)"
    inputBinding:
      prefix:  tolerance
      position: 25
  lowerlimit:
    type: int
    doc: "Lower limiting elevation (in degrees)"
    inputBinding:
      prefix:  lowerlimit
      position: 27
  upperlimit:
    type: int
    doc: "Upper limiting elevation (in degrees)"
    inputBinding:
      prefix:  upperlimit
      position: 28
  ntime:
    type: string[]
    doc: "Time-range to use for each chunk (in seconds or minutes)"
    inputBinding:
      prefix:  ntime
      position: 29
  combinescans:
    type: boolean
    doc: "Accumulate data across scans depending on the value of ntime."
    inputBinding:
      prefix:  combinescans
      position: 30
  timecutoff:
    type: float
    doc: "Flagging thresholds in units of deviation from the fit"
    inputBinding:
      prefix:  timecutoff
      position: 31
  freqcutoff:
    type: float
    doc: "Flagging thresholds in units of deviation from the fit"
    inputBinding:
      prefix:  freqcutoff
      position: 32
  timefit:
    type:
      type: enum
      symbols: [poly,line]
    doc: "Fitting function for the time direction (poly/line)"
    inputBinding:
      prefix:  timefit
      position: 33
  freqfit:
    type:
      type: enum
      symbols: [poly,line]
    doc: "Fitting function for the frequency direction (poly/line)"
    inputBinding:
      prefix:  freqfit
      position: 34
  maxnpieces:
    type: int
    doc: "Number of pieces in the polynomial-fits (for 'freqfit' or 'timefit' ='poly')"
    inputBinding:
      prefix:  maxnpieces
      position: 35
  flagdimension:
    type:
      type: enum
      symbols: [freq,time,freqtime,timefreq]
    doc: "Dimensions along which to calculate fits (freq/time/freqtime/timefreq)"
    inputBinding:
      prefix:  flagdimension
      position: 36
  usewindowstats:
    type:
      type: enum
      symbols: [none,sum,std,both]
    doc: "Calculate additional flags using sliding window statistics (none,sum,std,both)"
    inputBinding:
      prefix:  usewindowstats
      position: 37
  halfwin:
    type: int
    doc: "Half-width of sliding window to use with 'usewindowstats' (1,2,3)."
    inputBinding:
      prefix:  halfwin
      position: 38
  extendflags:
    type: boolean
    doc: "Extend flags along time, frequency and correlation."
    inputBinding:
      prefix:  extendflags
      position: 39
  extendpols:
    type: boolean
    doc: "If any correlation is flagged, flag all correlations"
    inputBinding:
      prefix:  extendpols
      position: 40
  growtime:
    type: float
    doc: "Flag all 'ntime' integrations if more than X% of the timerange is flagged (0-100)"
    inputBinding:
      prefix:  growtime
      position: 41
  growfreq:
    type: float
    doc: "Flag all selected channels if more than X% of the frequency range is flagged(0-100)"
    inputBinding:
      prefix:  growfreq
      position: 42
  growaround:
    type: boolean
    doc: "Flag data based on surrounding flags"
    inputBinding:
      prefix:  growaround
      position: 43
  flagneartime:
    type: boolean
    doc: "Flag one timestep before and after a flagged one (True/False)"
    inputBinding:
      prefix:  flagneartime
      position: 44
  flagnearfreq:
    type: boolean
    doc: "Flag one channel before and after a flagged one (True/False)"
    inputBinding:
      prefix:  flagnearfreq
      position: 45
  minrel:
    type: float
    doc: "minimum number of flags (relative)"
    inputBinding:
      prefix:  minrel
      position: 46
  maxrel:
    type: float
    doc: "maximum number of flags (relative)"
    inputBinding:
      prefix:  maxrel
      position: 47
  minabs:
    type: int
    doc: "minimum number of flags (absolute)"
    inputBinding:
      prefix:  minabs
      position: 48
  maxabs:
    type: int
    doc: "maximum number of flags (absolute). Use a negative value to indicate infinity."
    inputBinding:
      prefix:  maxabs
      position: 49
  spwchan:
    type: boolean
    doc: "Print summary of channels per spw"
    inputBinding:
      prefix:  spwchan
      position: 50
  spwcorr:
    type: boolean
    doc: "Print summary of correlation per spw"
    inputBinding:
      prefix:  spwcorr
      position: 51
  basecnt:
    type: boolean
    doc: "Print summary counts per baseline"
    inputBinding:
      prefix:  basecnt
      position: 52
  name:
    type: string
    doc: "Name of this summary report (key in summary dictionary)"
    inputBinding:
      prefix:  name
      position: 53
  action:
    type:
      type: enum
      symbols: [none,apply,calculate]
    doc: "Action to perform in MS and/or in inpfile (none/apply/calculate)"
    inputBinding:
      prefix:  action
      position: 54
  display:
    type:
      type: enum
      symbols: [data,report,both]
    doc: "Display data and/or end-of-MS reports at runtime (data/report/both)."
    inputBinding:
      prefix:  display
      position: 55
  flagbackup:
    type: boolean
    doc: "Back up the state of flags before the run"
    inputBinding:
      prefix:  flagbackup
      position: 56
  savepars:
    type: boolean
    doc: "Save the current parameters to the FLAG_CMD table or to a file"
    inputBinding:
      prefix:  savepars
      position: 57
  cmdreason:
    type: string
    doc: "Reason to save to output file or to FLAG_CMD table."
    inputBinding:
      prefix:  cmdreason
      position: 58
  winsize:
    type: int
    doc: "Number of timesteps in the sliding time window [aips:fparm(1)]"
    inputBinding:
      prefix:  winsize
      position: 60
  timedev:
    type: float
    doc: "Time-series noise estimate : [aips:noise]"
    inputBinding:
      prefix:  timedev
      position: 61
  freqdev:
    type: float
    doc: "Spectral noise estimate : [aips:scutoff]"
    inputBinding:
      prefix:  freqdev
      position: 62
  timedevscale:
    type: float
    doc: "Threshold scaling for timedev : [aips:fparm(9)] "
    inputBinding:
      prefix:  timedevscale
      position: 63
  freqdevscale:
    type: float
    doc: "Threshold scaling for freqdev : [aips:fparm(10)]"
    inputBinding:
      prefix:  freqdevscale
      position: 64
  spectralmax:
    type: float
    doc: "Flag whole spectrum if freqdev is greater than spectralmax"
    inputBinding:
      prefix:  spectralmax
      position: 65
  spectralmin:
    type: float
    doc: "Flag whole spectrum if freqdev is less than spectralmin : [aips:fparm(5)]"
    inputBinding:
      prefix:  spectralmin
      position: 66
  chanbin:
    type: int
    doc: "Bin width for channel average in number of input channels"
    inputBinding:
      prefix:  chanbin
      position: 67
  vis:
    type: File
    doc: "Name of MS file or calibration table"
    inputBinding:
      prefix:  vis
      position: 68
      valueFrom: $(self.basename)
  inpfile:
    type: File
    doc: "Input ASCII file, list of files or Python list of strings with flag commands"
    inputBinding:
      prefix:  inpfile
      position: 69
      valueFrom: $(self.basename)
  addantenna:
    type: File
    doc: "File name or dictionary with additional antenna names, positions and diameters"
    inputBinding:
      prefix:  addantenna
      position: 70
      valueFrom: $(self.basename)

outputs:
  outfile:
    type: File
    doc: "Name of output file to save current parameters. If empty, save to FLAG_CMD"
    outputBinding:
      glob: outfile
