defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, " ") |> List.to_tuple() end)
    |> reduce_to_commands(%{"forward" => 0, "down" => 0, "up" => 0})
  end

  @spec reduce_to_commands(nonempty_maybe_improper_list, map) :: any
  def reduce_to_commands([head | tail], commands) do
    command = elem(head, 0)
    value = String.to_integer(elem(head, 1))
    prevValue = commands[command]
    reduce_to_commands(tail, Map.put(commands, command, value + prevValue))
  end

  def reduce_to_commands([], commands) do
    commands
  end

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> String.split(x, " ") |> List.to_tuple() end)
    |> reduce_aim_commands(%{"forward" => 0, "down" => 0, "up" => 0, "aim" => 0})
  end

  def reduce_aim_commands([head | tail], commands) do
    command = elem(head, 0)
    value = String.to_integer(elem(head, 1))
    aim = commands["aim"]
    prevValue = commands[command]
    depth = commands["down"]
    case command do
      "down"    -> reduce_aim_commands(tail, Map.put(commands, "aim", value + aim))
      "up"      -> reduce_aim_commands(tail, Map.put(commands, "aim", aim - value))
      "forward" -> reduce_aim_commands(tail, %{commands | "down" => aim * value + depth , "forward" => value + prevValue})
    end
  end

  def reduce_aim_commands([], commands) do
    commands
  end
end
