#user9
package Controllers::CtrlPages::Category;

use strict;
use warnings;
use Data::Dumper;
use Models::Categories;

my($cat);

sub new()
{   
	my $cat = new Models::Categories;
    my $class = ref($_[0])||$_[0];
    return bless({},$class);

	#my ($proto, $category) = @_;
	#my $class = ref($proto) || $proto;
	#my $this->{category} = $category;
	#print "yess";
    #print "create test ggg id=".$_[1]."\n"; 
	#my $class = ref($_[0])||$_[0];
    #return bless({      },$class);
}

sub getAllCategories
{
    my($self) = shift;
    my $result = $cat->getAllCategories();
    return $result;
}

sub getSubCategories
{
    my($self) = shift;
    my $result = $cat->getSubCategories();
    return $result;
}


1;
