package Models::Performers::Router;




sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}


sub go
{
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

    if(length($url)==0)
    {
        $url='Index';
        print $url;
    }
    else
    {
       $url=  ucfirst( $url);
    }

    #print $url;
    #print Dumper $url ;
    my  $me='Controllers/CtrlPages/'.$url.'.pm';
    
    require  $me;
    my $r= "Controllers::CtrlPages::$url"->new();
    
    return $r;


}



1;
