#!/usr/bin/perl -w
use strict;

#Takes IG lines in vcf format and takes any lines with 2 missenses and outputs them
#Takes input file, outputs file.

open (MISFILE, $ARGV[0]) or die "Can't open input file";
open (OUTP, ">$ARGV[1]") or die "Can't open output file";

while (my $line = <MISFILE>)
{
	$line =~ /miss.+miss/ ? print OUTP $line : ();
}
		
