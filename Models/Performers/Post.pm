package Models::Performers::Post;

use strict;

use Models::Utilits::Debug;
use Data::Dumper;
use Models::Utilits::Date;
use Models::Interfaces::Sql;
use Config::Config;

sub addPost ()
{
     my $db;
    my ($idUser) = $_[1];
    my ($idSub) = $_[2];
    my ($title) = $_[3];
    my ($description) = $_[4];
    my ($price) = $_[5];
       ($db = Models::Interfaces::Sql->new('user7', 'localhost', 'user7', 'tuser7'))
    && ($db -> connect())
    && ($db -> setQuery("INSERT INTO olx_posts (idUser, idSub, title, description, price) VALUES ($idUser, $idSub, '$title', '$description', '$price')"))
    && ($db -> execute());
    return 1;
}

sub getPostById
{
     my $db;
     my $result;
    my ($id) = $_[1];
    ($db = Models::Interfaces::Sql->new('user7', 'localhost', 'user7', 'tuser7'))
    && ($db -> connect())
    && ($db -> setQuery("SELECT p.title, p.description, p.idUser, u.first_name FROM olx_posts p INNER JOIN olx_users u ON p.idUser = u.idUser WHERE p.idPost = $id"))
    && ($db -> execute())
    && ($result = $db -> getResult());
    return $result;
}

sub post2Archive
{
     my $db;
     my $result;
    my ($id) = $_[1];
    ($db = Models::Interfaces::Sql->new('user7', 'localhost', 'user7', 'tuser7'))
    && ($db -> connect())
    && ($db -> setQuery("UPDATE olx_posts SET status = 0 WHERE idPost = $id"))
    && ($db -> execute())
    && ($result = $db -> getResult());
    return $result;
}

sub getListPosts2User
{   
    my $db;
    my $result;
    my ($id) = $_[1];
    ( $db = Models::Interfaces::Sql->new('user7', 'localhost', 'user7', 'tuser7'))
    && ($db -> connect())
    && ($db -> setQuery("SELECT idPost, title, description, status FROM olx_posts WHERE idUser = $id and status = 1"))
    && ($db -> execute())
    && ($result = $db -> getResult());
    return $result;
}


1;
