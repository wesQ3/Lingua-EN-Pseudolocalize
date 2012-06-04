use 5.14.0;
use Plack::Builder;
use Plack::Request;
use Encode 'encode_utf8';
use lib 'lib';
use Lingua::EN::Pseudolocalize  qw(convert deconvert);

my $test_string = 'first line
second line
third one
Wes Malone, a hoopy frood
hello world
ETAOIN SHRDLU
jcvd might pique a sleazy boxer with funk
the quick onyx goblin jumps over the lazy dwarf';

my $html = <<END
Tokonoma, also referred to simply as toko, is a Japanese term generally referring to a built-in recessed space in a Japanese style reception room, in which items for artistic appreciation are displayed. In English, tokonoma is usually called alcove. The items usually displayed in a tokonoma are calligraphic and/or pictorial scrolls and an arrangement of flowers. Bonsai and okimono are also sometimes displayed there, although traditionally, bonsai were considered to be too dirty for such a highly respected place. The tokonoma and its contents are essential elements of traditional Japanese interior decoration. The word 'toko' literally means "floor" or "bed"; 'ma' means "space" or "room."
When seating guests in a Japanese-style room, the correct etiquette is to seat the most important guest with his or her back facing the tokonoma. This is because of modesty; the host should not be seen to show off the contents of the tokonoma to the guest, and thus it is necessary not to point the guest towards the tokonoma.
Stepping within it is strictly forbidden, except to change the display when a strict etiquette must be followed.
The pillar on one side of the tokonoma is usually made from wood, specially prepared for the purpose. It can range from a seemingly raw trunk with bark still attached, to a square piece of heart wood with very straight grain. The choice of toko-bashira determines the level of formality for the tokonoma.
American architect Frank Lloyd Wright was influenced by Japanese architecture. He translated the meaning of the tokonoma into its western counterpart: the fireplace.[1] This gesture became more of a ceremonial core in his architecture.
END
;

builder {
   mount '/' => sub {
      my $env = shift;
      my $res = Plack::Request->new($env)->new_response(200);
      $res->content_type('text/html; charset=utf-8');
      my $body = $test_string;
      convert($body);
      # deconvert($body);
      $body = join '<br>', split /\n/, $body;
      $res->body(encode_utf8 $body);
      $res->finalize;
   }
};
