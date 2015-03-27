package Controllers::CtrlPages::Addpost;


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
ReadParse();
sub new
{
    
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go
{
    #print '<br>me test Index good <br>';
    my $user =  Models::Performers::Userme->new();
    
    #print Dumper \%in;
    my $date = Models::Utilits::Date->new();

   unless($user->isLogin())
    {   

            $date->{'nextpage'}='Loginme';

             return 1;
                

    }

    if($in{addpost})
    {

        #print $user->getid();
        #######
        (
            ($in{'idSub'})&&
            ($in{'title'} )&&
            ($in{'info'} )&&
            ($in{'price'} )&& 
             ( Models::Performers::Post->addPost($user->getid(),
              $in{'idSub'}, $in{'title'} , $in{'info'} ,$in{'price'}))&&
        ( $date->{'warings'}=1)
      
            
   
        
        )|| (
         $date->{'warings'}=2
        );


    
    }

    
    
}



1;
