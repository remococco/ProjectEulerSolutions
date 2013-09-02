#!/usr/bin/env perl

our $ab = 0;
use threads;

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

    #print("a is $a, b is $b, n is $n\n");
    return &is_prime_number($n**2 + $a * $n + $b);
}



sub compute_answer {
    $a_lower_bound = shift;
    $a_upper_bound = shift;
    $b_lower_bound = shift;
    $b_upper_bound = shift;

    my $prime_count = 0;
    foreach my $a ( $a_lower_bound .. $a_upper_bound ) {
	foreach my $b ( $b_lower_bound .. $b_upper_bound ) {
	    my $n_prime = 0;
	    my $n = 0;
	    ++$n while (is_prime_quadratic_equation($a, $b, $n));
	    if ($n > $prime_count) {
		$prime_count = $n;
		$answer = $a * $b;
		$formula = "n^2+${a}n+$b";
	    }
	}
    }

    return ($answer, $prime_count, $formula);
}

my ($thread1) = threads->create('compute_answer', -999, 999, -999, -501);
my ($thread2) = threads->create('compute_answer', -999, 999, -500, -1);
my ($thread3) = threads->create('compute_answer', -999, 999, 0, 500);
my ($thread4) = threads->create('compute_answer', -999, 999, 501, 999);

my ($answer1, $prime_count1, $forumla1) = $thread1->join();
my ($answer2, $prime_count2, $formula2) = $thread2->join();
my ($answer3, $prime_count3, $formula3) = $thread3->join();
my ($answer4, $prime_count4, $formula4) = $thread4->join();

if ($prime_count1 > $prime_count2) {
    ($answer, $formula, $prime_count) = ($answer1, $formula1, $prime_count1);
} else {
    ($answer, $formula, $prime_count) = ($answer2, $formula2, $prime_count2);
}

if ($prime_count3 > $prime_count) {
    ($answer, $formula, $prime_count) = ($answer3, $formula3, $prime_count3);
}

if ($prime_count4 > $prime_count) {
    ($answer, $formula, $prime_count) = ($answer4, $formula4, $prime_count4);
}

print "$formula has the most primes with $prime_count. The answer is $answer.\n";
