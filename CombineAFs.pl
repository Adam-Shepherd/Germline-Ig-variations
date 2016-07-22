#!/usr/bin/perl -w
use strict;

scalar(@ARGV) != 3 ? die "Needs 3 arguments (one non-pop allele frequency (AF) vcf file, one population AF vcf file, and one output file)\n" : ();

(-T $ARGV[0]) or die "First argument must be text (vcf) file.\n" ;
open(NONPOP, $ARGV[0]) or die "Can't open non-pop AF file.\n";

(-T $ARGV[1]) or die "Second argument must be text (vcf) file.\n";
open(POPU, $ARGV[1]) or die "Can't open population AF file.\n";

#(-e $ARGV[2]) ? die "Output file already exists.\n" : ();
open(OUTP, ">$ARGV[2]") or die "Can't open output file.\n";

my $npline = <NONPOP>;
my $chrno;
my $posi;
my $midpart;
my $endpart;
if ($npline =~ /^(\d+\t)(\d+)((\t\S+){5}\t\S+)(CSQ=.+)$/)
{
	$chrno = $1;
	$posi = $2;
	$midpart = $3;
	$endpart = $5; #as $4 is nested bracket
}
else
{
	print "Non matched line:", $npline, "\n";
}

while (my $pline = <POPU>)
{
	if ($pline =~ /^\d+\t$posi(\t\S+){5}\t\S+;(DP=.+SAS_AF=[\d.,]+;)/)
	{
		my $popfreq = $2;
		print OUTP $chrno.$posi.$midpart.$popfreq.$endpart, "\n";
		$npline = <NONPOP>;
		defined($npline) or die "End of non-population file\n";
		if ($npline =~ /^(\d+\t)(\d+)((\t\S+){5}\t\S+)(CSQ=.+)$/)
		{
			$chrno = $1;
			$posi = $2;
			$midpart = $3;
			$endpart = $5; #as $4 is nested bracket
		}
		else
		{
			print "Non matched line:", $npline, "\n";
		}
	}
}