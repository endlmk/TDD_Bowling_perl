package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    my @frames = split(/\|/, $rolls);
    my $score = 0;
    my @spares = (0) x 10;
    my @strikes = (0) x 10;
    my $frameNum = @frames;
    for (my $frameIndex = 0; $frameIndex < $frameNum; ++$frameIndex) {
        my $frame = @frames[$frameIndex];
        my @rollsInFrame = split(//, $frame);

        if($rollsInFrame[0] eq 'X') {
            $score += 10;
            @strikes[$frameIndex] = 1;
            next;
        } 
        if($rollsInFrame[1] eq '/') {
            $score += 10;
            @spares[$frameIndex] = 1;
            next;
        } 
        my $first = convert_roll($rollsInFrame[0]);
        my $second = convert_roll($rollsInFrame[1]);
        $score += ($first + $second);

        if($frameIndex > 0 && $spares[$frameIndex - 1]) {
            $score += ($first + $second);
        }
        if($frameIndex > 0 && $strikes[$frameIndex - 1]) {
            $score += ($first + $second);
        }
        if($frameIndex > 1 && $strikes[$frameIndex - 2]) {
            $score += ($first + $second);
        }
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