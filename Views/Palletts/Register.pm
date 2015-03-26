package Views::Palletts::Register;
#use Models::Utilits::Date;
#use Data::Dumper;
use warnings;
use strict;

use vars qw(@ISA); 

our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


#use base qw(Views::Palletts::Index);
#our @ISA = "Index";
use Models::Utilits::Date;
use Data::Dumper;


sub new2
{
    my $class = ref($_[0])||$_[0];
    return bless({  },$class);
}


#запускаеться когад нужно мунять на хеши
sub createHash
{
    my $date = Models::Utilits::Date->new();

    my ($self)=@_;
        $self->{'title'}='Форма';
}


#пример функции которая в запуститься если в шаюлоне встретит ##viewdubug##
sub viewdebug
{
    
    my($self)=@_;   
    my $debug = Models::Utilits::Debug->new();
    my $d=$debug->getMsg();
    return  Dumper(\$d);
     
    
}





1;

