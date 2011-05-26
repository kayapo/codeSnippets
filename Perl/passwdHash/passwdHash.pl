#!/usr/bin/perl -w
use strict;

my @encId = qw( $1$ $5$ $6$ );

print "Hash mode:\n\t0 md5\n\t1 sha256\n\t2 she512\n\n";
print "Your choice: ";
my $hashmode = <STDIN>;
my $salt = $encId[$hashmode] . join('', ('a'..'z','A'..'Z','0'..'9')[rand 62, rand 62, rand 62, rand 62, rand 62, rand 62]);

print "Password: ";
my $passwd = <STDIN>;

print "Hashed password:  " . crypt($passwd,$salt) . "\n";
