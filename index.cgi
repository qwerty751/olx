#!/usr/bin/perl 

use warnings;
use strict;
use Data::Dumper;
use File::Basename;
use Config::Config;
use File::Basename;
# текущяя дериктория
#use constant TDIR=>'/home/alexandr/www/html/olx/'; 
use constant TDIR=>dirname(__FILE__);
use lib TDIR;
use Models::Utilits::Date;
use Models::Utilits::Debug;
use Views::View;

Config::Config->setDir(TDIR);

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
    
   
   my($t)=$rout->go(TDIR.'/');

   if($t)
   {
        $t->go();
        
   }
   else
   {
       #print "no page";
       $date->{'nextpage'}='Error';
   }
    
    my $view = Views::View->new();
    $view->go(TDIR.'/');
   
    
    #my $debug = Models::Utilits::Debug->new();
    #my $d=$debug->getMsg();
    #print  Dumper(\$d);
    #print TDIR;
    #Config::Config->setDir(77);

    print Config::Config->getDir();
}


main();
