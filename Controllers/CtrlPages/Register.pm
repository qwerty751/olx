#user8
package Controllers::CtrlPages::Register;
use vars my(%IN);
use CGI;
use Models::Validators::ValidForm;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;
use Models::Interfaces::Sql;

$| = 1;
ReadParse();
my $query = new CGI;
use Data::Dumper;
sub new
{   
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go
{   
 
    #my $html = loadTemplate('Controllers/CtrlPages/reg_form.html');
    #print $html.'<hr />';
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
    my $check = $valid -> validForm($fname, $lname, $email, $pass, $conf_pass, $phone);
    if ($check eq 1)
    {
         $sql = "INSERT INTO olx_users (first_name, last_name, pass, email,
         phone) VALUES ('$fname', '$lname', '$pass',
         '$email', $phone)";

         #rint $sql;
    ($db = Models::Interfaces::Sql->new('user7', 'localhost', 'user7', 'tuser7'))
    && ($db -> connect())
    && ($db -> setQuery($sql))
    && ($db -> execute())
    && ($cnt = $db -> getRows());
    print Dumper \$cnt;
    print  $db -> getError();
    }
    else 
    {
    print Dumper  \$check;
    }
}


1;
