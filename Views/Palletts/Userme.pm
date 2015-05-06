package Views::Palletts::Userme;
#user7
use warnings;
use strict;
use Models::Performers::Userme;
use Models::Utilits::Date;
use Data::Dumper;
use Models::Performers::Post;
#три строчки которые делают наследие 
use vars qw(@ISA);
use vars qw(%in);
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


sub listpost
{
    my ($self)=@_;
    my $td = $self->loadtemplate('help/td');
    my $tdForm = $self->loadtemplate('help/tdform');
    my $tr = $self->loadtemplate('help/tr');
    my $user =  Models::Performers::Userme->new();
    my $idU = $user->getid();
    my $post= Models::Performers::Post->getListPosts2User($idU);
    #print Dumper  $post;
    
    my $res='';
    
    for(@$post)
    {
        my $temp ='';
        
        $temp.=$self->render($td, {'value'=>$_->{'title'}});
        $temp.=$self->render($td, {'value'=>$_->{'description'}});
        $temp.=$self->render($tdForm, {'id'=>$_->{'idPost'} });
        
        $res.=$self->render($tr, {'value'=>$temp});
        #$res.=$temp;
    }

    return $res;

}



1;
