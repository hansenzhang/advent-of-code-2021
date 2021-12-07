defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  test "part1" do
    input = AdventOfCode.Input.get!(7, 2021)
    result = part1(input)

    assert result == 335271
  end

  test "part2" do
    input = AdventOfCode.Input.get!(7, 2021)
    result = part2(input)

    assert result == 95851339.0
  end
end
