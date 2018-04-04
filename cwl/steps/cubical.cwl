## Auto generated cwl file
cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: DockerRequirement
    dockerImageId: ska-sa/den
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.data-ms)
      writable: true
    listing:
    - entry: $(inputs.model-beam-pattern)
      writable: false
    listing:
    - entry: $(inputs.bbc-load-from)
      writable: false
    listing:
    - entry: $(inputs.g-load-from)
      writable: false
    listing:
    - entry: $(inputs.g-xfer-from)
      writable: false
    listing:
    - entry: $(inputs.b-load-from)
      writable: false
    listing:
    - entry: $(inputs.b-xfer-from)
      writable: false
    listing:
    - entry: $(inputs.dd-load-from)
      writable: false
    listing:
    - entry: $(inputs.dd-xfer-from)
      writable: false
baseCommand: gocubical
stdout: log-cubical.txt

inputs:
  data-column:
    type: string
    doc: "Name of MS column to read for data."
    inputBinding:
      prefix: --data-column
      position: 1
  data-time-chunk:
    type: int
    doc: "Chunk data up by this number of timeslots. This limits the amount of data
processed at once. Smaller chunks allow for a smaller RAM footprint and
greater parallelism, but this sets an upper limit on the solution intervals
that may be employed. 0 means use full time axis."
    inputBinding:
      prefix: --data-time-chunk
      position: 2
  data-freq-chunk:
    type: int
    doc: "Chunk data by this number of channels. See time-chunk for info.
0 means full frequency axis."
    inputBinding:
      prefix: --data-freq-chunk
      position: 3
  data-chunk-by:
    type: string
    doc: "If set, then time chunks will be broken up whenever the value in the named
column(s) jumps by >JUMPSIZE. Multiple column names may be given, separated
by commas. Use None to disable."
    inputBinding:
      prefix: --data-chunk-by
      position: 4
  data-chunk-by-jump:
    type: float
    doc: "The jump size used in conjunction with chunk-by. If 0, then any change in
value is a jump. If n, then the change must be >n."
    inputBinding:
      prefix: --data-chunk-by-jump
      position: 5
  data-single-chunk:
    type: string
    doc: "If set, processes just one chunk of data matching the chunk ID. Useful for
debugging."
    inputBinding:
      prefix: --data-single-chunk
      position: 6
  sel-field:
    type: int
    doc: "FIELD_ID to read from the MS."
    inputBinding:
      prefix: --sel-field
      position: 7
  sel-ddid:
    type: string
    doc: "DATA_DESC_IDs to read from the MS. Default reads all. Can be specified as
e.g. "5", "5,6,7", "5~7" (inclusive range), "5:8" (exclusive range),
"5:" (from 5 to last)."
    inputBinding:
      prefix: --sel-ddid
      position: 8
  sel-taql:
    type: string
    doc: "Additional TaQL selection string. Combined with other selection options."
    inputBinding:
      prefix: --sel-taql
      position: 9
  sel-chan:
    type: string
    doc: "Channels to read (within each DDID). Default reads all. Can be specified as
e.g. "5", "10~20" (10 to 20 inclusive), "10:21" (same), "10:" (from 10 to
end), ":10" (0 to 9 inclusive), "~9" (same)."
    inputBinding:
      prefix: --sel-chan
      position: 10
  model-ddes:
    type: string[]
    doc: "Enable direction-dependent models. If 'auto', this is determined
