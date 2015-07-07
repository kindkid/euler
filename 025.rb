FIB = [0,1,1]
def fib(n)
  FIB[n] ||= fib(n-1) + fib(n-2)
end
i = 1
threshold = 10 ** 999
loop do
  f = fib(i)
  if f >= threshold
    puts i
    exit(0)
  end
  i += 1
end
