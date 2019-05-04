#!/usr/bin/perl

use strict;
use warnings;

open(my $fh, '>', 'bat_alex');

print $fh "read_blif project.blif\n";
print $fh "read_library lib2\n";
print $fh "map\n";
print $fh "print_map_stats\n";
for(my $i = 0;$i < 10000;$i++)
{
    print $fh "fault_tolerance\n";
    print $fh "$i\n";
}


close $fh;
