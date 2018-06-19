#!/usr/bin/perl

use strict;
use warnings;
use POSIX qw(strftime);

my $output = qx{./fiat/verus listtransactions |grep blockstomaturity | cut -d: -f2 | sed 's/,//g'};
my @lines  = sort split /\n/, $output;

my $num = 1;
for my $line (@lines) {
    chomp $line;
    # my $date = localtime(time + 60*$line);
    my $date = strftime "%a %b %e %H:%M:00 %Y", localtime(time + 60*$line);
    print "$num $date\n";
    $num++;
}

print "Total: $num immature blocks\n";