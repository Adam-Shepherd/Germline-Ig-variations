#!/usr/bin/perl -w
use strict;
#takes first n lines of large file.
# First argument number of lines, second input, third output, optional forth position in chr 14 variation file
my $n = $ARGV[0];
open (LRGE, $ARGV[1]) or die "Can't open input file";
open (OUTP, ">$ARGV[2]") or die "Can't open output file\n";
my $posi;
if (defined($ARGV[3]))
{
	$posi = $ARGV[3];
	until ((my $line = <LRGE>) =~ /^14\t$posi/){}
}
for (my $i = 0; $i < $n; $i++)
{
	if (defined(my $line =<LRGE>))
	{
		print OUTP $line;
	}
}
		