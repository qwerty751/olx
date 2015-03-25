use DBI;
my dbh;
my self;

sub instance
{
	my $dbh = DBI -> connect($host, $user, $pass);
}