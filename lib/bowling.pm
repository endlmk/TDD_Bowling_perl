package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frame = split(//, $rolls);

    my $first = convert_roll($frame[0]);
    my $second = convert_roll($frame[1]);
    return $first + $second;
}

sub convert_roll {
    my $roll = shift;
    if($roll eq '-') {
        return 0;
    }
    return $roll;
}

1;