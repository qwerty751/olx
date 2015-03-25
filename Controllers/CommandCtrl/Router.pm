package Controllers::CommandCtrl::Router;

#use utf8;
use Encode;
use warnings;
use strict;
use Models::Utilits::File;
use Data::Dumper;
use Models::Utilits::Debug;
use Models::Utilits::GetRout;
use Models::Utilits::Date;


my $debug = Models::Utilits::Debug->new();
sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}


sub go
{   

    my ($self,$tdir)=@_;
    my $date = Models::Utilits::Date->new();
    my @rout =Models::Utilits::GetRout->get() ;
    #print Dumper \@rout;
    #return @rout;
    my $tt=@rout;
    #print $tt;
    my $url=$rout[0];
    #$url='inde3';
    if(length($url)==0)
    {
        $url='Index';
        
    }
    else
    {
       $url=  ucfirst($url);
    }

    my $me =$tdir.'Controllers/CtrlPages/'.$url.'.pm';
    my $f= Models::Utilits::File->new();
    #$me=decode('utf8',$me);    
    unless($f->isfile($me))
    {
      $debug->setMsg('no file'); 
      return 0;
    }
    
    
    eval{ require $me ;};#подключаем файл
    if($@)
    {   
        $debug->setMsg($@);
    }

       
   
    my $r; 
    eval { $r= "Controllers::CtrlPages::$url"->new($rout[1]);}; #передаем параметр  
    if($@)
    {   
        $debug->setMsg($@);
    }
    $date->{'nextpage'}=$url;
    return $r;


}



1;