by --sol-jones and --model-list, otherwise, enable/disable
explicitly."
    inputBinding:
      prefix: --model-ddes
      position: 12
  model-beam-l-axis:
    type: string
    doc: "Beam l axis"
    inputBinding:
      prefix: --model-beam-l-axis
      position: 14
  model-beam-m-axis:
    type: string
    doc: "Beam m axis"
    inputBinding:
      prefix: --model-beam-m-axis
      position: 15
  montblanc-device-type:
    type: string
    doc: "Use CPU or GPU for simulation."
    inputBinding:
      prefix: --montblanc-device-type
      position: 16
  montblanc-dtype:
    type: string
    doc: "Precision for simulation."
    inputBinding:
      prefix: --montblanc-dtype
      position: 17
  montblanc-feed-type:
    type: string
    doc: "Simulate using linear or circular feeds."
    inputBinding:
      prefix: --montblanc-feed-type
      position: 18
  montblanc-mem-budget:
    type: int
    doc: "Memory budget in MB for simulation."
    inputBinding:
      prefix: --montblanc-mem-budget
      position: 19
  montblanc-verbosity:
    type: string
    doc: "verbosity level of Montblanc's console output"
    inputBinding:
      prefix: --montblanc-verbosity
      position: 20
  weight-column:
    type: string
    doc: "Column to read weights from. Weights are applied by default. Specify an
empty string to disable."
    inputBinding:
      prefix: --weight-column
      position: 21
  flags-apply:
    type: string
    doc: "Which flagsets will be applied prior to calibration. 
Use "-FLAGSET" to apply everything except the named flagset ("-cubical" is
useful, to ignore the flags of a previous CubiCal run)."
    inputBinding:
      prefix: --flags-apply
      position: 22
  flags-auto-init:
    type: string
    doc: "Insert BITFLAG column if it is missing, and initialize a named flagset
from FLAG/FLAG_ROW."
    inputBinding:
      prefix: --flags-auto-init
      position: 23
  flags-save:
    type: string
    doc: "Save flags to named flagset in BITFLAG. If none or 0, will not save."
    inputBinding:
      prefix: --flags-save
      position: 24
  flags-reinit-bitflags:
    type: boolean
    doc: "If true, reninitializes BITFLAG column from scratch. Useful if you ended up
with a dead one."
    inputBinding:
      prefix: --flags-reinit-bitflags
      position: 25
  flags-post-sol:
    type: boolean
    doc: "If True, will do an extra round of flagging at the end  (post-solution)
based on solutions statistics, as per the following options."
    inputBinding:
      prefix: --flags-post-sol
      position: 26
  flags-tf-chisq-median:
    type: string
    doc: "Intervals with chi-squared values larger than this value times the median
will be flagged."
    inputBinding:
      prefix: --flags-tf-chisq-median
      position: 27
  flags-tf-np-median:
    type: string
    doc: "Minimum percentage of unflagged visibilities per time/frequncy slot
required to prevent flagging."
    inputBinding:
      prefix: --flags-tf-np-median
      position: 28
  flags-time-density:
    type: string
    doc: "Minimum percentage of unflagged visibilities along the time axis required
to prevent flagging."
    inputBinding:
      prefix: --flags-time-density
      position: 29
  flags-chan-density:
    type: string
    doc: "Minimum percentage of unflagged visibilities along the frequency axis
required to prevent flagging."
    inputBinding:
      prefix: --flags-chan-density
      position: 30
  flags-ddid-density:
    type: string
    doc: "Minimum percentage of unflagged visibilities along the DDID axis
required to prevent flagging."
    inputBinding:
      prefix: --flags-ddid-density
      position: 31
  sol-jones:
    type: string
    doc: "Comma-separated list of Jones terms to enable, e.g. "G,B,dE"
(default: G)"
    inputBinding:
      prefix: --sol-jones
      position: 32
  sol-precision:
    type: string
    doc: "Solve in single or double precision"
    inputBinding:
      prefix: --sol-precision
      position: 33
  sol-delta-g:
    type: string
    doc: "Theshold for gain accuracy - gains which improve by less than this value
are considered converged."
    inputBinding:
      prefix: --sol-delta-g
      position: 34
  sol-delta-chi:
    type: string
    doc: "Theshold for solution stagnancy - if the chi-squared is improving by less
than this value, the gain is considered stalled."
    inputBinding:
      prefix: --sol-delta-chi
      position: 35
  sol-chi-int:
    type: string
    doc: "Number of iterations to perform between chi-suqared checks. This is done to
avoid computing the expensive chi-squared test evey iteration."
    inputBinding:
      prefix: --sol-chi-int
      position: 36
  sol-last-rites:
    type: boolean
    doc: "Re-estimate chi-squred and noise at the end of a solution cycle. Disabling
