#user9

package Models::Categories;

use strict;
use warnings;
use Data:Dumper;
use Models::Intefaces::Sql;

my ($mySql);

sub new
{
	my $mySql = new Models::Intefaces::Sql();
    my $class = ref($_[0])||$_[0];
    return bless({},$class);
    
}

sub getAllCtegories
{
    my($self) = shift;
    my $query = "SELECT * FROM olx_categories";
    $mySql->select($query);
    $mySql->execute();
    my $res = $mySql->getResult();
    return $res;
}

sub getSubCategories
{
    my($self,$idCut) = @_;
    my $query = "SELECT * FROM olx_subCatregories WHERE idCat=" . $idCut;
    $mySql->select($query);
    $mySql->execute();
    my $res = $mySql->getResult();
    return $res;
}

1;