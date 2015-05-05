#user7
package Controllers::CtrlPages::Userme;

use strict;
use warnings;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Performers::Category;

use vars qw(%in);
use Models::Utilits::Email::Valid;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
#use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
use Models::Performers::Userme;
use Models::Performers::Post;
use Digest::MD5 qw(md5_hex);
ReadParse();

sub new()
{   

    my $class = ref($_[0])||$_[0];
    return bless({},$class);

	}

sub go
{
    my ($self)=@_;
    
    my $user =  Models::Performers::Userme->new();
    
    #print Dumper \%in;
    my $date = Models::Utilits::Date->new();

    if($user->isLogin())
    {   

        unless($in{'exit'})
        {
            #переходим в личный кабинет
            $date->{'nextpage'}='Userme';
            return 1;
        }
        

        $user->logout();
        

    }

    
    $date->{'nextpage'}='Loginme';

    (   ($in{'login'})
        &&($in{'email'})
        &&($in{'pass'}) 
        && (Email::Valid->address($in{'email'}))
        && ($user->login($in{'email'},$in{'pass'}))  
        && ($date->{'nextpage'}='Userme')
    ) 
    || (
        ( $in{'login'})  
        && ( $date->{'nextpage'}='Loginme', $date->{'warings'}=1 )  
    );

    return 1;




}
if($in{'id'})
{
    my($id) = $in{'id'};
    Models::Performers::Post->post2Archive($id);
    print 'post deleted';
}


1;
