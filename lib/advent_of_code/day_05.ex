defmodule AdventOfCode.Day05 do
  def part1(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      String.split(line, " -> ")
      |> Enum.map(fn c ->
        String.split(c, ",")
        |> Enum.map(&String.to_integer/1)
        |> Kernel.then(fn [x, y] -> {x, y} end)
      end)
      |> Kernel.then(fn [x, y] -> {x, y} end)
    end)
    |> Enum.filter(&filter_coordinates(&1))
    |> Enum.reduce(%{}, fn vec, acc ->
      get_vector(vec)
      |> Enum.reduce(acc, fn coordinate, acc ->
        Map.update(acc, coordinate, 1, &(&1 + 1))
      end)
    end)
    |> Map.values()
    |> Enum.filter(&(&1 > 1))
    |> Enum.count()
  end

  def filter_coordinates({{x1, y1}, {x2, y2}}) do
    x1 == x2 || y1 == y2
  end

  def get_vector(vec) do
    {{x1, y1}, {x2, y2}} = vec

    if filter_coordinates(vec) do
      for x <- x1..x2,
          y <- y1..y2,
          do: {x, y}
    else
      Enum.zip(x1..x2, y1..y2)
    end
  end

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      String.split(line, " -> ")
      |> Enum.map(fn c ->
        String.split(c, ",")
        |> Enum.map(&String.to_integer/1)
        |> Kernel.then(fn [x, y] -> {x, y} end)
      end)
      |> Kernel.then(fn [x, y] -> {x, y} end)
    end)
    |> Enum.reduce(%{}, fn vec, acc ->
      get_vector(vec)
      |> Enum.reduce(acc, fn coordinate, acc ->
        Map.update(acc, coordinate, 1, &(&1 + 1))
      end)
    end)
    |> Map.values()
    |> Enum.filter(&(&1 > 1))
    |> Enum.count()
  end
end
