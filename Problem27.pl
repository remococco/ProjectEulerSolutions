#!/usr/bin/env perl

#use strict;
#use warnings;

my %cache = {};

sub is_prime_number {
    # mehhh primes. how to get teh primez 
    # typical project euler. classic. 
    my $number = shift;

    return $cache{$number} if (exists $cache{$number});

    my $return_val = ("1" x $number) !~ /^1?$|^(11+?)\1+$/;
    $cache{$number} = $return_val;
    $return_val;
}

sub is_prime_quadratic_equation {
    my $a = shift;
    my $b = shift;
    my $n = shift;

    return &is_prime_number($n**2 + $a * $n + $b);
}

my $prime_count = 0;

foreach my $a ( -1000 .. 1000 ) {
    foreach my $b ( -1000 .. 1000 ) {
	my $n_prime = 0;
	#printf("a is $a, b is $b\n");
	my $n = 0;
 	++$n while (is_prime_quadratic_equation($a, $b, $n));
	if ($n > $prime_count) {
	    $prime_count = $n;
	    $answer = $a * $b;
	    $formula = "n^2+${a}n+$b";
	}
    }
}

print "$formula has the most primes with $prime_count. The answer is $answer.\n";

while(@ARGV) {
    my $arg = shift;
    printf("$arg %s prime\n", is_prime_number($arg)? "is" : "isn't");
}
