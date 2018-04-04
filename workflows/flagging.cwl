cwlVersion: v1.0
class: Workflow

requirements:
  SchemaDefRequirement:
    types:
      - $import: ../types/types.yaml

inputs:
  ms: Directory
  spw: string
  timerange: string
  quackinterval: float
  quackmode: quackmode?
  strategy: File
  column: string
  fields: string[]
  bands: int[]
  uvrange: string
  spwid: int[]
  mask: File
 
outputs:
  flagged_ms:
    type: Directory
    outputSource: aoflagger/ms_out

steps:
  autocorr:
    run: ../steps/casa_flagdata.cwl
    in:
      vis: ms
      autocorr:
        valueFrom: "true"
    out: [vis_out]

  frequency:
    run: ../steps/casa_flagdata.cwl
    in:
      spw: spw
      vis: autocorr/vis_out
    out: [vis_out]
      
  time:
    run: ../steps/casa_flagdata.cwl
    in:
      timerange: timerange
      vis: frequency/vis_out
    out: [vis_out]
 
  quack:
    run: ../steps/casa_flagdata.cwl
    in:
      quackmode: quackmode
      quackinterval: quackinterval
      vis: time/vis_out
    out: [vis_out]

  rfimasker:
    run: ../steps/rfimasker.cwl
    in:
      ms: quack/vis_out
      uvrange: uvrange
      spwid: spwid
      mask: mask
    out: [ms_out]

  aoflagger:
    run: ../steps/aoflagger.cwl
    in:
      strategy: strategy
      column: column
      fields: fields
      bands: bands
      ms: rfimasker/ms_out
    out: [ms_out]


