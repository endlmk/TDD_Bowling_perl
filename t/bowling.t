use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 1;
use Bowling;

{
    my $score = Bowling::score("1-");
    ok($score==1); 
}
