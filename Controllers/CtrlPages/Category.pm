package Controllers::CtrlPages::Category;

use strict;
use warnings;


sub new()
{   
	my ($proto, $category) = @_;
	my $class = ref($proto) || $proto;
	my $this->{category} = $category;
	print "yess";
    print "create test ggg id=".$_[1]."\n"; 
	my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go()
{
	my ($this) = @_;
	my $dataContainer = Models::Utilities::DataContainer->instance();
	$dataContainer->setParams({'nextPage' => 'categories', 'content' => $this->{category}});
}
sub getAllCategories($$,)
{
	
}

sub getCategory()
{
	
}


1;
