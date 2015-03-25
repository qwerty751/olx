package Controllers::CommandCtrl::Router;

#use utf8;
use Encode;
use warnings;
use strict;
use Models::Utilits::File;
use Data::Dumper;
use Models::Utilits::Debug;


my $debug = Models::Utilits::Debug->new();
sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}


sub go
{   

    my ($self,$tdir)=@_;

    my @sname=split /\//, $ENV{'SCRIPT_NAME'} ;

    my $test= $ENV{'REQUEST_URI'} ;

    for(@sname)
    {   
        $test=~s/$_\///;
        #print $_ ;
    }
    my @rout = split /\//, $test;
    #print Dumper \@rout;
    #return @rout;
    my $tt=@rout;
    #print $tt;
    my $url=$rout[$tt-1];
    #$url='inde3';
    if(length($url)==0)
    {
        $url='Index';
        
    }
    else
    {
       $url=  ucfirst($url);
    }

    #print $url."\n";
    #print Dumper $url ;

    #print Dumper(\%INC); 
    
    
    #my  $me='Controllers/CtrlPages/'.$url.'pm';

    
        
    #my  $me='/home/alexandr/www/html/olx/Controllers/CtrlPages/'.$url.'.pm';
    my $me =$tdir.'Controllers/CtrlPages/'.$url.'.pm';
    my $f= Models::Utilits::File->new();
    #$me=decode('utf8',$me);    
    unless($f->isfile($me))
    {
      #  return 0;
      $debug->setMsg('no file');
      #print "\n no file! \n"
      return 0;
    }
    
    print "goodfil:$me! \n "; 
    #$me="$tdir/Controllers/CtrlPages/Index.pm";

    print 
    #eval{ require '/home/alexandr/www/html/olx/Controllers/CtrlPages/Index.pm' ;};
    eval{ require $me ;};
    if($@)
    {   
        $debug->setMsg($@);
    }

       
    #$me=~ s/\//::/g;
    #require "/home/alexandr/www/html/olx/$me";
    my $r; 
    eval { $r= "Controllers::CtrlPages::$url"->new();};
    if($@)
    {   
        $debug->setMsg($@);
    }
    return $r;


}



1;
