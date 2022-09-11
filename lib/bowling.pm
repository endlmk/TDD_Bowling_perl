package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frame = split(//, $rolls);

    my $first = $frame[0];
    my $second = $frame[1];

    if($first eq '-') {
        $first = 0;
    }
    if($second eq '-') {
        $second = 0;
    }

    return $first + $second;
}

1;