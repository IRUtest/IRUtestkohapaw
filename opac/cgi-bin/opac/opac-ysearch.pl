#!/usr/bin/perl

# This software is placed under the gnu General Public License, v2 (http://www.gnu.org/licenses/gpl.html)

# Copyright 2007 Tamil s.a.r.l.
# Parts copyright 2010-2012 Athens County Public Libraries
#
# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# Koha is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with Koha; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

=head1 opac-ysearch.pl


=cut

use strict;
#use warnings; FIXME - Bug 2505
use CGI;
use C4::Context;
use C4::Members;
use JSON;

my $input   = new CGI;
my $query   = $input->param('term');

my $dbh = C4::Context->dbh;
my $sql = q(
    SELECT borrowernumber, surname, address, city
    FROM borrowers
    WHERE ( surname LIKE ?
            AND ( categorycode = 'D' OR categorycode = 'S'  ) )
);


$sql    .= q( ORDER BY surname LIMIT 10);
my $sth = $dbh->prepare( $sql );
$sth->execute("$query%" );

#print "[";
#my $i = 0;
#while ( my $rec = $sth->fetchrow_hashref ) {
#    if($i > 0){ print ","; }
#    print "{\"borrowernumber\":\"" . $rec->{borrowernumber} . "\",\"" .
#          "surname\":\"".$rec->{surname} . "\",\"" .          
#          "address\":\"".$rec->{address} . "\",\"" .
#          "city\":\"".$rec->{city} . "\",\"" .
#          "}";
#    $i++;
#}
#print "]";
my @query_output;
while ( my $rec = $sth->fetchrow_hashref ) {
    push @query_output, $rec;
} 
# JSON OUTPUT
print JSON::to_json(\@query_output);
