#!/usr/bin/perl
# Aaron Fleming 152196
# Lab05
# getHighscore.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

# Connect to Database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");

# Prepare the query
my $query = "SELECT * FROM Highscore";

# Do the query
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

my @result = $statementHandle->fetchrow_array;
my $username = $result[0];
my $highscore = $result[1];

my $json = '{ "username": "'.$username.'", "highscore": '.$highscore.' }';
print header('application/json');
print $json;

# Disconnect
$statementHandle->finish();
$databaseHandle->disconnect();