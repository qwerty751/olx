package Views::Palletts::Index;
#user7

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({  },$class);
}


#запускаеться когад нужно мунять на хеши
sub createHash
{
    my $date = Models::Utilits::Date->new();

    my ($self)=@_;
    $self->{'page'}=$date->{'nextpage'};
    $self->{'title'}='Главня';
}


#пример функции которая в запуститься если в шаюлоне встретит ##viewdubug##
sub viewdebug
{
    
    my($self)=@_;   
    my $debug = Models::Utilits::Debug->new();
    my $d=$debug->getMsg();
    return  Dumper(\$d);
     
    
}


#возвращяет список всех категорий
sub listCats
{
    my $sql;
    my $result;
    (($sql = Models::Interfaces::Sql->new('user7','localhost','user7','tuser7')) 
        && ($sql->connect())
        && ($sql->setQuery("SELECT * FROM olx_categories"))
        && ($sql->execute())
        && ($result = $sql->getResult())
        
        && ($sql->DESTROY()))||
    (
        #($err=$sql->getError()) && 
        ($sql->DESTROY())    
    );
    

    
     
    #print Dumper($result);
    $res='';
    for(@$result)    
    {
         $res.='<p><a href="category/'.$_->{'idCat'}.'" >'.
         $_->{'cat_name'}.'</a></p>';
    }

    return $res; 


}
(($sql =  Modules::sql->new('user7','localhost','user7','tuser7')) 
        && ($sql->connect())
        && ($sql->setQuery("SELECT * FROM anketa"))
        && ($sql->execute())
        && ($result = $sql->getResult())
        
        && ($sql->DESTROY()))||
    (
        (print $sql->getError()) && 
        ($sql->DESTROY())    
    );


sub AUTOLOAD
{
    return '';

}

1;
