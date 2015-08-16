#!perl

#program for formatting the hard drive (logical volume)

use strict;
use warnings;
use Win32::DriveInfo;
use Win32API::File 0.08 qw( :ALL );

my @drives = Win32::DriveInfo::DrivesInUse();
my @hard_drives;
my $N = 1;

for(my $i = $[; $i <= $#drives; $i++)
{
	print "$N." . "$drives[$i]\n";
	$hard_drives[$N] = $drives[$i];
	$N++;
}


