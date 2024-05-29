cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  other-ccu000-deep-vein-thrombosis-dvt---secondary:
    run: other-ccu000-deep-vein-thrombosis-dvt---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  ccu000-deep-vein-thrombosis-dvt-pregnancy---secondary:
    run: ccu000-deep-vein-thrombosis-dvt-pregnancy---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: other-ccu000-deep-vein-thrombosis-dvt---secondary/output
  ccu000-deep-vein-thrombosis-dvt-embolism---secondary:
    run: ccu000-deep-vein-thrombosis-dvt-embolism---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu000-deep-vein-thrombosis-dvt-pregnancy---secondary/output
  ccu000-deep-vein-thrombosis-dvt-buddchiari---secondary:
    run: ccu000-deep-vein-thrombosis-dvt-buddchiari---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu000-deep-vein-thrombosis-dvt-embolism---secondary/output
  ccu000-deep-vein-thrombosis-dvt---secondary:
    run: ccu000-deep-vein-thrombosis-dvt---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu000-deep-vein-thrombosis-dvt-buddchiari---secondary/output
  ccu000-deep-vein-thrombosis-dvt-thrombophlebitis---secondary:
    run: ccu000-deep-vein-thrombosis-dvt-thrombophlebitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu000-deep-vein-thrombosis-dvt---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu000-deep-vein-thrombosis-dvt-thrombophlebitis---secondary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}