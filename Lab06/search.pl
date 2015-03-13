#!/usr/bin/perl
# Aaron Fleming 152196
# search.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

# Connect to Database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");

# Get the username for which to search
my $username = param('username');

# Select all information for the specified username
my $query = "SELECT * FROM m152196.roster WHERE username = '$username'";

# Do the query
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

# Process the results and return as XML
print "Content-type: text/xml; charset=UTF-8\n\n";
my @row = $statementHandle->fetchrow_array;
print "\t<USER>\n";
print "\t\t<USERNAME>$row[1]</USERNAME>\n";
print "\t\t<EMAIL>$row[2]</EMAIL>\n";
print "\t\t<FNAME>$row[3]</FNAME>\n";
print "\t\t<LNAME>$row[4]</LNAME>\n";
print "\t\t<CO>$row[5]</CO>\n";
print "\t</USER>\n";

$query = "UPDATE m152196.roster SET searches = searches + 1 WHERE username = '$username'";
$statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

# Disconnect
$databaseHandle->disconnect();
$statementHandle->finish();