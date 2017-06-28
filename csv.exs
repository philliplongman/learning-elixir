defmodule Person do
  defstruct first: "", middle: "", last: "", birthday: "", pet: "", color: ""

  def new({:comma, values}), do: comma_person values
  def new({:pipe, values}),  do: pipe_person values
  def new({:space, values}), do: space_person values

  defp comma_person([last, first, pet, color, birthday]) do
    %Person{
      first:    first,
      last:     last,
      pet:      pet,
      color:    color,
      birthday: parse_birthday(birthday)
    }
  end

  defp pipe_person([last, first, middle, pet, color, birthday]) do
    %Person{
      first:    first,
      middle:   middle,
      last:     last,
      pet:      pet,
      color:    color,
      birthday: parse_birthday(birthday)
    }
  end

  defp space_person([first, last, middle, pet, birthday, color]) do
    %Person{
      first:    first,
      middle:   middle,
      last:     last,
      pet:      unabbreviate(pet),
      color:    color,
      birthday: parse_birthday(birthday)
    }
  end

  defp unabbreviate(letter) do
    case letter do
      "B" -> "Both"
      "C" -> "Cat"
      "D" -> "Dog"
      "N" -> "None"
    end
  end

  defp parse_birthday(birthday) do
    [m, d, y] = String.split(birthday, ~r{-|/})
                |> Enum.map(&String.to_integer/1)

    {_, date} = Date.new(y, m, d)
    date
  end

end

defmodule CSV do
  def parse(file) do
    read_people_from_file(file) |> Enum.to_list
  end

  defp read_people_from_file(file) do
    File.open!(file)
    |> IO.stream(:line)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&split_by_delimiter/1)
    |> Stream.map(&Person.new/1)
  end

  defp split_by_delimiter(line) do
    cond do
      String.contains? line, "," -> { :comma, String.split(line, ",") }
      String.contains? line, " " -> { :space, String.split(line, " ") }
      String.contains? line, "|" -> { :pipe,  String.split(line, "|") }
    end
  end
end
