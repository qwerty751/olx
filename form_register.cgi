#!/usr/bin/perl
use CGI;
#user8
print "Content-type: text/html; charset=utf-8\n\n";
print start_form(-method=>'post',
		    -action=>'/~user7/olx/register');
    print textfield(-name=>'first_name',
		    -value=>'enter your name',
		    -size=>50,
		    -maxlength=>30),
		textfield(-name=>'last_name',
		    -value=>'enter your last name',
		    -size=>50,
		    -maxlength=>30),
		password_field(-name=>'pass',
				-value=>'enter password',
				-size=>50,
				-maxlength=>255),
		password_field(-name=>'confirm_pass',
				-value=>'enter password again',
				-size=>50,
				-maxlength=>255),
		textfield(-name=>'email',
		    -value=>'enter your email',
		    -size=>50,
		    -maxlength=>50),
		submit(-name=>'submit',
			-value=>'Register');
print end_form;
