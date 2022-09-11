use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 6;
use Bowling;

is(Bowling::score("1-"), 1); 
is(Bowling::score("2-"), 2); 
is(Bowling::score("--"), 0); 
is(Bowling::score("-1"), 1); 
is(Bowling::score("9/"), 10); 
is(Bowling::score("X"), 10); 
