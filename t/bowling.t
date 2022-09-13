use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 14;
use Bowling;

is(Bowling::score("1-"), 1); 
is(Bowling::score("2-"), 2); 
is(Bowling::score("--"), 0); 
is(Bowling::score("-1"), 1); 
is(Bowling::score("9/"), 10); 
is(Bowling::score("X"), 10); 
is(Bowling::score("1-|23"), 6); 
is(Bowling::score("5-|-5|32"), 15); 
is(Bowling::score("5/|45|32"), 28); 
is(Bowling::score("X|-5|32"), 25);  
is(Bowling::score("X|-/|32"), 38); 
is(Bowling::score("6/|-/|X"), 40); 
is(Bowling::score("9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||"), 90); 
is(Bowling::score("5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5"), 150); 
is(Bowling::score("X|X|X|X|X|X|X|X|X|X||--"), 270); 
is(Bowling::score("X|X|X|X|X|X|X|X|X|--||"), 240); 
is(Bowling::score("X|X|X|X|X|X|X|X|X|X||XX"), 300); 
is(Bowling::score("X|X|X|X|X|X|X|X|X|6/||X"), 276); 
