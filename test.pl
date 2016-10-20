use DBI;

my $conn = DBI->connect("DBI:mysql:test:localhost","root","");
my $sql = "select * from tt ";
my $stmt = $conn->prepare($sql);
my $result = $stmt->execute();
if($result == 0)
{
	print "execute error sql:" . $sql;
}
else
{
=pod
	while(my @row = $stmt->fetchrow_array())
	{
		print join("\t",@row)."\n";
	}

=cut
	my $table = $stmt->fetchall_arrayref();
	foreach $row (@$table)
	{
		foreach $col (@$row)
		{
			print $col . "\t";
		}
		print "\n";
	}
#	for($i = 0; $i <= $#{$table}; $i++)
#	{
#		for($j = 0; $j <= $#{$table->[i]};$j++)
#		{
#			print $table->[$i][$j] . "\t";
#		}
#		print "\n"
#	}
#$stmt->dump_results();


	
	$stmt->finish();
}

$conn->disconnect();