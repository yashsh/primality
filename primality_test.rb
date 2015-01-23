require_relative "primality"

class PrimalityTest
  #this class tests the prime functionality of the Primality class
  #written by Yash 1/22/2015
  #Ruby v2.0

  #test first 10 primes
  def assert_ten_primes
    p = Primality.new

    t1 = Time.now
    primes = p.compute_primes(10)
    t2 = Time.now

    if primes == [2,3,5,7,11,13,17,19,23,29]
      puts "Test passed for first 10 primes; time taken is " + ((t2 - t1) * 1000).to_s + " milliseconds"
    else
      puts "Test failed for first 10 primes"
    end

    puts ""
  end

  def assert_is_prime
    #test 11th prime number 31 given 10 previous primes
    p = Primality.new
    primes = p.compute_primes(10)

    if p.is_prime?(31, primes)
      puts "Test passed for testing prime number 31"
    else
      puts "Test failed for testing prime number 31"
    end

    #test composite number 35
    #this test can also be written with a random number until the next prime which is 37
    if !p.is_prime?(35, primes)
      puts "Test passed for testing composite number 35"
    else
      puts "Test failed for testing composite number 35"
    end

    puts ""
  end

end

p = PrimalityTest.new
p.assert_ten_primes
p.assert_is_prime
