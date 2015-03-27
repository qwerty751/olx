#user9
package Controllers::CtrlPages::Category;

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
    
    
    my $cat =  Models::Performers::Category->new();
    unless($cat->getCatName($param))
    {
            my $date = Models::Utilits::Date->new();
            $date->{'nextpage'}='Error';
            return 0;
    }
        

}


1;
