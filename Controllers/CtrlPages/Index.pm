package Controllers::CtrlPages::Index;


my $Data={};


sub new
{
    print "create Index ggg";
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}

sub go
{
    print '<br>me test Index good <br>';

}



1;
