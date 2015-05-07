package Views::Palletts::Post;
#user 7
use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;
use Models::Performers::Post;

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
    
    
    my ($self)=@_;
       
        
        my $t= Models::Performers::Post->getPostById($date->{'pageparam'});
        #print '<pre>',Dumper \$t, '</pre>';
        
         $self->{'title'}=$t->[0]{'title'};
         $self->{'description'}=$t->[0]{'description'};
         $self->{'authorname'}=$t->[0]{'first_name'};
         $self->{'authorid'}=$t->[0]{'idUser'};
         $self->{'price'}=$t->[0]{'price'};
         
}


sub post
{
    my ($self)=@_;
    my $t;
    
    my $td = $self->loadtemplate('help/td');
    my $tdLP = $self->loadtemplate('help/tdLinkPost');
    my $tr = $self->loadtemplate('help/tr');
    
    $t= Models::Performers::Post->getPosts($date->{'pageparam'});
    my $res='';
    for(@$t)    
    {
        my $temp ='';
        $temp.= $self->render($tdLP, {'value'=>$_->{'title'},
                                      'id'=>$_->{'idPost'} });
        $temp.= $self->render($td, {'value'=>$_->{'first_name'} });
        
        $res.= $self->render($tr, {'value'=>$temp });
    }

    #print '<pre>',Dumper \$t, '</pre>';
    return $res;
}
