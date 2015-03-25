#!/usr/bin/perl 

use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
#use constant TDIR=>'/home/alexandr/www/html/olx/'; 
use constant TDIR=>'';
#use lib TDIR;
use Models::Utilits::Date;


#use lib '/usr/home/user7/public_html/olx/';


use Controllers::CommandCtrl::Router;
sub main
{

    
    my $date = Models::Utilits::Date->new();
    
    print "Content-type: text/html; encoding='utf-8'\n\n";
    #print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
   my $rout =Controllers::CommandCtrl::Router->new();
    
   #my($t)=router();
   my($t)=$rout->go(TDIR);

   if($t)
   {
       $t->go();
   }
   else
   {
       print "no page";
   }

}


main();
