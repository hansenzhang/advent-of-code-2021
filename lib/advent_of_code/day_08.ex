defmodule AdventOfCode.Day08 do
  def part1(args) do
    args
    |> parse_input()
    |> Enum.flat_map(&elem(&1, 1))
    |> Enum.filter(&Enum.member?([2, 3, 4, 7], String.length(&1)))
    |> Enum.count()
  end

  def part2(args) do
    args
    |> parse_input()
    |> Enum.map(fn line ->
      line
      |> parse_line()
      |> Enum.join()
      |> String.to_integer()
    end)
    |> Enum.sum()
  end

  defp parse_input(args) do
    args
    |> String.trim()
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split(" | ")
      |>Enum.map(&String.split(&1, " ", trim: true))
    end)
    |> Enum.map(&List.to_tuple/1)

  end

  defp parse_line(line) do
    {patterns, digits} = line

    masks = create_masks(patterns)

    digits
    |> Enum.map(&get_digit(&1, masks))
  end

  defp create_masks(patterns) do
    masks = %{
      1 => Enum.filter(patterns, fn x -> String.length(x) == 2 end) |> hd |> String.split("", trim: true) |> MapSet.new(),
      4 => Enum.filter(patterns, fn x -> String.length(x) == 4 end) |> hd |> String.split("", trim: true) |> MapSet.new(),
      7 => Enum.filter(patterns, fn x -> String.length(x) == 3 end) |> hd |> String.split("", trim: true) |> MapSet.new()
    }
    masks
    |> Map.put(:masksix, MapSet.difference(masks[4], masks[7]))
    |> Map.put(:maskfive, MapSet.difference(masks[4], masks[1]))
  end

  defp filter_length_six(signal_map, masks) do
    cond do
      MapSet.subset?(masks[4], signal_map) -> "9"
      MapSet.subset?(masks[:masksix], signal_map) -> "6"
      true -> "0"
    end
  end

  defp filter_length_five(signal_map, masks) do
    cond do
      MapSet.subset?(masks[:maskfive], signal_map) -> "5"
      MapSet.subset?(masks[7], signal_map) -> "3"
      true -> "2"
    end
  end

  defp get_digit(signal, masks) do
    signal_map =
      signal
      |> String.split("", trim: true)
      |> MapSet.new()
    case String.length(signal) do
      2 -> "1"
      3 -> "7"
      4 -> "4"
      5 -> filter_length_five(signal_map, masks)
      6 -> filter_length_six(signal_map, masks)
      7 -> "8"
    end
  end
end
