#!/usr/bin/perl
# Aaron Fleming 152196
# register.pl

use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

print header();
print start_html();

# Get values from client
my $uname = param('uname');
my $email = param('email');
my $fname = param('fname');
my $lname = param('lname');
my $co = param('co');

my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");

# Insert values into database
my $query = "INSERT INTO roster (username, email, fname, lname, co) VALUES ('$uname', '$email', '$fname', '$lname', '$co')";
my $statementHandle = $databaseHandle->prepare($query);
$statementHandle->execute();

print end_html;