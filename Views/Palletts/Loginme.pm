package Views::Palletts::Loginme;
#user7
use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;
use Models::Utilits::Email::Valid;


#три строчки которые делают наследие 
use vars qw(@ISA); 
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


my $date = Models::Utilits::Date->new();


#запускаеться когад нужно мунять на хеши
sub createHash
{
    #print $date->{'pageparam'};
    
    # my $cat =  Models::Performers::Category->new();
   

   
    my ($self)=@_;
        
        
}

#предупреждения
sub warings
{
    if($date->{'warings'})
    {
        return 'Заполните верно все поля!!';
    }
    return '';
}




1;
