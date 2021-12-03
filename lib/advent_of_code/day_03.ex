defmodule AdventOfCode.Day03 do
  def part1(args) do
    #000111111001
    result = args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> x
        |> Stream.unfold(&String.split_at(&1, 1))
        |> Enum.take_while(&(&1 != ""))
        |> List.to_tuple()
     end)
    pos1 = result |> Enum.frequencies_by(&elem(&1, 0)) |> Enum.max_by(&elem(&1, 1))
    pos2 = result |> Enum.frequencies_by(&elem(&1, 1)) |> Enum.max_by(&elem(&1, 1))
    pos3 = result |> Enum.frequencies_by(&elem(&1, 2)) |> Enum.max_by(&elem(&1, 1))
    pos4 = result |> Enum.frequencies_by(&elem(&1, 3)) |> Enum.max_by(&elem(&1, 1))
    pos5 = result |> Enum.frequencies_by(&elem(&1, 4)) |> Enum.max_by(&elem(&1, 1))
    pos6 = result |> Enum.frequencies_by(&elem(&1, 5)) |> Enum.max_by(&elem(&1, 1))
    pos7 = result |> Enum.frequencies_by(&elem(&1, 6)) |> Enum.max_by(&elem(&1, 1))
    pos8 = result |> Enum.frequencies_by(&elem(&1, 7)) |> Enum.max_by(&elem(&1, 1))
    pos9 = result |> Enum.frequencies_by(&elem(&1, 8)) |> Enum.max_by(&elem(&1, 1))
    pos10 = result |> Enum.frequencies_by(&elem(&1, 9)) |> Enum.max_by(&elem(&1, 1))
    pos11 = result |> Enum.frequencies_by(&elem(&1, 10)) |> Enum.max_by(&elem(&1, 1))
    pos12 = result |> Enum.frequencies_by(&elem(&1, 11)) |> Enum.max_by(&elem(&1, 1))

    IO.inspect(pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11, pos12)
  end


  def part2(args) do
      result = args
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(fn x -> x
          |> Stream.unfold(&String.split_at(&1, 1))
          |> Enum.take_while(&(&1 != ""))
          |> List.to_tuple()
       end)
    pos0 = result |> Enum.frequencies_by(&elem(&1, 0)) #|> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 0) == "0"  end)
    pos1 = result |> Enum.frequencies_by(&elem(&1, 1)) #|> Enum.max_by(&elem(&1, 1))
    # #IO.inspect(pos1)
    # #O.inspect(result)
    result = result |> Enum.filter(fn x-> elem(x, 1) == "0" end)
    # #IO.inspect(result)
    pos2 = result |> Enum.frequencies_by(&elem(&1, 2)) #|> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 2) == "0"  end)
    pos3 = result |> Enum.frequencies_by(&elem(&1, 3)) #|> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 3) == "1"  end)
    pos4 = result |> Enum.frequencies_by(&elem(&1, 4)) #|> Enum.max_by(&elem(&1, 1)) #%{"0" => 36, "1" => 36}


    result = result |> Enum.filter(fn x-> elem(x, 4) == "0"  end)
    pos5 = result |> Enum.frequencies_by(&elem(&1, 5)) #> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 5) == "0"  end)
    pos6 = result |> Enum.frequencies_by(&elem(&1, 6)) # |> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 6) == "1"  end)
    pos7 = result |> Enum.frequencies_by(&elem(&1, 7)) #|> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 7) == "0"  end)
    pos8 = result |> Enum.frequencies_by(&elem(&1, 8)) #|> Enum.max_by(&elem(&1, 1))

    result = result |> Enum.filter(fn x-> elem(x, 8) == "0"  end)
    pos9 = result |> Enum.frequencies_by(&elem(&1, 9)) #|> Enum.max_by(&elem(&1, 1))


     result = result |> Enum.filter(fn x-> elem(x, 9) == "0" end)
     pos10 = result |> Enum.frequencies_by(&elem(&1, 10)) #|> Enum.max_by(&elem(&1, 1))

     result = result |> Enum.filter(fn x-> elem(x, 10) == "0"  end)
    pos11 = result |> Enum.frequencies_by(&elem(&1, 11))# |> Enum.max_by(&elem(&1, 1))
    IO.inspect(result)

    result = result |> Enum.filter(fn x-> elem(x, 11) == elem(pos11, 0)  end)
    IO.inspect(result)
     IO.inspect(pos0, pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, pos9, pos10, pos11)

    #max [{"1", "1", "0", "1", "1", "1", "1", "1", "0", "1", "0", "1"}]  110111110101
    #min #[{"0", "0", "0", "1", "0", "0", "1", "0", "0", "0", "0", "1"}] 000100100001
  end
end
