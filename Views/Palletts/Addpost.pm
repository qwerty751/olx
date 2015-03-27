package Views::Palletts::Addpost;
#user7
use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;
use Models::Utilits::Email::Valid;
use  Models::Performers::Category;

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
    $self->{'title'}='Добавить пост';    
        
}

#предупреждения
sub warings
{
    if($date->{'warings'}==2)
    {
        return 'Заполните верно все поля!!';
    }
    elsif($date->{'warings'}==1 )
    {
    
        return 'Успшно все добавлено'; 
    }

    return '';
}




sub listsubcat
{
    my $all = Models::Performers::Category->new();
    my $t= $all->getAllList();
    #print  Dumper \$t;
    my $res='<select name="idSub" >';

    for (@$t)
    {
        #print  $_->{'idSub'};
        $res.='<option value="'.$_->{'idSub'}.'">'.$_->{'sub_name'}.'</option>';
    }
    $res.='</select>';

        return  $res;
}


1;
