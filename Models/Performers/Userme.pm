package Models::Performers::Userme;

use warnings;
use strict;

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;
use Config::Config;
use Models::Utilits::Sessionme;
my $session =  Models::Utilits::Sessionme->new();

my $debug = Models::Utilits::Debug->new();


my $self;

sub new
{   

    my $sql =  Models::Interfaces::Sql->new(
        Config::Config::DBUSER,
        Config::Config::DBHOST,
        Config::Config::DBNAME,
        Config::Config::DBPASS);
    $self || $sql->connect();
    my $class = ref($_[0])||$_[0];

    $self||=bless(
        {   
            'sql'=>$sql,
            'name'=>undef,
            'emain'=>undef,
            'id'=>undef 
        }   
        ,$class);

    return $self;

}


#getName();
#getId();
#login($$);
#isLogin();


sub login($$)
{
    my ($self, $email, $pass)=@_;
    
    unless($email || $pass)
    {
        return 0;
    }


    my $result;
    (
        ($self->{'sql'}->setQuery("SELECT  idUser, first_name, last_name,   email,  phone 
                FROM olx_users
                where pass = '$pass' 
                AND email = '$email' 
                LIMIT  1 ")) &&
        ($self->{'sql'}->execute())
        && ($result=$self->{'sql'}->getResult())
    )||

    (
        ($debug->setMsg( $self->{'sql'}->getError()))
    );

    #print Dumper $result;
    if( $$result[0]->{'email'})
    {
        ####    
        $self->{'email'}= $$result[0]->{'email'};
        $self->{'name'}= $$result[0]->{'first_name'};
        $self->{'id'}= $$result[0]->{'idUser'};
        ###сохраняем в сессию
        $session->setParam('email',$self->{'email'});
        $session->setParam('name',$self->{'name'});
        $session->setParam('id',$self->{'id'});

        return 1;
    }
        #return $result;
        return 0;
}


sub isLogin()
{

    my ($self)=@_;
     
    print 'mail='.$session->getParam('email').' id='.$session->getId();


    if($self->{'name'})
    {
        return 1;

    }
    ###сморит сессию
    
    #  print 'get='.$session->getParam('email');

    if($session->getParam('email'))
    {
        $self->{'email'}=$session->gettParam('email');
        $self->{'id'}=$session->gettParam('id');
        $self->{'name'}=$session->gettParam('name');
        return 1;

    }

    return 0;

}

sub getName
{
    my ($self)=@_;

    return $self->{'name'};
}

sub getid
{
    my ($self)=@_;

    return $self->{'id'};
}

sub getemail
{
    my ($self)=@_;

    return $self->{'email'};
}


1;
