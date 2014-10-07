#!/usr/bin/perl

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

use Modern::Perl;

use CGI;

use C4::Auth;
use C4::Output;
use C4::Members;
use Koha::Borrower::Modifications;
use MIME::Lite;
use Mail::Sendmail;

my $cgi = new CGI;
my $dbh = C4::Context->dbh;

unless ( C4::Context->preference('PatronSelfRegistration') ) {
    print $cgi->redirect("/cgi-bin/koha/opac-main.pl");
    exit;
}

my $token = $cgi->param('token');
my $m = Koha::Borrower::Modifications->new( verification_token => $token );

my ( $template, $borrowernumber, $cookie );
if ( $m->Verify() ) {
    ( $template, $borrowernumber, $cookie ) = get_template_and_user(
        {
            template_name   => "opac-registration-confirmation.tmpl",
            type            => "opac",
            query           => $cgi,
            authnotrequired => 1,
        }
    );

    $template->param(
        OpacPasswordChange => C4::Context->preference('OpacPasswordChange') );

    my $borrower = Koha::Borrower::Modifications->GetModifications({ verification_token => $token });

    my $password;
    ( $borrowernumber, $password ) = AddMember_Opac(%$borrower);

    if ($borrowernumber) {
        Koha::Borrower::Modifications->DelModifications({ verification_token => $token });

        $template->param( password_cleartext => $password );
        $template->param(
            borrower => GetMember( borrowernumber => $borrowernumber ) );
        $template->param(
            PatronSelfRegistrationAdditionalInstructions =>
              C4::Context->preference(
                'PatronSelfRegistrationAdditionalInstructions')
        );
    }
    #[JB] Added in the next 13 lines to generate an email to circ
	#so they check the new patron registrations as soon as possible
	my $msg = MIME::Lite->new(
				From	=> 'iruit@gov.mb.ca',
				To	=> 'irucirc@gov.mb.ca',
				Subject => 'New Registration Request',
				Type	=> 'text/html',
				Data	=> <<END_BODY,
A new registration has been received through the OPAC and is awaiting verification. 
Please review the details and update the patron file accordingly.
<br><br>Refer to the <a href="http://cserv.internal/ecy_sharepoint_gateway/top/iru/kohahelp/wiki_koha/Pages/PatManSelf.aspx">Koha Wiki</a> on the SharePoint site for steps.
END_BODY
				) or warn "Error generating circulation email";
				$msg->send or warn "Could not send message";
}
else {
    ( $template, $borrowernumber, $cookie ) = get_template_and_user(
        {
            template_name   => "opac-registration-invalid.tmpl",
            type            => "opac",
            query           => $cgi,
            authnotrequired => 1,
        }
    );
}

output_html_with_http_headers $cgi, $cookie, $template->output;
