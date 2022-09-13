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

        my $frameScore = 0;
        if($rollsInFrame[0] eq 'X') {
            $frameScore = 10;
            @strikes[$frameIndex] = 1;
        } 
        elsif($rollsInFrame[1] eq '/') {
            $frameScore = 10;
            @spares[$frameIndex] = 1;
        } 
        else {
            my $first = convert_roll($rollsInFrame[0]);
            my $second = convert_roll($rollsInFrame[1]);
            $frameScore = $first + $second;
        }

        $score += $frameScore;

        if($frameIndex > 0 && ($spares[$frameIndex - 1] || $strikes[$frameIndex - 1])) {
            $score += $frameScore;
        }
        if($frameIndex > 1 && $strikes[$frameIndex - 2]) {
            $score += $frameScore;
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