#!/usr/bin/perl
use warnings;
use strict;
require '/opt/ifmi/pm-common.pl';
 my $swopt = "0";
 my $conf = &getConfig;
 my %conf = %{$conf};
my $conffile = "/opt/ifmi/poolmanager.conf";
 my $currentm = $conf{settings}{current_mconf};
 my $minerpath = $conf{miners}{$currentm}{mpath};
 my $output = "";
   print "\nCurrent Profile: " . $conf{miners}{$currentm}{mconfig} . "\n";
   print "Switching to profile: " . $conf{miners}{$swopt}{mconfig} . "\n";
if ($currentm == $swopt) {
	&startMining;
	} else {
	   my $output = &switchProfile($swopt);
	   print "$output";
# &switchProfile($swopt);
}