package Models::Performers::Category;

use warnings;
use strict;

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;
use Config::Config;

my $debug = Models::Utilits::Debug->new();



sub new
{   

    my $sql =  Models::Interfaces::Sql->new(
        Config::Config::DBUSER,
        Config::Config::DBHOST,
        Config::Config::DBNAME,
        Config::Config::DBPASS);
    $sql->connect();
    my $class = ref($_[0])||$_[0];
    return bless(
        {'sql'=>$sql}
        ,$class);
}




#id 
sub getCatName($)
{
    my($self,$id)=@_;
    #print $id;
    #$id=2;
    
    unless($id)
    {
        return 0;
    }

    my $result;
     ($self->{'sql'}->setQuery("SELECT  cat_name FROM olx_categories where idCat = $id "))
        && ($self->{'sql'}->execute())
        && ($result=$self->{'sql'}->getResult())||
    
        (
            ($debug->setMsg( $self->{'sql'}->getError()))
        );
    


    if($result)
    {
        return $$result[0]->{'cat_name'};
    }
        
    return $result; 
    
}





sub getLisrSubCat($)
{
    my($self,$id)=@_;
    #print $id;
    # $id=2;
    
    unless($id)
    {
        return 0;
    }

    my $result;
     ($self->{'sql'}->setQuery("SELECT idSub, sub_name FROM olx_subCategories where idCat = $id "))
        && ($self->{'sql'}->execute())
        && ($result=$self->{'sql'}->getResult())||
    
        (
            ($debug->setMsg( $self->{'sql'}->getError()))
        );
    


    if($result)
    {
        return $result;
    }
        
    return $result; 
    
}



sub DESTROY 
{
    my($self) = @_;
    
        $self->{'sql'}->DESTROY();
    

}





1;
