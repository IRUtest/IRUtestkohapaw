#!/usr/bin/perl

#This file will be used to reset a borrowers password and e-mail them a new temporary password

use strict;
use warnings;
#use Modern::Perl;

use CGI;

use C4::Members;
use Koha::AuthUtils qw(hash_password);
use C4::Auth;
use C4::Output;
use C4::Context;

#for now, will want to switch to message queue at some point
use MIME::Lite;
use Mail::Sendmail;
use String::Random qw( random_string );


my $cgi = new CGI;
my $dbh   = C4::Context->dbh;

#	Ultimately, need borrower to enter card #
#		check if card # valid
#		if valid check if borrower has email address
#		if yes, generate new password
#			update borrowers table with hashed password
#			email password to patron	
	
	my ( $template, $borrowernumber, $cookie ) = get_template_and_user(
    	   {
        	template_name   => "opac-password-reset.tmpl",
        	query           => $cgi,
        	type            => "opac",
        	authnotrequired => 1,
    	   } 
	);	

	output_html_with_http_headers $cgi, $cookie, $template->output;
	if ( $cgi->param('CardNumber') ) {
		my $borrower = GetMemberDetails(undef, $cgi->param('CardNumber'));  #$borrower is a hash whose keys are the columns of the borrowers table
	
		if ($borrower && $borrower->{'email'}) {
		
		#to set new password 
			my $password = random_string("..........");
		#use hash_password to encrypt the cleartext password
			my $hash = hash_password($password);  #hashes the password
		
		#Prepare and execute CB update 
			my $sth =  $dbh->prepare("UPDATE borrowers SET password = ? WHERE borrowernumber = ?");
			$sth->execute( $hash, $borrower->{'borrowernumber'} );  # runs sql to update table
	
			my $msg = MIME::Lite->new(
				From	=> 'iruit@gov.mb.ca',
				To	=> $borrower->{'email'},
				Cc	=> 'iruit@gov.mb.ca',
				Subject => 'Manitoba Education Library Password Reset',
				Type	=> 'multipart/mixed',
			) or die "Error creating reset email";
		# Needs work
			my $body = "some message with new password";
		
			$msg->attach(
				Type	=> 'TEXT',
				Data	=> $body,
			);
			if ($msg->send) { 
				$template->param( 'password_reset' => '1' );
			}
			else {
				$template->param( 'Error_messages' => '1' ); 
				$template->param( 'EmailFailed' => '1' );
			}		
		}
		elsif ($borrower) { #no email on file
			$template->param( 'Error_messages' => '1' ); 
			$template->param( 'NoEmail' => '1' );
		}
		else { #invalid card number
			$template->param( 'Error_messages' => '1' );
			$template->param( 'CardMismatch' => '1' );
			$template->param( 'AskData' => '1' );
		}
	}
	else {
		$template->param( 'AskData' => '1' );
	}
