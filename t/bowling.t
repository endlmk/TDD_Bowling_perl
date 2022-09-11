use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 2;
use Bowling;

{
    ok(Bowling::score("1-")==1); 
}

{
    ok(Bowling::score("2-")==2); 
}