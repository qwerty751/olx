package Models::Utilities::DataContainer;

use strict;

my $self;

sub instance ($;)
{
	my $class = ref($_[0])||$_[0];

	$self ||= bless(
		{'params' => {}
		}, $class);

	return $self;
}


1;