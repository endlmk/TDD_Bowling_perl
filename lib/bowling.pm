package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frame = split(//, $rolls);
    return @frame[0];
}

1;