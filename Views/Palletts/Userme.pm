package Views::Palletts::Userme;
#user7
use warnings;
use strict;

use Models::Utilits::Date;
use Data::Dumper;
use Models::Performers::Post;
#три строчки которые делают наследие 
use vars qw(@ISA); 
our @ISA = qw(Views::Palletts::Index);
require Views::Palletts::Index;


sub listpost
{
    
    my $post= Models::Performers::Post->getListPosts2User(1);
    #print Dumper  $post;
    
    my $res='';
    
    for(@$post)
    {
        $res.='<p><b> '.$_->{'title'}.'</b><span>'.$_->{'description'}.'
        <span> <a href="post2arhiv/'.$_->{'idPost'}.'" >В архив</a></p>';
    }

    return $res;

}



1;
