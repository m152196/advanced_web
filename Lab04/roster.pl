#!/usr/bin/perl
# Aaron Fleming 152196
# roster.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

# Connect to Database
my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");


my $format = param('format');
my $order = param('order');

# Prepare the query
my $query = "";

# Do default SELECT query if no format is specified
if ($format eq "default") {
	$query = "SELECT * FROM m152196.roster";
}
else {
	# Order query by specified value (username or lname) and return in specified order (ASC or DESC).
	$query = "SELECT * FROM m152196.roster ORDER BY $format $order";
}
# Do the query
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

# Process the results and return as XML
print "Content-type: text/xml; charset=UTF-8\n\n";
print "<LIST>\n";
while ( my @row = $statementHandle->fetchrow_array ) {
	print "\t<USER>\n";
	print "\t\t<USERNAME>$row[1]</USERNAME>\n";
	print "\t\t<EMAIL>$row[2]</EMAIL>\n";
	print "\t\t<FNAME>$row[3]</FNAME>\n";
	print "\t\t<LNAME>$row[4]</LNAME>\n";
	print "\t\t<CO>$row[5]</CO>\n";
	print "\t</USER>\n";
}
print "</LIST>\n";

# Disconnect
$databaseHandle->disconnect();
$statementHandle->finish();