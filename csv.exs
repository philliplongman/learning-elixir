defmodule Person do
  defstruct first: "", middle: "", last: "", birthday: "", pet: "None", color: ""

  def new({:comma, [last, first, pet, color, birthday]}) do
    %Person{
      first:    first,
      last:     last,
      pet:      pet,
      color:    color,
      birthday: birthday
    }
  end
  def new({:space, [first, last, middle, pet, birthday, color]}) do
    %Person{
      first:    first,
      middle:   middle,
      last:     last,
      pet:      pet,
      color:    color,
      birthday: birthday
    }
  end
  def new({:pipe, [last, first, middle, pet, color, birthday]}) do
    %Person{
      first:    first,
      middle:   middle,
      last:     last,
      pet:      pet,
      color:    color,
      birthday: birthday
    }
  end

end

defmodule CSV do
  def parse(file) do
    File.open!(file)
    |> IO.stream(:line)
    |> Stream.map(&split_by_delimiter/1)
    |> Enum.map(&Person.new/1)
  end

  def split_by_delimiter(line) do
    cond do
      String.contains? line, "," -> { :comma, String.split(line, ",") }
      String.contains? line, " " -> { :space, String.split(line, " ") }
      String.contains? line, "|" -> { :pipe,  String.split(line, "|") }
    end
  end
end
