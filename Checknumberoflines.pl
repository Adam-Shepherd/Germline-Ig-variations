#!/usr/bin/perl -w
use strict;
#checks number of lines in large vcf file that aren't header
my $count =  0;
while (my $line = <>)
{
	$line =~ /^#/ ? () : $count++;
}
print $count, "\n";