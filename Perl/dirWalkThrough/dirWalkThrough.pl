#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my @D = dirWalkThrough("/home/kayapo/Dokumentumok");
my $d = Data::Dumper->new(\@D);
print $d->Dump();

# Walktrough in the input
# directory end return an
# array containing all files
# in all 
sub dirWalkThrough {
    my $startDir = shift;
    # clean string tail
    chomp $startDir;
    $startDir =~ s/\/$//;
    
    my @retArr;
    
    # return back with undef if $startDir
    # is not directory
    return undef unless -d $startDir;
    
    my $dirPoint;
    opendir( $dirPoint, $startDir );
    while( my $L = readdir $dirPoint ) {
        # if this string '.' (present dir) or '..' (up dir)
        # continue with next round
        next if $L =~ /^\.\.?$/;

        my $name = "$startDir/$L";
        # if this is a directory run myself
        if ( -d $name ) {
            push @retArr, dirWalkThrough( $name );
            next;
        }
        push @retArr, $name;
    }
    closedir( $dirPoint );
    
    return @retArr;
}
