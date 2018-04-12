#!/bin/bash
interleave.sh rare_fasta/1C_R1.fasta  rare_fasta/1C_R2.fasta rare_int/1C.fasta &

interleave.sh rare_fasta/1F_R1.fasta  rare_fasta/1F_R2.fasta rare_int/1F.fasta &

interleave.sh rare_fasta/2-3F_R1.fasta  rare_fasta/2-3F_R2.fasta rare_int/2-3F.fasta &

interleave.sh rare_fasta/2C_R1.fasta  rare_fasta/2C_R2.fasta rare_int/2C.fasta &

interleave.sh rare_fasta/3C_R1.fasta  rare_fasta/3C_R2.fasta rare_int/3C.fasta &

interleave.sh rare_fasta/4C_R1.fasta  rare_fasta/4C_R2.fasta rare_int/4C.fasta &

interleave.sh rare_fasta/4F_R1.fasta  rare_fasta/4F_R2.fasta rare_int/4F.fasta &

interleave.sh rare_fasta/5F_R1.fasta  rare_fasta/5F_R2.fasta rare_int/5F.fasta &

