defmodule AdventOfCode.Day06 do
  def part1(args) do
    fishies =
      args
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    1..80
    |>
    Enum.reduce(fishies, &iterate/2)
    |> Enum.count()
  end

  def part2(args) do
    # "3,4,3,1,2"
    fishies =
      args
      |> String.trim()
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> Enum.frequencies()

    empty = %{0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0}

    fishies = Map.merge(empty, fishies)

    1..256
    |> Enum.reduce(fishies, &iterate_better/2)
    |> Map.values()
    |> Enum.sum()
  end

  defp iterate(_day, fishies) do
    new_fishies =
      fishies
      |> Enum.filter(&(&1 === 0))
      |> Enum.map(fn _n -> 8 end)

    fishies =
      fishies
      |> Enum.map(fn fish ->
        if fish === 0 do
          6
        else
          fish - 1
        end
      end)

    new_fishies ++ fishies
  end

  defp iterate_better(_day, fishies) do
    %{
      fishies
      | 0 => fishies[1],
        1 => fishies[2],
        2 => fishies[3],
        3 => fishies[4],
        4 => fishies[5],
        5 => fishies[6],
        6 => fishies[7] + fishies[0],
        7 => fishies[8],
        8 => fishies[0]
    }
  end
end
