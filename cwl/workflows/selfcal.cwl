cwlVersion: v1.0
class: Workflow

inputs:
  ms: Directory
  image_name: string
  npix: int[]
  scale: string
  niter: int
  weight: string[]
  channelsout: int
  joinchannels: boolean
  auto_mask: float
  auto_threshold: float
  image_column: string
  image_field: int

outputs:
  outimage:
    type: File[]
    outputSource: wsclean/images

steps:
  wsclean:
    run: ../steps/wsclean.cwl
    in:
      ms: ms
      name: image_name
      size: npix
      scale: scale
      niter: niter
      weight: weight
      channels-out: channelsout
      auto-mask: auto_mask
      auto-threshold: auto_threshold
      data-column: image_column
      field: image_field
    out: [images]
