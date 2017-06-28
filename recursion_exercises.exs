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
    def guess(actual, x..y), do: _guess(actual, div(x + y, 2), x..y)

    defp _guess(actual, actual, _) do
      IO.puts "Is it #{actual}?\n#{actual}"
    end
    defp _guess(actual, g, x..y) when g < actual do
      IO.puts "Is it #{g}?"
      _guess actual, div(g + y, 2), g..y
    end
    defp _guess(actual, g, x..y) when g > actual do
      IO.puts "Is it #{g}?"
      _guess actual, div(x + g, 2), x..g
    end
  end
end
