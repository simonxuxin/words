#!/usr/bin/env perl

use strict;
use warnings;

use FileHandle;

my $handlers;
while (<STDIN>) {
  chomp;
  my $word = $_;
  my ($first, ) = $word =~ /^([a-zA-Z])/;

  unless (exists $handlers->{$first}) {
    $handlers->{$first} = FileHandle->new("> $first");
  }

  $handlers->{$first}->print($word, "\n");
}
