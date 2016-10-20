#! /usr/bin/perl -w
use threads;
use Thread::Queue;
my $q = Thread::Queue->new();

sub produce{
	my $name = shift;
	my $rate = 5;
	my $factRate = 0;
	my $beginTime = time();
	my $detaTime = 0;
	while(1){
		$detaTime = time() - $beginTime;
		if($factRate >= $rate && $detaTime < 1)
		{			
			sleep(0.2);
			next;
		}
		if($detaTime >= 1)
		{
			$factRate = 0;
			$beginTime = time();
			print "the time is $beginTime \n";
		}
		$factRate++;
		my $r = int(rand(100));
		my $str = "hello".$r;
		$q->enqueue($str);
		#printf("$name produce $r\n");
		#sleep(int(rand(3)));
		sleep(0.1);
	}
}
sub consume{
	my $name = shift;
	while(my $r = $q->dequeue()){
		printf("consume $name:$r\n");
		sleep(1);
	}
}

my $producer1 = threads->create(\&produce,"producer1");
#my $producer2 = threads->create(\&produce,"p1");
my $consumer1 = threads->create(\&consume,"p1");
$producer1->join();
#$producer2->join();
$consumer1->join();