#!/usr/bin/perl -w
use strict;

my @pagedat;
unless (defined($ARGV[0]))
{
	my $todo = "..\\Todo.txt";
	open(TODO, $todo) or die "I need a file dear.\n";
	@pagedat = <TODO>;
}
else
{
	@pagedat = <>;
}
#print "$pagedat[5]\n";
my $date;
my $time = 0;
my $pages = 0;
foreach my $line (@pagedat)
{
	if ($line =~ /(\d{1,2}\/\d{1,2})\s+(\d+),?\s(\d+)p/)
	{
		$date = $1;
		$time += $2;
		$pages += $3;
	}
}
print "Last date = $date\n";
print "Minutes per page = ";
print $time/$pages;
print "\nPages per hour  = ";
print (60/($time/$pages));