last rites can save a bit of time, but makes the post-solution stats less
informative."
    inputBinding:
      prefix: --sol-last-rites
      position: 37
  sol-stall-quorum:
    type: string
    doc: "Minimum percentage of solutions which must have stalled before terminating
the solver."
    inputBinding:
      prefix: --sol-stall-quorum
      position: 38
  sol-term-iters:
    type: string
    doc: "Number of iterations per Jones term. If empty, then each Jones
term is solved for once, up to convergence, or up to its -max-iter
setting.
Otherwise, set to a list giving the number of iterations per Jones term.
For example, given two Jones terms and --sol-num-iter 10,20,10, it will
do 10 iterations on the first term, 20 on the second, and 10 again on the
first."
    inputBinding:
      prefix: --sol-term-iters
      position: 39
  sol-min-bl:
    type: float
    doc: "Min baseline length to solve for"
    inputBinding:
      prefix: --sol-min-bl
      position: 40
  sol-max-bl:
    type: float
    doc: "Max baseline length to solve for. If 0, no maximum is applied."
    inputBinding:
      prefix: --sol-max-bl
      position: 41
  sol-subset:
    type: string
    doc: "Additional subset of data to actually solve for. Any TaQL string may be
used."
    inputBinding:
      prefix: --sol-subset
      position: 42
  bbc-compute-2x2:
    type: boolean
    doc: "Compute full 2x2 BBCs (as opposed to diagonal-only). Only useful if you
really trust the polarisation information in your sky model."
    inputBinding:
      prefix: --bbc-compute-2x2
      position: 44
  bbc-apply-2x2:
    type: boolean
    doc: "Apply full 2x2 BBCs (as opposed to diagonal-only). Only enable this if you
really trust the polarisation information in your sky model."
    inputBinding:
      prefix: --bbc-apply-2x2
      position: 45
  bbc-per-chan:
    type: boolean
    doc: "Compute BBCs per-channel (else across entire band)."
    inputBinding:
      prefix: --bbc-per-chan
      position: 47
  bbc-plot:
    type: boolean
    doc: "Generate output BBC plots."
    inputBinding:
      prefix: --bbc-plot
      position: 48
  dist-ncpu:
    type: int
    doc: "Number of CPUs (processes) to use (0 or 1 disables parallelism)."
    inputBinding:
      prefix: --dist-ncpu
      position: 49
  dist-affinity:
    type: string
    doc: "Set CPU affinity of worker processes. If None or 0, no affinity is set. If N>0,
set affinities starting from core 0, with an increment of N. N=1 is a sensible
value. Can also be an explicit list of NCPU core numbers (or a range(N,M,K) invocation).
Note that first worker is the I/O worker, the rest are compute workers."
    inputBinding:
      prefix: --dist-affinity
      position: 50
  dist-main-affinity:
    type: string
    doc: "Sets CPU affinity of main process. If None, no affinity is set. If "auto", shares
CPU affinity with the I/O worker. Otherwise, give core number."
    inputBinding:
      prefix: --dist-main-affinity
      position: 51
  dist-min-chunks:
    type: string
    doc: "Minimum number of time/freq data-chunks to load into memory
simultaneously. This number should be divisible by ncpu-1 for optimal
performance."
    inputBinding:
      prefix: --dist-min-chunks
      position: 52
  out-mode:
    type:
      type: enum
      symbols: [so,sc,sr,ss,ac,ar,as]
    doc: "Operational mode.
[so] solve only;
[sc] solve and generate corrected visibilities;
[sr] solve and generate corrected residuals;
[ss] solve and generate uncorrected residuals;
[ac] apply solutions, generate corrected visibilities;
[ar] apply solutions, generate corrected residuals;
[as] apply solutions, generate uncorrected residuals;"
    inputBinding:
      prefix: --out-mode
      position: 54
  out-column:
    type: string
    doc: "Output MS column name (if applicable)."
    inputBinding:
      prefix: --out-column
      position: 55
  out-model-column:
    type: string
    doc: "If set, model visibilities will be written to the specified column."
    inputBinding:
      prefix: --out-model-column
      position: 56
  out-reinit-column:
    type: boolean
    doc: "Reinitialize output MS column. Useful if the column is in a half-filled
