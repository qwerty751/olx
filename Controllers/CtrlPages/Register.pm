#user8
package Controllers::CtrlPages::Register;
use vars my(%IN);
use CGI;
use Models::Validators::ValidForm;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;

#use form_register;
#$query = new CGI;
$| = 1;
ReadParse();
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
 
    my $html = loadTemplate('Controllers/CtrlPages/reg_form.html');
    print $html.'<hr />';
    # print Dumper \%in;

}
{
    print '<br>me testi111<br>';
    print Dumper \%IN;

sub loadTemplate
{
    my($fileName) = @_;
    local $/ = undef;
    open my $fh, "<$fileName";
    my $html = <$fh>;
    close $fh;
    return $html;    
}

if($in {'submit'}) 
{
    #print Dumper \%in;
    checkForm();
}

sub checkForm()
{
    my $fname = $in{'fname'};
    my $lname = $in{'lname'};
    my $email = $in{'email'};
    my $pass = $in{'pass'};
    my $conf_pass = $in{'conf_pass'};
    my $phone = $in{'phone'};

    my $valid = "Models::Validators::ValidForm"->new();
    $valid -> validForm($fname, $lname, $email, $pass, $conf_pass, $phone);
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
