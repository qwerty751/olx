#user8
package Controllers::CtrlPages::Register;
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
}


1;
