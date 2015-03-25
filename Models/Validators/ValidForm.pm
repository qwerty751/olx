#user8
package Models::Validators::ValidForm;
use Data::Dumper;


sub new
{  
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub validForm
{
    my ($fname) = $_[1];
    my ($lname) = $_[2];
    my ($email) = $_[3];
    my ($pass) = $_[4];
    my ($conf_pass) = $_[5];
    my ($phone) = $_[6];

    print Dumper $fname;
    print Dumper $lname;
    print Dumper $email;
    print Dumper $pass;
    print Dumper $conf_pass;
    print Dumper $phone;
#	%err = {};
#	if ($FORM{'first_name'} !== '' && $FORM{'last_name'} !== '' &&
#$FORM{'pass'} !== '' && $FORM{'confirm_pass'} !== '' && $FORM{'email'} !== '')
#	{
#		if ($FORM{'pass'} !== $FORM{'confirm_pass'})
#		{
#			$M{'email'} =~ "^[-a-z0-9!#$%&'*+/=?^_`{|}~]+(?:\.[-a-z0-9!#$%&'*+/=?^_`{|}~]+)*@(?:[a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*")
#	}
#	else 
#	{
#		$err{'fields'}= 'enter all fields';
#	}
	
}



1;
