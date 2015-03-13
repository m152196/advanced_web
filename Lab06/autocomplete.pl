#!/usr/bin/perl
# Aaron Fleming 152196
# autocomplete.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

# Connect to Database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");

# Get the current text entered
my $current = param('q');

# Select usernames that begin with the current string, and order them by amount of times they have been searched
my $query = "SELECT username FROM m152196.roster WHERE username LIKE '$current%' ORDER BY searches DESC";

# Do the query
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

# Process the results and return as XML
print "Content-type: text/plain; charset=UTF-8\n\n";
while( my @row = $statementHandle->fetchrow_array ) {
	print "$row[0]\n";
}
# Disconnect
$databaseHandle->disconnect();
$statementHandle->finish();