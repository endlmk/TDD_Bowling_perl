package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frames = split(/\|/, $rolls);
    my $score = 0;
    foreach my $frame (@frames) {
        my @rollsInFrame = split(//, $frame);

        if($rollsInFrame[0] eq 'X') {
            $score += 10;
            next;
        } 
        if($rollsInFrame[1] eq '/') {
            $score += 10;
            next;
        } 
        my $first = convert_roll($rollsInFrame[0]);
        my $second = convert_roll($rollsInFrame[1]);
        $score += ($first + $second);
    }
    return $score;
}

sub convert_roll {
    my $roll = shift;
    if($roll eq '-') {
        return 0;
    }
    return $roll;
}

1;