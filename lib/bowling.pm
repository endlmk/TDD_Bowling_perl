package Bowling;
use strict;
use warnings;

sub score {
    my $rolls = shift;

    my @rollsFiltered = grep(/[\d\-\/X]/, split(//, $rolls));
    my @rollsArray;
    while(my ($i, $v) = each @rollsFiltered) {
        if($v eq '-') {
            $v = 0;
        }
        if($v eq 'X') {
            $v = 10;
        }
        if($v eq '/') {
            $v = 10 - $rollsArray[$i - 1];
        }
        push(@rollsArray, $v);
    }

    my $totalScore = 0;
    my $totalRolls = scalar(@rollsArray);
    my $rollsIndex = 0;
    my $currentFrame = 1;
    while($rollsIndex < $totalRolls && $currentFrame <= 10) {
        if($rollsArray[$rollsIndex] == 10) {
            $totalScore += (10 + safe_get_roll(\@rollsArray, $rollsIndex + 1)
                               + safe_get_roll(\@rollsArray, $rollsIndex + 2));
            $rollsIndex += 1;
        }
        elsif(($rollsArray[$rollsIndex] + $rollsArray[$rollsIndex + 1]) == 10) {
            $totalScore += (10 + safe_get_roll(\@rollsArray, $rollsIndex + 2));
            $rollsIndex += 2;
        }
        else {
            $totalScore += ($rollsArray[$rollsIndex] + $rollsArray[$rollsIndex + 1]); 
            $rollsIndex += 2;
        }
        $currentFrame += 1;
    }
    return $totalScore;
}

sub safe_get_roll {
    my ($rollsArray, $rollsIndex) = @_;
    return ($rollsIndex < scalar(@$rollsArray)) ? @$rollsArray[$rollsIndex] : 0;
}

1;