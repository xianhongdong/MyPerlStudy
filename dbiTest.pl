use DBI;

my $conn = DBI->connect("DBI:mysql:test:localhost","root","");
my $sql = "select * from tt ";
my $stmt = $conn->prepare($sql);
my $result = $stmt->execute();

#if($result)
#die "empty result" if !$result;

my $table = $stmt->fetchall_arrayref();


for(my $i = 0; $i <= $#{$table}; $i++)
{
	#print "{@$table[$i]}[0] @$table[$i][1] @$table[$i][2]\n";
	print "$table->[$i][0] $table->[$i][1] $table->[$i][2]\n";
}
