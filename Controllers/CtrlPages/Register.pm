#user8
package Controllers::CtrlPages::Register;
use vars my(%IN);
use CGI;
#use Models::Validators::ValidForm;
my $query = new CGI;
use Data::Dumper;
sub new
{   
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go
{
    print '<br>me testi111<br>';
    print Dumper \%IN;

}

if($query -> param ( 'submit' )) 
{
	checkForm();
}

sub checkForm()
{
    #read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
    #@pairs = split(/&/,$buffer);
    #foreach $pair(@pairs) 
    #{
    #	($name, $value) = split(/=/,$pair);
    #	$value =~ tr/+/ /;
    #		$value =~ s/%([a-fA-F0-9] [a-fA-F0-9])/pack("C", hex($1))/ge;
    #	$FORM{$name} = $value; 
    #}
    #$valid = "Models::Validators::ValidForm"->new(\%FORM);
}


1;
