package Controllers::CtrlPages::Test1;


sub new
{   
    print "yess"; 
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go
{
    print '<br>me testi111<br>';

}




1;
