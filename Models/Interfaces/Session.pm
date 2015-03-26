package Models::Interfaces::Session;


use warnings;
use strict;
use DBI; 


use CGI qw(:standard);
# Подключаем модуль с опцией привязки сессии к IP-адресу
use CGI::Session ( "-ip_match" );
use CGI::Session::Driver::mysql;


# Создаём дескриптор подключения к MySQL

my $mySql = new Models::Intefaces::Sql();
my $cgi = new CGI;

# Если через форму передано значение login (то есть пользователь пытается авторизоваться)
if ($cgi->param("login"))
{

# Проверяем логин и пароль. Здесь check_user - это условная процедура, возвращающая
# идентификатор пользователя при успешной аутентификации

my $check_result=&check_user;
if ($check_result =~ /^\d+$/) { # Условие успешной аутентификации

# Инициализация объекта

$session = CGI::Session->new("driver:mysql", undef, { Handle => $dbh } );

# Сохраняем данные сессии. В нашем случае - логин и ID пользователя

$session->param(username => $cgi->param("login"), userid => $check_result);

# Добавляем заголовок с cookies

print $session->header(-location=>"/");

# Устанавливаем "протухание" неактивной сессии через два часа

$session->expire("+2h");

# Сбрасываем данные на драйвер. В нашем случае - в MySQL.

$session->flush();

}

else {

# Доступ запрещён

print $cgi->header(-type=>"text/html",-location=>"login.pl");

}

}

else {

# Загружаем параметры сессии из базы данных

$session = CGI::Session->load("driver:mysql", undef, { Handle => $dbh } ) or die CGI::Session->errstr;

if ($session) { # Если сессия существуем

$input{"session_login"} = $session->param("username");

$input{"session_userid"} = $session->param("userid");

}

else {

$input{"session_login"} = "Anonymous";

$input{"session_userid"} = 0;

}

}

# Если через форму передано значение logout (то есть пользователь пытается выйти)

if ($cgi->param("logout")) {

# Удаляем сессию

$session->delete();

print $session->header(-location=>"info");

# Удаляем сессию из базы данных
$session->flush();

}

1;