package Views::Palletts::Error;
#user7

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;


sub new
{

    my $class = ref($_[0])||$_[0];
    return bless({  },$class);
}

sub createHash
{
    my $date = Models::Utilits::Date->new();

    my ($self)=@_;
    $self->{'page'}=$date->{'nextpage'};

}

sub test
{
    return 'test';

}

sub viewdebug
{
    
    my($self)=@_;   
    my $debug = Models::Utilits::Debug->new();
    my $d=$debug->getMsg();
    return  Dumper(\$d);
     
    
}


sub AUTOLOAD
{
    return '';

}

1;
