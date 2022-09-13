package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;
    $rolls =~ s/\|\|/\|/;
    $rolls =~ s/XX/X\|X/;
    my @frames = split(/\|/, $rolls);
    my $score = 0;
    my @spares = (0) x 12;
    my @strikes = (0) x 12;
    my $frameNum = @frames;
    for (my $frameIndex = 0; $frameIndex < $frameNum; ++$frameIndex) {
        my $frame = $frames[$frameIndex];
        my @rollsInFrame = split(//, $frame);
        
        my $first = 0;
        my $second = 0;
        if($rollsInFrame[0] eq 'X') {
            $first = 10;
            @strikes[$frameIndex] = 1;
        } 
        else {
            $first = convert_roll($rollsInFrame[0]);
            if(scalar(@rollsInFrame) == 2)
            {
                if($rollsInFrame[1] eq '/') {
                    $second = 10 - $first;
                    @spares[$frameIndex] = 1;
                } 
                else {
                    $second = convert_roll($rollsInFrame[1]);
                }
            }
        }
        if($frameIndex < 10)
        {
            $score += ($first + $second);
        }

        if($frameIndex > 0 && $spares[$frameIndex - 1]) {
            $score += $first;
        }
        if($frameIndex > 0 && $strikes[$frameIndex - 1] && $strikes[$frameIndex] == 0) {
            $score += $first + $second;
        }
        if($frameIndex > 1 && $strikes[$frameIndex - 2] && $strikes[$frameIndex - 1]) {
            $score += ($first + 10);
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