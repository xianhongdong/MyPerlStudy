use Getopt::Long;
use Data::Dumper;
use File::Basename;
use Sys::Hostname;
use strict;

my $userName;
my $password;
my $dbName;
my $ip;
my $port;

sub PrintUsage
{
print <<EOF;
Usage:$0 [OPTIONS]
-userName:$userName
-password:$password
-dbName:$dbName
-ip:$ip
-port:$port
EOF
	exit 1;
}
GetOptions("userName=s" => \$userName,
						"password=s" =>\$password,
						"dbName=s"=>\$dbName,
						"ip=s"=>\$ip,
						"port=s"=>\$port) or PrintUsage();
unless( $userName and $password and $dbName and $ip and $port)
{
	PrintUsage();
}
else
{
	print "flakflakjl\n";
	PrintUsage();
}