or corrupt state."
    inputBinding:
      prefix: --out-reinit-column
      position: 57
  out-subtract-model:
    type: int
    doc: "Which model to subtract, if generating residuals."
    inputBinding:
      prefix: --out-subtract-model
      position: 58
  out-subtract-dirs:
    type: string[]
    doc: "Which model directions to subtract, if generating residuals. ":"
subtracts all. Can also be specified as "N", "N:M", ":N", "N:", "N,M,K"."
    inputBinding:
      prefix: --out-subtract-dirs
      position: 59
  out-plots:
    type: boolean
    doc: "Generate summary plots."
    inputBinding:
      prefix: --out-plots
      position: 60
  log-memory:
    type: boolean
    doc: "Log memory usage."
    inputBinding:
      prefix: --log-memory
      position: 61
  log-boring:
    type: boolean
    doc: "Disable progress bars and some console output."
    inputBinding:
      prefix: --log-boring
      position: 62
  log-append:
    type: boolean
    doc: "Append to log file if it exists."
    inputBinding:
      prefix: --log-append
      position: 63
  log-verbose:
    type: string
    doc: "Default console output verbosity level. 
Can either be a single number, or a sequence of "name=level,name=level,..."
assignments."
    inputBinding:
      prefix: --log-verbose
      position: 64
  log-file-verbose:
    type: string
    doc: "Default logfile output verbosity level. 
Can either be a single number, or a sequence of "name=level,name=level,..."
assignments. If None, then this simply follows the console level."
    inputBinding:
      prefix: --log-file-verbose
      position: 65
  debug-pdb:
    type: boolean
    doc: "Jumps into pdb on error."
    inputBinding:
      prefix: --debug-pdb
      position: 66
  debug-panic-amplitude:
    type: float
    doc: "Throw an error if a visibility amplitude in the results exceeds the given value.
Useful for troubleshooting."
    inputBinding:
      prefix: --debug-panic-amplitude
      position: 67
  debug-stop-before-solver:
    type: boolean
    doc: "Invoke pdb before entering the solver."
    inputBinding:
      prefix: --debug-stop-before-solver
      position: 68
  misc-random-seed:
    type: string
    doc: "Seed random number generator with explicit seed. Useful for reproducibility
of the random-based optimizations (sparsification, etc.)."
    inputBinding:
      prefix: --misc-random-seed
      position: 69
  misc-parset-version:
    type: string
    doc: "Parset version number, for migration purposes. Can't be specified on command
line."
    inputBinding:
      prefix: --misc-parset-version
      position: 70
  g-dd-term:
    type: boolean
    doc: "Determines whether this term is direction dependent. --model-ddes must"
    inputBinding:
      prefix: --g-dd-term
      position: 71
  g-time-int:
    type: int
    doc: "Time solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --g-time-int
      position: 72
  g-freq-int:
    type: int
    doc: "Frequency solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --g-freq-int
      position: 73
  g-clip-low:
    type: float
    doc: "Amplitude clipping - flag solutions with diagonal amplitudes below this
value."
    inputBinding:
      prefix: --g-clip-low
      position: 74
  g-clip-high:
    type: float
    doc: "Amplitude clipping - flag solutions with any amplitudes above this value."
    inputBinding:
      prefix: --g-clip-high
      position: 75
  g-clip-after:
    type: int
    doc: "Number of iterations after which to clip this gain."
    inputBinding:
      prefix: --g-clip-after
      position: 76
  g-conv-quorum:
    type: float
    doc: "Minimum percentage of converged solutions to accept."
    inputBinding:
      prefix: --g-conv-quorum
      position: 77
  g-ref-ant:
    type: string
    doc: "Reference antenna - its phase is guaranteed to be zero."
    inputBinding:
      prefix: --g-ref-ant
      position: 78
  g-solvable:
    type: boolean
    doc: "Set to 0 (and specify -load-from or -xfer-from) to load a non-solvable
