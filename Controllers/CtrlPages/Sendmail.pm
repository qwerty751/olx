#user7
package Controllers::CtrlPages::Sendmail;

use strict;
use warnings;
use Data::Dumper;

use Models::Utilits::Date;
use Models::Performers::Userme;

use vars qw(%in);
use Models::Utilits::Email::Valid;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
ReadParse();
my $param;
sub new()
{   
	$param = $_[1];
    my $class = ref($_[0])||$_[0];
    return bless({},$class);

}


sub go
{
    my ($self)=@_;
    my $date = Models::Utilits::Date->new();
    unless($in{'send'})
    {
        return 1;
    }
    
    unless($in{'email'} && Email::Valid->address($in{'email'})) 
    {
        $date->{'warings'} = 1;
        return 0;
    }
    
    my $mail;
    
    if ($mail = $in{'mail'})
    {
        $mail =~ s/^\s+|\s+$//g;
        my $l = length $mail;
        unless($l)
        {
            $date->{'warings'} = 2;
            return 0;
        }
    }
    else
    {
        $date->{'warings'} = 2;
        return 0;
    }
   
    
    $date->{'warings'} = 4;
    my $user = Models::Performers::Userme->new();
    unless($user->Sendmail($date->{'pageparam'},$in{'email'},$mail))
    {
        $date->{'warings'} = 3;
    }
    return 1;
}


1;
