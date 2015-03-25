package Models::Utilits::GetRout;

use warnings;
use strict;



sub get 
{
    my @sname=split /\//, $ENV{'SCRIPT_NAME'} ;

    my $test= $ENV{'REQUEST_URI'} ;

    for(@sname)
    {   
        $test=~s/$_\///;
        #print $_ ;
    }
    my @rout = split /\//, $test;

    return @rout;

}



1;
