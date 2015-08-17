#!perl

#program for formatting the hard drive (logical volume)

use strict;
use warnings;
use Win32::DriveInfo;
use Win32API::File 0.08 qw( :ALL );
use POSIX qw(floor);

my @drives = Win32::DriveInfo::DrivesInUse();
my @hard_drives;
my $N = 0;

#******************* first step ***************************

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

#***********************************************************

#******************* second step ***************************

print "Choose your logical volume which you want to formatting. Enter the number of menu: ";
chomp($N = <STDIN>);

$[ = 1;
my $TotalNumberOfFreeBytes = (Win32::DriveInfo::DriveSpace("$drives[$N]"))[7];
my $FileSize = -s('WvesDq13X3w.jpg');
my $num = floor($TotalNumberOfFreeBytes / $FileSize);
my $K = 1;

mkdir("$drives[$N]:\\f\\");

while($K <= $num)
{
	system("COPY WvesDq13X3w.jpg $drives[$N]:\\f\\F${K}.jpg");
	++$K;
}
#system("FORMAT $drives[$N]:/Q");

#***********************************************************