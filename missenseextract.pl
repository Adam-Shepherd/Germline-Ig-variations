#!/usr/bin/perl -w
use strict;

#Takes IG lines in vcf format and takes any lines with missenses and outputs them.
#Takes input file as first argument, outputs or appends second argument as file.

open (MISFILE, $ARGV[0]) or die "Can't open input file";
if (-e $ARGV[1])		#check if output file already exists
{
	TESTOUT:
	{
		print "Output file already exists. Append (a), Overwrite (o), or Exit (e)? \n";		#give the options
		my $answer = lc(<STDIN>);
		if ($answer eq "a\n")
		{
			print "appending...\n";
			open(OUTP, ">>$ARGV[1]") or die "Unable to open output file.\n";
		}
		elsif ($answer eq "o\n")
		{
			print "overwriting...\n";
			open(OUTP, ">$ARGV[1]") or die "Unable to open output file.\n";
		}
		elsif ($answer eq "e\n")
		{
			die "exiting...\n";
		}
		else
		{
			print "Only accepts a, o or e, followed by enter.\n";
			redo TESTOUT;
		}
	}
}
else
{
	open(OUTP, ">$ARGV[1]") or die "Unable to open output file.\n";
}

while (my $line = <MISFILE>)
{
	$line =~ /missense/ ? print OUTP $line : ();
}
		
