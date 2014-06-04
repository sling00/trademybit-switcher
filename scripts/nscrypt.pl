#!/usr/bin/perl
use warnings;
use strict;
require '/opt/ifmi/pm-common.pl';

 my $conf = &getConfig;
 my %conf = %{$conf};

 my $swopt = "1";
 &switchProfile($swopt);