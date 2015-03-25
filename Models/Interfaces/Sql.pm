package Models::Interfaces::Sql;
#user7

use warnings;
use strict;
use DBI; 
#use Data::Dumper;





my($database, $host,$user, $pass,$dbh,$sth );

#setQuery



#конструктор
sub new
{

    $database=$_[1]; 
    $host=$_[2];
    $user=$_[3];
    $pass=$_[4];

    my $class = ref($_[0])||$_[0];
    return bless({      },$class);

}



sub getError
{   
    return 'error connrct to DB' unless($dbh);
    return 'error qerty string' unless($sth);
    return $dbh->errstr() || $sth->errstr() || undef ;   
    #return 0 || 1; 
}

sub connect
{

    my $data_source= "DBI:mysql:database=$database;host=$host";

    $dbh = DBI->connect($data_source, $user, $pass, 
        {PrintError=>0, RaiseError=>0} #отключаем принт ошибок
    );
    
    
    return 1 if($dbh);
    return 0;

}



sub select
{
    return 0 unless($dbh);
    my($self,$str) = @_;
    return $sth = $dbh->prepare($str);
    #    or die $dbh->errstr;
    #return 1;
    

}


sub setQuery
{   
    return 0 unless($dbh);
    my($self,$str) = @_;
    return 0  unless($str);
    return $sth = $dbh->prepare($str);

}

sub execute
{   
    return 0 unless($sth);
    return $sth->execute();
}

sub getRows
{
    return 0 unless($sth);
    return $sth->rows;
}

sub getResult
{
    return 0 unless($sth);
    #выходные данные
    my @arr; 

    while (my $row = $sth->fetchrow_hashref()) 
    {    
        push @arr , $row;
       
    }     

    $sth->finish();
    
    return \@arr;

}



sub DESTROY 
{
    my($self) = @_;
    if($dbh ){
        $dbh->disconnect();
    }

}

1;
