my $txt1 = qq<mysql -uroot -e 
"select 1+1">;
system($txt1);

my @array = qw(/home/radius/free akfal 1323 );
#print "@array[1]";

my $txtDir = `dir`;
print "$txtDir";
