#!/usr/bin/perl -w
use strict;

 unless (3 == scalar(@ARGV))	#check files
{
	die "Script requires three arguments\n"; 
}

unless (-T $ARGV[0])			#test variation input file
{
	die "First input file not text file.\n";
}
open(VARIAT, $ARGV[0]) or die "Unable to open genetic variation reference file.\n";

unless (-T $ARGV[1])			#test gene names input file
{
	die "Second input file not text file.\n";
}
open(GENE, $ARGV[1]) or die "Unable to open gene reference file.\n";

if (-e $ARGV[2])		#check if output file already exists
{
	TESTOUT:
	{
		print "Output file already exists. Append (a), Overwrite (o), or Exit (e)? \n";		#give the options
		my $answer = lc(<STDIN>);
		if ($answer eq "a\n")
		{
			print "appending...\n";
			open(OUTP, ">>$ARGV[2]") or die "Unable to open output file.\n";
		}
		elsif ($answer eq "o\n")
		{
			print "overwriting...\n";
			open(OUTP, ">$ARGV[2]") or die "Unable to open output file.\n";
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
	open(OUTP, ">$ARGV[2]") or die "Unable to open output file.\n";
}

my @genes = <GENE>;
#print "@genes\n";

VARICHECK: while (my $vline = <VARIAT>)		
{
	foreach my $gline (@genes)
	{
		chomp $gline;
		if ($vline =~ /$gline/)
		{
			print OUTP "$vline";
			next VARICHECK;
		}
	}
}

print "Reached end of program.\n";