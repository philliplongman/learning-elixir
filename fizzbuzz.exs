fizzbuzz = fn n ->
  output = fn
    (0, 0, _) -> "FizzBuzz"
    (0, _, _) -> "Fizz"
    (_, 0, _) -> "Buzz"
    (_, _, n) -> n
  end
  IO.puts output.(rem(n,3), rem(n,5), n)
end

Enum.map(0..15, fizzbuzz)
