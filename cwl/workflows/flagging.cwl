cwlVersion: v1.0
class: Workflow

requirements:
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement
  - class: SchemaDefRequirement
    types:
      - $import: ../types/types.yaml

inputs:
  ms: Directory
  quackinterval: float
  quackmode: ../types/types.yaml#quackmode?
  autoflag_strategy: File
  autoflag_column: string
  autoflag_fields: string
 
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
        valueFrom: $(true)
    out: [vis_out]

  quack:
    run: ../steps/casa_flagdata.cwl
    in:
      quackmode: quackmode
      quackinterval: quackinterval
      mode:
        valueFrom: quack
      vis: autocorr/vis_out
    out: [vis_out]

  aoflagger:
    run: ../steps/aoflagger.cwl
    in:
      strategy: autoflag_strategy
      column: autoflag_column
      fields: autoflag_fields
      ms: quack/vis_out
    out: [ms_out]
