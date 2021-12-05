defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  test "part1" do
    input = AdventOfCode.Input.get!(5, 2021)
    result = part1(input)

    assert result == 5698
  end

  test "part2" do
    input = AdventOfCode.Input.get!(5, 2021)
    result = part2(input)

    assert result == 15463
  end
end
