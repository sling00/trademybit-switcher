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
 my $oldprofile = "$currentm";
if ($currentm == $swopt) {
	my $mcheck = `ps -eo command | grep -Ec ^$minerpath`;
        if ($mcheck > 0) {
        	print "Miner already running on correct profile.";
	} else {
		print "Best profile is current profile, but miner is not running. Attempting to start.";
		&startMining;
	 	my $mcheck = `ps -eo command | grep -Ec ^$minerpath`;
        if ($mcheck > 0) {
        	print "Miner started successfully";
        } elsif ($mcheck == 0) {
        	print "WARNING: Miner did not start! Check your conf file:";
        	my $mconf = $conf{miners}{$swopt}{savepath};
        	print "$mconf";
        	print "WARNING: Switching back to previous profile!";
        	my $output = &switchProfile($oldprofile);
        	print "$output";
       } else {
	   print "\nCurrent Profile: " . $conf{miners}{$currentm}{mconfig} . "\n";
	   print "Switching to profile: " . $conf{miners}{$swopt}{mconfig} . "\n";
	   my $output = &switchProfile($swopt);
	   print "$output";
}