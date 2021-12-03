defmodule AdventOfCode.Day03 do
  def part1(args) do
    result =
      args
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(fn x ->
        x
        |> Stream.unfold(&String.split_at(&1, 1))
        |> Enum.take_while(&(&1 != ""))
        |> List.to_tuple()
      end)

    oxy = most_common_elems(result) |> Map.values() |> Enum.join() |> Integer.parse(2) |> elem(0)

    carbon =
      least_common_elems(result) |> Map.values() |> Enum.join() |> Integer.parse(2) |> elem(0)

    oxy * carbon
  end

  def most_common_elems([]), do: %{}

  def most_common_elems([first | _] = list) do
    max_i = tuple_size(first) - 1
    Map.new(0..max_i, &most_common_at(list, &1))
  end

  def most_common_at(list, i) do
    max_val =
      list
      |> Enum.frequencies_by(&elem(&1, i))
      |> Enum.max_by(&elem(&1, 1))
      |> elem(0)

    {i, max_val}
  end

  def least_common_elems([]), do: %{}

  def least_common_elems([first | _] = list) do
    max_i = tuple_size(first) - 1
    Map.new(0..max_i, &least_common_at(list, &1))
  end

  def least_common_at(list, i) do
    max_val =
      list
      |> Enum.frequencies_by(&elem(&1, i))
      |> Enum.min_by(&elem(&1, 1))
      |> elem(0)

    {i, max_val}
  end

  def part2(args) do
    result =
      args
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(fn x ->
        x
        |> Stream.unfold(&String.split_at(&1, 1))
        |> Enum.take_while(&(&1 != ""))
        |> List.to_tuple()
      end)

    [first | _] = result
    oxy = reduce_bits(result, first, true)
    carbon = reduce_bits(result, first, false)
    oxy * carbon
  end

  def reduce_bits(result, first, isMostCommon) do
    0..(tuple_size(first) - 1)
    |> Enum.reduce(result, fn i, acc ->
      if length(acc) === 1 do
        acc
      else
        freq = acc |> Enum.frequencies_by(&elem(&1, i))
        freq1 = if Map.has_key?(freq, "1"), do: freq["1"], else: 0
        freq0 = if Map.has_key?(freq, "0"), do: freq["0"], else: 0

        value =
          if isMostCommon,
            do: boolean_to_string(freq1 >= freq0),
            else: boolean_to_string(freq1 < freq0)

        acc |> Enum.filter(fn x -> elem(x, i) == value end)
      end
    end)
    |> hd
    |> Tuple.to_list()
    |> Enum.join()
    |> Integer.parse(2)
    |> elem(0)
  end

  def boolean_to_string(bool) do
    if bool, do: "1", else: "0"
  end
end