term is loaded from disk. Not to be confused with --sol-jones, which
determines the active Jones terms."
    inputBinding:
      prefix: --g-solvable
      position: 79
  g-type:
    type: string
    doc: "Type of Jones matrix to solve for. Note that if multiple Jones terms are
enabled, then only complex-2x2 is supported."
    inputBinding:
      prefix: --g-type
      position: 80
  g-fix-dirs:
    type: string[]
    doc: "For DD terms, makes the listed directions non-solvable."
    inputBinding:
      prefix: --g-fix-dirs
      position: 84
  g-update-type:
    type: string
    doc: "Determines update type. This does not change the Jones solver type, but
restricts the update rule to pin the solutions within a certain subspace:
'full' is the default behaviour;
'diag' pins the off-diagonal terms to 0;
'phase-diag' also pins the amplitudes of the diagonal terms to unity;
'amp-diag' also pins the phases to 0."
    inputBinding:
      prefix: --g-update-type
      position: 85
  g-max-prior-error:
    type: float
    doc: "Flag solution intervals where the prior error estimate is above this value."
    inputBinding:
      prefix: --g-max-prior-error
      position: 86
  g-max-post-error:
    type: float
    doc: "Flag solution intervals where the posterior variance estimate is above this value."
    inputBinding:
      prefix: --g-max-post-error
      position: 87
  g-max-iter:
    type: int
    doc: "Maximum number of iterations spent on this term."
    inputBinding:
      prefix: --g-max-iter
      position: 88
  g-prop-flags:
    type: string
    doc: "Flag propagation policy. Determines how flags raised on gains propagate back
into the data. Options are 'never' to never propagate, 'always' to always
propagate, 'default' to only propagate flags from direction-independent gains."
    inputBinding:
      prefix: --g-prop-flags
      position: 89
  b-dd-term:
    type: boolean
    doc: "Determines whether this term is direction dependent. --model-ddes must"
    inputBinding:
      prefix: --b-dd-term
      position: 90
  b-time-int:
    type: int
    doc: "Time solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --b-time-int
      position: 91
  b-freq-int:
    type: int
    doc: "Frequency solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --b-freq-int
      position: 92
  b-clip-low:
    type: float
    doc: "Amplitude clipping - flag solutions with diagonal amplitudes below this
value."
    inputBinding:
      prefix: --b-clip-low
      position: 93
  b-clip-high:
    type: float
    doc: "Amplitude clipping - flag solutions with any amplitudes above this value."
    inputBinding:
      prefix: --b-clip-high
      position: 94
  b-clip-after:
    type: int
    doc: "Number of iterations after which to clip this gain."
    inputBinding:
      prefix: --b-clip-after
      position: 95
  b-conv-quorum:
    type: float
    doc: "Minimum percentage of converged solutions to accept."
    inputBinding:
      prefix: --b-conv-quorum
      position: 96
  b-ref-ant:
    type: string
    doc: "Reference antenna - its phase is guaranteed to be zero."
    inputBinding:
      prefix: --b-ref-ant
      position: 97
  b-solvable:
    type: boolean
    doc: "Set to 0 (and specify -load-from or -xfer-from) to load a non-solvable
term is loaded from disk. Not to be confused with --sol-jones, which
determines the active Jones terms."
    inputBinding:
      prefix: --b-solvable
      position: 98
  b-type:
    type: string
    doc: "Type of Jones matrix to solve for. Note that if multiple Jones terms are
enabled, then only complex-2x2 is supported."
    inputBinding:
      prefix: --b-type
      position: 99
  b-fix-dirs:
    type: string[]
    doc: "For DD terms, makes the listed directions non-solvable."
    inputBinding:
      prefix: --b-fix-dirs
      position: 103
  b-update-type:
    type: string
    doc: "Determines update type. This does not change the Jones solver type, but
