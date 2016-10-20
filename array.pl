#my @table = ();
@table;

my @row1 = qw(1,abc,hello);
#my @row2 = qw(2,efg,world);

$table[0]=[@row1];
@row1 = qw(2,efg,world);
$table[1]=[@row1];

print "$table[0][0] $table[0][1] $table[0][1]\n";
print "$table[1][0] $table[1][1] $table[1][2]\n";
