#!/usr/bin/perl
# Aaron Fleming 152196
# Lab05
# setHighscore.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

# Connect to Database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");

my $username = param('username');
my $highscore = param('highscore');

# Prepare the query
my $query = "SELECT * FROM Highscore";

# Do the query
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

my @result = $statementHandle->fetchrow_array;
my $oldHighscore = $result[1];

if( $highscore > $oldHighscore ) {
	$query = "UPDATE Highscore SET username = '$username', highscore = '$highscore'";
	$statementHandle = $databaseHandle->prepare($query);
	$statementHandle->execute();
	
	print "Content-type: text/plain; charset=UTF-8\n\n";
	print "Your highscore has been recorded! Congratulations!";
}
else {
	print "Content-type: text/plain; charset=UTF-8\n\n";
	print "You did not earn a highscore! Try again.";
}

# Disconnect
$statementHandle->finish();
$databaseHandle->disconnect();