#!/usr/bin/perl -w
use strict;

#rint $ARG[0], "\n";
open (OUTP, ">$ARGV[1]");
while (my $line=<>)
{
	if ($line !~ /^\s+$/)
	{
		print OUTP "$line";
	}
}