package Views::View;
#User7
use warnings;
use strict;

use Models::Utilits::Date;
use Models::Utilits::Debug;
use Models::Utilits::File;
use Data::Dumper;

$|=1;

my $date = Models::Utilits::Date->new();
sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}


sub go()
{
    my ($self,$tdir)=@_;
    #print "Content-type: text/html; encoding='utf-8'\n\n";
    my $templete=$tdir.'Resources/html/'.$date->{'nextpage'}.'.html';
    #print $templete;
    my $html=$self->loadTemplate($templete);

    if($html)
    {
        $html=$self->ReplaceF($html);
        print $html; 
    }
    else
    {   
        $date->{'nextpage'}='Error';
        #$self->go($tdir);
        #print "no file";
    }
}

sub loadTemplate
{
    my($self,$filename)=@_;
    my $file = Models::Utilits::File->new();
    my $html = $file->getFile($filename); 
    return $html;


}


sub ReplaceH
{

    my %hash=( 'test'=>'good'  );
    #print $_[0];
    $_[0]=~s/%%(\w+)%%/$hash{$1}/ge;
    
    return $_[0];

}


sub ReplaceF
{
    my($self,$text)=@_;


    $text=~s/##(\w+)##/$self->$1()/ge;

    return $text;

}





sub viewdebug
{
    
    my($self)=@_;   
    my $debug = Models::Utilits::Debug->new();
    my $d=$debug->getMsg();
    return  Dumper(\$d);


}




1;
