use strict;
use Test::Simple tests => 2;

use Lingua::EN::Pseudolocalize qw( convert deconvert );
use Devel::Dwarn;

my $a_z = 'abcdefghijklmnopqrstuvwxyz';
my $copy = $a_z;

convert($copy);
ok ($copy eq "\x{1ea3}bc\x{221}\x{207}fgh\x{1e2f}".
   "jklmn\x{231}pqr\x{fb06}\x{1eed}vwxyz", 'convert');

deconvert($copy);
ok ($copy eq $a_z, 'round trip conversion');
