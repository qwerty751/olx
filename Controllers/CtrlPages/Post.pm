#user7
package Controllers::CtrlPages::Post;

use strict;
use warnings;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Performers::Category;

my $param;
sub new()
{   
	$param = $_[1];
    my $class = ref($_[0])||$_[0];
    return bless({},$class);

	}

sub go
{
    my ($self)=@_;
    
    return 1;
}


1;
