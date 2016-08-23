#!/usr/bin/env perl

use strict;
use warnings;
use Pegex::Parser;
use Pegex::Grammar;
use Pegex::Tree::Wrap;

use XXX;

{
  package TinyDNS::Data;
  use base 'Pegex::Tree::Wrap';

  use XXX;

  sub initial {
    print "Starting out...\n"
  }

  sub final {
    my ($self, $got) = @_;
    XXX $got;
  }

  sub got_AAAA {
    my ($self, $got) = @_;
    $got->[1] =~ s/\\\d+/Foo/g;
    $got;
  }
}

# $ENV{PERL_PEGEX_DEBUG} = 1;

my $grammar = Pegex::Grammar->new(
  file => './tinydns.pgx',
);

my $parser = Pegex::Parser->new(
  grammar => $grammar,
  receiver => TinyDNS::Data->new,
  debug => $ENV{DEBUG},
);

my $input = do {local $/; <>};

my $result = $parser->parse($input);
