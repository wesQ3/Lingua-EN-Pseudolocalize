package Lingua::EN::Pseudolocalize;
use strict; use warnings;
use Sub::Exporter::Simple qw/convert deconvert/;
use charnames ':full';

# ABSTRACT: Test Unicode support by pretending to speak a different language.

my $lookup = {
   'th' => "\N{LATIN SMALL LETTER TH WITH STRIKETHROUGH}",
   'ts' => "\N{LATIN SMALL LETTER TS DIGRAPH}",
   'st' => "\N{LATIN SMALL LIGATURE ST}",
   'a' =>  "\N{LATIN SMALL LETTER A WITH HOOK ABOVE}",
   'b' =>  "\N{LATIN SMALL LETTER B WITH MIDDLE TILDE}",
   'd' =>  "\N{LATIN SMALL LETTER D WITH CURL}",
   'e' =>  "\N{LATIN SMALL LETTER E WITH INVERTED BREVE}",
   'i' =>  "\N{LATIN SMALL LETTER I WITH DIAERESIS AND ACUTE}",
   'o' =>  "\N{LATIN SMALL LETTER O WITH DOT ABOVE}",
   'u' =>  "\N{LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE}",
   'A' =>  "\N{LATIN CAPITAL LETTER A WITH RING BELOW}",
   'E' =>  "\N{LATIN CAPITAL LETTER E WITH TILDE BELOW}",
   'I' =>  "\N{LATIN CAPITAL LETTER I WITH INVERTED BREVE}",
   'O' =>  "\N{LATIN CAPITAL LETTER O WITH STROKE AND ACUTE}",
   'U' =>  "\N{LATIN CAPITAL LETTER U WITH DIAERESIS BELOW}",
   'T' =>  "\N{LATIN CAPITAL LETTER T WITH HOOK}",
   'N' =>  "\N{LATIN CAPITAL LETTER N WITH ACUTE}",
   'S' =>  "\N{LATIN CAPITAL LETTER S WITH COMMA BELOW}",
   'H' =>  "\N{LATIN CAPITAL LETTER H WITH DIAERESIS}",
   'R' =>  "\N{LATIN CAPITAL LETTER R WITH DOT BELOW AND MACRON}",
   'D' =>  "\N{LATIN CAPITAL LETTER D WITH STROKE}",
   'L' =>  "\N{LATIN CAPITAL LETTER L WITH MIDDLE DOT}",
};

sub convert {
   my $str = shift;
   $str =~ s/$_/$lookup->{$_}/g for keys %$lookup;
   return $str
}

sub deconvert {
   my $str = shift;
   $str =~ s/$lookup->{$_}/$_/g for keys %$lookup;
   return $str
}

1;

=head1 SYNOPSIS

use Lingua::EN::Pseudolocalize qw( convert deconvert );

my $text = 'I warned you about stairs, bro!';

convert($text);

=method convert($text)

Converts $text into pseudolocalized text using a simple mapping table. A few pairs are combined into single characters with ligatures, while the rest are simple one-to-one mappings.

Operates in-place on the provided string.

=method deconvert($text)

Reverses the process of convert() using the same mapping table.

Operates in-place on the provided string.

