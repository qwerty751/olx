package Models::Utilits::File;
use Data::Dumper;

#$|=1;
#use vars qw(%IN);

#my($workdir)= shift;
#my $tdir=''; 
#user7 Ткачук


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless({      },$class);
}



sub isfile
{
     
    #my $r=`pwd`;
    
    #print $workdir;
    #print Dumper(Cwd()); 
    
    
    

    my($self,$file) = @_;
    if (-e $file) 
    {   
        #print  $tdir.$file;
        return 1;
    } 
    #print  "<br>no file:".$tdir.$file;
    return 0; 


}




1;
