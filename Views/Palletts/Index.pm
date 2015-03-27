package Views::Palletts::Index;
#user7

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;
use Config::Config;
use Models::Performers::Userme;

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
    (($sql = Models::Interfaces::Sql->new(
        Config::Config::DBUSER,
        Config::Config::DBHOST,
        Config::Config::DBNAME,
        Config::Config::DBPASS)) 
        && ($sql->connect())
        && ($sql->setQuery("SELECT * FROM olx_categories"))
        && ($sql->execute())
        && ($result = $sql->getResult())
        
        && ($sql->DESTROY()))||
    (
        (print $sql->getError()) && 
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



sub loginuser
{
    #выводи имя пользователя если пользовотель в системе иначе слово вход
    my $user =  Models::Performers::Userme->new();
    
    my $name='Вход';
    if($user->isLogin())
    {
        $name=$user->getName();
    
    }

    return "<a href='Userme'>$name</a>";

}

sub AUTOLOAD
{
    return '';

}

1;
