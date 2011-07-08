#!/usr/bin/perl -w
use strict;
use Time::HiRes qw( gettimeofday );

my $sec;
my $microsec;

while ( my $line = <> ) {
    chomp $line;
    last if $line eq '';
    ( $sec, $microsec ) = gettimeofday;
    printf "%d.%0.6d\t$line\n", $sec, $microsec, $line;
}
