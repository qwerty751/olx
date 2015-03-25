#user8
package Models::Validators::ValidForm;


sub new
{   
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub valid
{
	%err = {};
	if ($FORM{'first_name'} !== '' && $FORM{'last_name'} !== '' &&
$FORM{'pass'} !== '' && $FORM{'confirm_pass'} !== '' && $FORM{'email'} !== '')
	{
		if ($FORM{'pass'} !== $FORM{'confirm_pass'})
		{
			$err{'pass'}= 'password not correct';
		}
		if($FORM{'email'} =~ "^[-a-z0-9!#$%&'*+/=?^_`{|}~]+(?:\.[-a-z0-9!#$%&'*+/=?^_`{|}~]+)*@(?:[a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\.)*")
	}
	else 
	{
		$err{'fields'}= 'enter all fields';
	}
	
}



1;