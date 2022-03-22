#!/usr/local/bin/perl

use strict;

use warnings;
use feature qw(say);
use Test::More;
use Benchmark qw(cmpthese timethis);
use Data::Dumper qw(Dumper);

my @TESTS = (
  [ 1,3,5,7,9, ],
  [ 2,4,6,8,10,],
  [ 1,2,3,4,5, ],
);

say sprintf 'AM = %10.6f, GM = %10.6f, HM = %10.6f', means( @{$_} ) for @TESTS;

sub means {
  my ($am, $gm, $hm) = (0, 1, 0);

  $am+=$_, $gm*=$_, $hm+=1/$_ for @_;

  ( $am/@_, $gm**(1/@_), @_/$hm );
}