restricts the update rule to pin the solutions within a certain subspace:
'full' is the default behaviour;
'diag' pins the off-diagonal terms to 0;
'phase-diag' also pins the amplitudes of the diagonal terms to unity;
'amp-diag' also pins the phases to 0."
    inputBinding:
      prefix: --b-update-type
      position: 104
  b-max-prior-error:
    type: float
    doc: "Flag solution intervals where the prior error estimate is above this value."
    inputBinding:
      prefix: --b-max-prior-error
      position: 105
  b-max-post-error:
    type: float
    doc: "Flag solution intervals where the posterior variance estimate is above this value."
    inputBinding:
      prefix: --b-max-post-error
      position: 106
  b-max-iter:
    type: int
    doc: "Maximum number of iterations spent on this term."
    inputBinding:
      prefix: --b-max-iter
      position: 107
  b-prop-flags:
    type: string
    doc: "Flag propagation policy. Determines how flags raised on gains propagate back
into the data. Options are 'never' to never propagate, 'always' to always
propagate, 'default' to only propagate flags from direction-independent gains."
    inputBinding:
      prefix: --b-prop-flags
      position: 108
  dd-dd-term:
    type: boolean
    doc: "Determines whether this term is direction dependent. --model-ddes must"
    inputBinding:
      prefix: --dd-dd-term
      position: 109
  dd-time-int:
    type: int
    doc: "Time solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --dd-time-int
      position: 110
  dd-freq-int:
    type: int
    doc: "Frequency solution interval for this term. 0 means use entire chunk."
    inputBinding:
      prefix: --dd-freq-int
      position: 111
  dd-clip-low:
    type: float
    doc: "Amplitude clipping - flag solutions with diagonal amplitudes below this
value."
    inputBinding:
      prefix: --dd-clip-low
      position: 112
  dd-clip-high:
    type: float
    doc: "Amplitude clipping - flag solutions with any amplitudes above this value."
    inputBinding:
      prefix: --dd-clip-high
      position: 113
  dd-clip-after:
    type: int
    doc: "Number of iterations after which to clip this gain."
    inputBinding:
      prefix: --dd-clip-after
      position: 114
  dd-conv-quorum:
    type: float
    doc: "Minimum percentage of converged solutions to accept."
    inputBinding:
      prefix: --dd-conv-quorum
      position: 115
  dd-ref-ant:
    type: string
    doc: "Reference antenna - its phase is guaranteed to be zero."
    inputBinding:
      prefix: --dd-ref-ant
      position: 116
  dd-solvable:
    type: boolean
    doc: "Set to 0 (and specify -load-from or -xfer-from) to load a non-solvable
term is loaded from disk. Not to be confused with --sol-jones, which
determines the active Jones terms."
    inputBinding:
      prefix: --dd-solvable
      position: 117
  dd-type:
    type: string
    doc: "Type of Jones matrix to solve for. Note that if multiple Jones terms are
enabled, then only complex-2x2 is supported."
    inputBinding:
      prefix: --dd-type
      position: 118
  dd-fix-dirs:
    type: string
    doc: "For DD terms, makes the listed directions non-solvable."
    inputBinding:
      prefix: --dd-fix-dirs
      position: 122
  dd-update-type:
    type: string
    doc: "Determines update type. This does not change the Jones solver type, but
restricts the update rule to pin the solutions within a certain subspace:
'full' is the default behaviour;
'diag' pins the off-diagonal terms to 0;
'phase-diag' also pins the amplitudes of the diagonal terms to unity;
'amp-diag' also pins the phases to 0."
    inputBinding:
      prefix: --dd-update-type
      position: 123
  dd-max-prior-error:
    type: float
    doc: "Flag solution intervals where the prior error estimate is above this value."
    inputBinding:
      prefix: --dd-max-prior-error
      position: 124
  dd-max-post-error:
    type: float
    doc: "Flag solution intervals where the posterior variance estimate is above this value."
    inputBinding:
      prefix: --dd-max-post-error
      position: 125
  dd-max-iter:
    type: int
    doc: "Maximum number of iterations spent on this term."
    inputBinding:
      prefix: --dd-max-iter
      position: 126
  dd-prop-flags:
    type: string
    doc: "Flag propagation policy. Determines how flags raised on gains propagate back
