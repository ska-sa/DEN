cwlVersion: v1.0
class: Workflow

inputs:
  ms: Directory
  spw: string
  timerange: string
  quackmode: string
  quackinterval: string
  strategy: File
  column: string
  fields: string
  bands: string
  uvrange: string
  spwid: int[]
  mask: mask
 
outputs: [aoflagger/flagged_ms]

steps:
  autocorr:
    run: ../steps/casa_flagdata.cwl
    in:
      ms: ms
      autocorr: True
    out: [flagged_ms]

  frequency:
    run: ../steps/casa_flagdata.cwl
    in:
      spw: spw
      ms: autocorr/flagged_ms
    out: [flagged_ms]
      
  time:
    run: ../steps/casa_flagdata.cwl
    in:
      timerange: timerange
      ms: frequency/flagged_ms
    out: [flagged_ms]
 
  quack:
    run: ../steps/casa_flagdata.cwl
    in:
      quackmode: quackmode
      quackinterval: quackinterval
      ms: frequency/flagged_ms
    out: [flagged_ms]

  rfimasker:
    run: ../steps/rfimasker.cwl
    in:
      ms: quack/flagged_ms
      uvrange: uvrange
      spwid: spwid
      mask: mask
    out: [flagged_ms]

  aoflagger:
    run: ../steps/aoflagger.cwl
    in:
      strategy: strategy
      column: column
      fields: fields
      bands: bands
      ms: rfimasker/flagged_ms
    out: [flagged_ms]


