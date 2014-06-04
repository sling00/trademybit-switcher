#!/usr/bin/perl
use warnings;
use strict;
require '/opt/ifmi/pm-common.pl';
 my $swopt = "1";
 my $conf = &getConfig;
 my %conf = %{$conf};
my $conffile = "/opt/ifmi/poolmanager.conf";
 my $currentm = $conf{settings}{current_mconf};
 my $minerpath = $conf{miners}{$currentm}{mpath};
 my $output = "";
if ($currentm == $swopt) {
	print "Best profile is current profile, but miner is not running. Attempting to start."
	&startMining;
	} else {
	   print "\nCurrent Profile: " . $conf{miners}{$currentm}{mconfig} . "\n";
	   print "Switching to profile: " . $conf{miners}{$swopt}{mconfig} . "\n";
	   my $output = &switchProfile($swopt);
	   print "$output";
# &switchProfile($swopt);
}