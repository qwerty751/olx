#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
use constant TDIR=>'/home/alexandr/www/html/olx/'; 
use lib TDIR;
#use lib '/usr/home/user7/public_html/olx/';


use Models::Performers::Router;

sub main
{


    print "Content-type: text/html; encoding='utf-8'\n\n";
    #print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
   my $rout = Models::Performers::Router->new();
    
   #my($t)=router();
   my($t)=$rout->go();
   $t->go();
    
}


main();
