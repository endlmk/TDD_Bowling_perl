use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use Test::More tests=> 1;
use Bowling;

{
    my $num1 = 1;
    my $double = Bowling::double($num1);

    ok($double==2, 'double'); 
}