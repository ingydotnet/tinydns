#!/usr/bin/env perl

use strict;
use warnings;
use Pegex::Parser;
use Pegex::Grammar;
use Pegex::Tree::Wrap;

use XXX;

# $ENV{PERL_PEGEX_DEBUG} = 1;

my $grammar = Pegex::Grammar->new(
  file => './tinydns.pgx',
);

my $parser = Pegex::Parser->new(
  grammar => $grammar,
  receiver => Pegex::Tree::Wrap->new,
  debug => $ENV{DEBUG},
);

my $input = do {local $/; <>};

XXX $parser->parse($input);
