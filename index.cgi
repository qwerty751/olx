#!/usr/bin/perl 

use warnings;
use strict;
use Data::Dumper;
# текущяя дериктория
#use constant TDIR=>'/home/alexandr/www/html/olx/'; 
use constant TDIR=>'';
#use lib TDIR;
use Models::Utilits::Date;
use Models::Utilits::Debug;
<<<<<<< HEAD
use Data::Dumper;
use vars qw(%IN);
=======
use Views::View;

>>>>>>> 751632e4ae45c4cb60b4de4f6afb9ba719a504ed
my $debug = Models::Utilits::Debug->new();


use Controllers::CommandCtrl::Router;
sub main
{

    
    my $date = Models::Utilits::Date->new();
    
    $date->{'db'}{'name'}='user7';
    $date->{'db'}{'pass'}='tuser7';
    $date->{'db'}{'host'}='localhost';
    $date->{'db'}{'dbname'}='user7';


    print "Content-type: text/html; encoding='utf-8'\n\n";
    #print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
   my $rout =Controllers::CommandCtrl::Router->new();
    
   
   my($t)=$rout->go(TDIR);

   if($t)
   {
        $t->go();
        
   }
   else
   {
       #print "no page";
       $date->{'nextpage'}='Error';
   }
    
<<<<<<< HEAD
   my $d=$debug->getMsg();
   print '<hr>Debug:<br> <pre>', Dumper(\$d),'</pre>';
    print Dumper \%IN;
=======
    my $view = Views::View->new();
    $view->go();
   
    
      
>>>>>>> 751632e4ae45c4cb60b4de4f6afb9ba719a504ed

}


main();
