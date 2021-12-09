defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  test "part1" do
    input = AdventOfCode.Input.get!(8, 2021)
    result = part1(input)

    assert result == 495
  end

  test "part2" do
    input = AdventOfCode.Input.get!(8, 2021)
    result = part2(input)

    assert result == 1055164
  end
end
