defmodule Recursion do

  # Add all the integers from 0 to n
  def sum(0), do: 0
  def sum(n) when is_integer(n) and n > 0, do: n + sum(n - 1)
  def sum(n) when is_integer(n) and n < 0, do: n + sum(n + 1)


  # Find greatest common divisor between two integers
  def gcd(x, 0) when is_integer(x), do: abs(x)
  def gcd(x, y) when is_integer(x) and is_integer(y), do: gcd(y, rem(x, y))


  # Guess an integer between 1 and 1000
  defmodule Guess do
    def guess(actual, x..y) when actual == div(x + y, 2) do
      new_guess = div(x + y, 2)
      IO.puts "Is it #{new_guess}?"
      actual
    end
    def guess(actual, x..y) when actual < div(x + y, 2) do
      new_guess = div(x + y, 2)
      IO.puts "Is it #{new_guess}?"
      guess actual, x..new_guess
    end
    def guess(actual, x..y) when actual > div(x + y, 2) do
      new_guess = div(x + y, 2)
      IO.puts "Is it #{new_guess}?"
      guess actual, new_guess..y
    end
  end

end
