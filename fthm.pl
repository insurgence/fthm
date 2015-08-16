#!perl

#program for formatting the hard drive (logical volume)

use strict;
use warnings;
use Win32::DriveInfo;
use Win32API::File 0.08 qw( :ALL );

my @drives = Win32::DriveInfo::DrivesInUse();
my @hard_drives;
my $N = 0;

for(my $i = $[; $i <= $#drives; $i++)
{
	$N++;
	my $type = Win32::DriveInfo::DriveType($drives[$i]);
	if($type == 3)
	{
		print "$N. $drives[$i] (HDD)\n";
	} elsif ($type == 2){
		print "$N. $drives[$i] (Flash drive)\n";
	} else {
		--$N;
	}
}