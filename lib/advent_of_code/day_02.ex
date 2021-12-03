defmodule AdventOfCode.Day02 do
  def part1(args) do
    result = args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, " ") |> List.to_tuple() end)
    |> Enum.reduce(%{"forward" => 0, "down" => 0, "up" => 0},
      fn (head, acc) ->
        command = elem(head, 0)
        value = String.to_integer(elem(head, 1))
        %{acc | command => value + acc[command]}
      end
    )

    result["forward"] * (result["down"] - result["up"])
  end

  def part2(args) do
    result = args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, " ") |> List.to_tuple() end)
    |> Enum.reduce(%{"forward" => 0, "down" => 0, "up" => 0, "aim" => 0},
      fn (head, acc) ->
        command = elem(head, 0)
        value = String.to_integer(elem(head, 1))
        aim = acc["aim"]
        depth = acc["down"]
        case command do
          "down"    -> Map.put(acc, "aim", aim + value)
          "up"      -> Map.put(acc, "aim", aim - value)
          "forward" -> %{acc | "down" => aim * value + depth , "forward" => value + acc[command]}
        end
      end)

    result["forward"] * result["down"]
  end
end
