package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frame = split(//, $rolls);

    if($frame[0] eq 'X') {
        return 10;
    } 
    if($frame[1] eq '/') {
        return 10;
    } 
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