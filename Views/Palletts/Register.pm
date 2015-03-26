package Views::Palletts::Register;
#use Models::Utilits::Date;
#use Data::Dumper;
use warnings;
use strict;


#три строчки которые делают наследие 
use vars qw(@ISA); 
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


use Models::Utilits::Date;




#запускаеться когад нужно мунять на хеши
sub createHash
{
    my $date = Models::Utilits::Date->new();

    my ($self)=@_;
        $self->{'title'}='Форма';
}







1;

