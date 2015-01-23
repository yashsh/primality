class Primality
  #class to find first N prime numbers and output them
  #written by Yash 1/22/2015
  #Ruby v2.0

  #for smaller numbers, doing trial division with prime numbers up to sqrt of N is simple
  #for larger numbers, deterministic tests like the AKS algorithm of 2002 can be used -
  #http://www.cse.iitk.ac.in/users/manindra/algebra/primality_v6.pdf
  #to scale, I can implement this algorithm in Ruby and scale this program

  #compute the first n prime numbers
  def compute_primes(n, primes = nil)
    #start out with 2 and 3
    primes = [] if !primes
    primes << 2 << 3

    #prime numbers follow a pattern of 6k + 1 or 6k - 1 so test for these series
    k = 1
    while primes.count < n do
      num = (6 * k) - 1
      primes << num if is_prime?(num, primes)
      break if primes.count == n
      num = (6 * k) + 1
      primes << num if is_prime?(num, primes)
      k += 1
    end

    primes
  end

  #test for prime numbers by trial division by previous primes up to sqrt of num
  def is_prime?(num, primes)
    #first test for basic divisibility by 2,3,5,7
    if (num % 2 == 0 && num != 2) || (num % 3 == 0 && num != 3) ||
        (num % 5 == 0 && num != 5) || (num % 7 == 0 && num != 7)
      return false
    end

    #now run thru division by prime numbers up to sqrt of num
    sqrt = Math.sqrt(num)
    ret = true
    primes.each do |p|
      return false if num % p == 0 && num != p
      break if p > sqrt
    end

    ret
  end

  #output in a table format the products of the primes
  def output(primes)
    #primes = compute_primes(n)
    prod = {}

    #calculate highest number of spaces for padding
    spaces = (primes[-1] * primes[-1]).to_s.length + 4
    padding = ""
    (0..spaces).map {padding += " "}

    #print header row
    print padding + " "
    primes.each do |row|
      print_data(row, padding)
    end
    puts ""
    primes.each do |row|
      (0..spaces+2).map { print "="}
    end
    puts ""

    #print columns and rows of products
    primes.each do |row|
      print_data(row.to_s + "  | ", padding)

      primes.each do |col|

        #if we already have a product for this couple, use it otherwise multiply
        if prod[[col,row]]
          prod[[row,col]] = prod[[col,row]]
        else
          prod[[row,col]] = row * col
        end

        print_data(prod[[row,col]], padding)
      end

      puts ""
    end

    puts ""
  end

  #print data with padding
  def print_data(data, padding)
    p = ""
    (0..padding.length - data.to_s.length).map {p += " "}
    print data.to_s + p
  end
end

p = Primality.new
p.output(p.compute_primes(10))

