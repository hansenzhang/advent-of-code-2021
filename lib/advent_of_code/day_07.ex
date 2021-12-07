defmodule AdventOfCode.Day07 do
  def part1(args) do
    a =
      args
      |> parse_input

    Enum.min(a)..Enum.max(a)
    |> Enum.map(fn
      x ->
        Enum.map(a, fn
          y -> abs(x - y)
        end)
    end)
    |> Enum.map(&Enum.sum/1)
    |> Enum.min()
  end

  def part2(args) do
    a =
      args
      |> parse_input

    Enum.min(a)..Enum.max(a)
    |> Enum.map(fn
      x ->
        Enum.map(a, fn
          y -> abs(x - y) * (abs(x - y) + 1) / 2
        end)
    end)
    |> Enum.map(&Enum.sum/1)
    |> Enum.min()
  end

  defp parse_input(args) do
    args
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
