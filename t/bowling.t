use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 10;
use Bowling;

is(Bowling::score("1-"), 1); 
is(Bowling::score("2-"), 2); 
is(Bowling::score("--"), 0); 
is(Bowling::score("-1"), 1); 
is(Bowling::score("9/"), 10); 
is(Bowling::score("X"), 10); 
is(Bowling::score("1-|23"), 6); 
is(Bowling::score("5-|-5|32"), 15); 
is(Bowling::score("5/|-5|32"), 25); 
is(Bowling::score("X|-5|32"), 30); 
