#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0

doc: "A simple pipeline that runs the bwa-mem tool from PCAWG then bamstats"

requirements:
  - class: MultipleInputFeatureRequirement
  - class: StepInputExpressionRequirement
  - class: InlineJavascriptRequirement

inputs:
  output_file_basename: string
  download_reference_files: string
  reference_gz_fai: File
  reference_gz: File
  reference_gz_pac: File
  reference_gz_amb: File
  reads: File[]
  reference_gz_bwt: File
  output_dir: string
  reference_gz_sa: File
  reference_gz_ann: File
  mem_gb: int

outputs:
  merged_output_bai:
    type: File
    outputSource: alignment/merged_output_bai
  merged_output_unmapped_metrics:
    type: File
    outputSource: alignment/merged_output_unmapped_metrics
  merged_output_bam:
    type: File
    outputSource: alignment/merged_output_bam
  merged_output_metrics:
    type: File
    outputSource: alignment/merged_output_metrics
  merged_output_unmapped_bai:
    type: File
    outputSource: alignment/merged_output_unmapped_bai
  merged_output_unmapped_bam:
    type: File
    outputSource: alignment/merged_output_unmapped_bam
  bamstats_report:
    type: File
    outputSource: report/bamstats_report

steps:
  alignment:
    run: ../bwamem_tool/Dockstore.cwl
    in:
      output_file_basename: output_file_basename
      download_reference_files: download_reference_files
      reference_gz_fai: reference_gz_fai
      reference_gz: reference_gz
      reference_gz_pac: reference_gz_pac
      reference_gz_amb: reference_gz_amb
      reads: reads
      reference_gz_bwt: reference_gz_bwt
      output_dir: output_dir
      reference_gz_sa: reference_gz_sa
      reference_gz_ann: reference_gz_ann

    out:
      [merged_output_bai, merged_output_unmapped_metrics, merged_output_bam, merged_output_metrics, merged_output_unmapped_bai, merged_output_unmapped_bam]

  report:
    run: ../bamstat_tool/Dockstore.cwl
    in:
      bam_input: alignment/merged_output_bam
      mem_gb: mem_gb
    out:
      [bamstats_report]
