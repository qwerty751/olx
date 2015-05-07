package Views::Palletts::Sendmail;

use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;


#три строчки которые делают наследие 
use vars qw(@ISA); 
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;



my $date = Models::Utilits::Date->new();



#запускаеться когад нужно мунять на хеши
sub createHash
{
    #print $date->{'pageparam'};
    my $mess='';
    
    if($date->{'warings'})
    {
        if($date->{'warings'}==1)
        {
            $mess='почта указана неверно';
        }
        elsif($date->{'warings'}==2)
        {
            $mess='заполнете текст письма';
        }
        elsif($date->{'warings'}==3)
        {
            $mess='ошыбка при отправке письма';
        }
        elsif($date->{'warings'}==4)
        {
            $mess='письмо успешно отправлено';
        }
    }
    
    my ($self)=@_;
        $self->{'title'}='Написать письмо автору';
        $self->{'messeg'}=$mess;
}



1;