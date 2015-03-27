package Views::Palletts::Category;

use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;


#три строчки которые делают наследие 
use vars qw(@ISA); 
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


my $date = Models::Utilits::Date->new();

use Models::Performers::Category;
my $cat =  Models::Performers::Category->new();

#запускаеться когад нужно мунять на хеши
sub createHash
{
    #print $date->{'pageparam'};
    
    # my $cat =  Models::Performers::Category->new();
   

   
    my ($self)=@_;
        $self->{'title'}=$cat->getCatName($date->{'pageparam'});;
        
}


sub listSubCat
{
    
    my $t=$cat->getLisrSubCat($date->{'pageparam'} );
    

    my $res='';
    for(@$t)    
    {
         $res.='<p><a href="subcategory/'.$_->{'idSub'}.'" >'.
         $_->{'sub_name'}.'</a></p>';
    }

    #print Dumper \$t;

    return $res;
}






1;

