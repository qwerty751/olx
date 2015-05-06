package Views::Palletts::Index;
#user7

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;
use Config::Config;
use Models::Performers::Userme;
use Models::Utilits::File;

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
    $self->{'title'}='<a href="index">Главня</a>';
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
    #print '!@@@';
    #выводи имя пользователя если пользовотель в системе иначе слово вход
    my($self)=@_;
    
    my $user =  Models::Performers::Userme->new();
     
    my $name='Вход';
    my $exit ='';
    my $iu = $self->loadtemplate('help/infouser');
    if($user->isLogin())
    {
        $name=$user->getName();
        $exit = $self->loadtemplate('help/exitform');; 
    }
    my $ret = $self->render($iu, {'name'=>$name, 'exit'=>$exit }); 
    return $ret;
}

sub loadtemplate
{
    my($self,$filename)=@_;
    my $tdir =  Config::Config->getDir();
    my $file = Models::Utilits::File->new();
    my $fullpath = $tdir.'/Resources/html/'.$filename.'.html';
    my $html = $file->getFile($fullpath);
    return $html; 
}


sub render
{
    my($self,$text,$hash)=@_;

    unless( $hash)
    {
        return $text; #no hash ;
    } 
    
    $text=~s/%%(\w+)%%/$hash->{$1}/ge;
    return $text;
}

sub AUTOLOAD
{
    return '';

}

1;
