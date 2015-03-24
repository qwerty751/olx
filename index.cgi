#!/usr/bin/perl
use vars qw(@ISA @INC @EXPORT_OK );
use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
use constant TDIR=>'/home/alexandr/www/html/perl2/perl/olx/'; 
#use lib TDIR;
use lib '/usr/home/user7/public_html/olx/';
#use  Controller::CtrlPage::test;

sub AUTOLOAD
{
    print '<hr />';
    print Dumper \@_;
    #print $AUTOLOAD;
    print 'tess';
}





sub router
{
    #возвращает массив путей
    #
    
    

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

#
#
#
#
sub main
{


    print "Content-type: text/html; encoding='utf-8'\n\n";
    #print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
    
    
    my($t)=router();
    $t->go();
    
}


main();