into the data. Options are 'never' to never propagate, 'always' to always
propagate, 'default' to only propagate flags from direction-independent gains."
    inputBinding:
      prefix: --dd-prop-flags
      position: 127
  data-ms:
    type: File
    doc: "Name of measurement set (MS)"
    inputBinding:
      prefix: --data-ms
      position: 128
      valueFrom: $(self.basename)
  model-beam-pattern:
    type: File
    doc: "Apply beams if specified eg. 'beam_$(corr)_$(reim).fits' or
'beam_$(CORR)_$(REIM).fits'"
    inputBinding:
      prefix: --model-beam-pattern
      position: 129
      valueFrom: $(self.basename)
  bbc-load-from:
    type: File
    doc: "Load and apply BBCs computed in a previous run. Apply with care! This will
tend to suppress all unmodelled flux towards the centre of the field."
    inputBinding:
      prefix: --bbc-load-from
      position: 130
      valueFrom: $(self.basename)
  g-load-from:
    type: File
    doc: "Load solutions from given database. The DB must define solutions
on the same time/frequency grid (i.e. should normally come from
calibrating the same pointing/observation). By default, the Jones
matrix label is used to form up parameter names, but his may be
overridden by adding an explicit "//LABEL" to the database filename."
    inputBinding:
      prefix: --g-load-from
      position: 131
      valueFrom: $(self.basename)
  g-xfer-from:
    type: File
    doc: "Transfer solutions from given database. Similar to -load-from, but
solutions will be interpolated onto the required time/frequency grid,
so they can originate from a different field (e.g. from a calibrator)."
    inputBinding:
      prefix: --g-xfer-from
      position: 132
      valueFrom: $(self.basename)
  b-load-from:
    type: File
    doc: "Load solutions from given database. The DB must define solutions
on the same time/frequency grid (i.e. should normally come from
calibrating the same pointing/observation). By default, the Jones
matrix label is used to form up parameter names, but his may be
overridden by adding an explicit "//LABEL" to the database filename."
    inputBinding:
      prefix: --b-load-from
      position: 133
      valueFrom: $(self.basename)
  b-xfer-from:
    type: File
    doc: "Transfer solutions from given database. Similar to -load-from, but
solutions will be interpolated onto the required time/frequency grid,
so they can originate from a different field (e.g. from a calibrator)."
    inputBinding:
      prefix: --b-xfer-from
      position: 134
      valueFrom: $(self.basename)
  dd-load-from:
    type: File
    doc: "Load solutions from given database. The DB must define solutions
on the same time/frequency grid (i.e. should normally come from
calibrating the same pointing/observation). By default, the Jones
matrix label is used to form up parameter names, but his may be
overridden by adding an explicit "//LABEL" to the database filename."
    inputBinding:
      prefix: --dd-load-from
      position: 135
      valueFrom: $(self.basename)
  dd-xfer-from:
    type: File
    doc: "Transfer solutions from given database. Similar to -load-from, but
solutions will be interpolated onto the required time/frequency grid,
so they can originate from a different field (e.g. from a calibrator)."
    inputBinding:
      prefix: --dd-xfer-from
      position: 136
      valueFrom: $(self.basename)

outputs:
  model-list:
    type: File[]
    doc: "Predict model visibilities from given LSM (using Montblanc)."
    outputBinding:
      glob: model-list
  bbc-save-to:
    type: string
    doc: "Compute suggested BBCs at end of run,
and save them to the given database. It can be useful to have this always
enabled, since the BBCs provide useful diagnostics of the solution quality
(and are not actually applied without a load-from setting)."
    outputBinding:
      glob: bbc-save-to
  out-name:
    type: File
    doc: "Base name of output files."
    outputBinding:
      glob: out-name
  g-save-to:
    type: File
    doc: "Save solutions to given database."
    outputBinding:
      glob: g-save-to
  b-save-to:
    type: File
    doc: "Save solutions to given database."
    outputBinding:
      glob: b-save-to
  dd-save-to:
    type: File
    doc: "Save solutions to given database."
    outputBinding:
      glob: dd-save-to
