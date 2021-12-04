defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  test "part1" do
    input =  AdventOfCode.Input.get!(4, 2021)
    result = part1(input)

    assert result == 8442
  end

  test "part2" do
    input =  AdventOfCode.Input.get!(4, 2021)
    result = part2(input)

    assert result == 4590
  end
end
