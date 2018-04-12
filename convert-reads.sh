#!/bin/bash
sed -n '1~4s/^@/>/p;2~4p' rare/1C_.unmapped.fastq > rare_fasta/1C_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/1F_.unmapped.fastq > rare_fasta/1F_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/2-3F_.unmapped.fastq > rare_fasta/2-3F_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/2C_.unmapped.fastq > rare_fasta/2C_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/3C_.unmapped.fastq > rare_fasta/3C_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/4C_.unmapped.fastq > rare_fasta/4C_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/4F_.unmapped.fastq > rare_fasta/4F_.unmapped.fasta &
sed -n '1~4s/^@/>/p;2~4p' rare/5F_.unmapped.fastq > rare_fasta/5F_.unmapped.fasta &


