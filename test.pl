#!/usr/bin/perl

use strict;
use warnings;

use lib 'Libs';

use MIME::Lite;

my $msg = MIME::Lite->new(
    From     =>'test@assembler.wc.lt',
    To       =>'alexandrtai@gmail.com',
    # Cc       =>'some@other.com, some@more.com',
    Subject  =>'Helloooooo3, nurse!?',
    Data     =>"How's it goin', eh?"
);


my $test =0 ;
eval{
$test = $msg->send('smtp','mx1.hostinger.com.ua',Debug=>1,
           AuthUser=>'test@assembler.wc.lt', AuthPass=>'mymail', Port=>2525);
};


print "good test = $test \n";