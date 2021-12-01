defmodule Mth do

  def sum_list([]) do
    0
  end

  def sum_list([h|t]) do
    h + sum_list(t)
  end

end

defmodule AdventOfCode.Day01 do
  def part1(args) do
    list = String.split(args) |> Enum.map(&String.to_integer/1)
    [head | tail] = list
    isGreater(head, tail)
  end

  def isGreater(prev, [head | tail]) do
    if head > prev do
      1 + isGreater(head, tail)
    else
      isGreater(head, tail)
    end
  end

  def isGreater(_, []) do
    0
  end


  def part2(args) do
    list = String.split(args)
        |> Enum.map(&String.to_integer/1)
        |> Enum.chunk_every(3, 1, :discard)
        |> Enum.map(fn x -> Enum.sum(x) end)
    [head | tail] = list
    isGreater(head, tail)

    #isGreaterChunk(head, tail)
  end

  def isGreaterChunk(prev, [head | tail]) do
    if  Mth.sum_list(head) >  Mth.sum_list(prev) do
      1 + isGreaterChunk(head, tail)
    else
      isGreaterChunk(head, tail)
    end
  end

  def isGreaterChunk(_, []) do
    0
  end
end
