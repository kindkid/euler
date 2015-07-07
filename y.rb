Y = ->(f) {
  ->(x) { f.(->(v) { x.(x).(v) }) }.(
  ->(x) { f.(->(v) { x.(x).(v) }) } )
}

def fact(n)
  Y.(
    ->(p) {
      ->(n) { n == 0 ? 1 : n * p.(n-1) }
    }
  ).(n)
end

def fib(n)
  Y.(
    ->(p) {
      ->(n) { n < 2 ? 1 : p.(n-1) + p.(n-2) }
    }
  ).(n)
end

puts "10! = #{fact(10)}"
puts "fib(10) = #{fib(10)}"
