#!/usr/bin/perl
use strict;
use CGI::Carp qw( fatalsToBrowser );
use CGI qw( :standard );
use DBI; use DBD::mysql;

print header();
print start_html();


my $databaseHandle = DBI->connect( "dbi:mysql:database=m152196;host=zee.academy.usna.edu:3306;user=m152196;password=m152196");


print end_html;