#!/usr/bin/perl -w
use strict;

while (my $line=<>)
{
	if ($line !~ /\s+/)
	{
		print "$line";
		print "testing...\n";
	}
}