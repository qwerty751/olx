#!/usr/bin/perl 

use warnings;
use strict;
use Data::Dumper;
use File::Basename;
$|=1;

# текущяя дериктория
#use constant TDIR=>'/home/alexandr/www/html/olx/'; 
use constant TDIR=>dirname(__FILE__);
use lib TDIR;
use lib TDIR.'/Models/Utilits';
use lib TDIR.'/Libs';
use Models::Utilits::Date;
use Models::Utilits::Debug;
use Views::View;
use Config::Config;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
#use CGI::Carp qw(fatalsToBrowser); # позволит выводить ошибки в браузер
use Models::Utilits::Sessionme;
use CGI::Session;
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

    my $cgi = CGI->new;
    my $session =  Models::Utilits::Sessionme->new($cgi);
    
    my $cookie = $cgi->cookie(CGISESSID => $session->getId());
    print $cgi->header( -cookie=>$cookie, -charset=>'utf-8');

    #print "Content-type: text/html; encoding='utf-8'\n\n";
    #print '<pre>', Dumper(\%ENV) , '</pre> <hr />'; 

    
   my $rout =Controllers::CommandCtrl::Router->new();
   my $debug = Models::Utilits::Debug->new();
   my($t)=$rout->go(TDIR.'/');
   if($t)
   {
     eval
     {
          $t->go();
     };
     
     if($@)
     {
          $debug->setMsg($@);
     }
                    
   }
   else
   {
       print "no page";
       $date->{'nextpage'}='Error';
   }

    my $view ;
    
    eval
    {
      $view = Views::View->new();
      $view->go(TDIR.'/');
    };
     
     if($@)
     {
          $debug->setMsg($@);
     }
     
    
    my $d=$debug->getMsg();
    print  Dumper(\$d);
    #print TDIR;
    #Config::Config->setDir(77);
    print $date->{'nextpage'};
    #print Config::Config->getDir();
}

main();