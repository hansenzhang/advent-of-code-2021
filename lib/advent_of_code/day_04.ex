defmodule AdventOfCode.Day04 do
  def part1(args) do
    [numbers | boards] =
      args
      |> String.trim()
      |> String.split("\n\n")

    numbers_to_call =
      numbers
      |> String.split(",")

    boards =
      boards
      |> Enum.map(fn
        board ->
          board
          |> String.split("\n")
          |> Enum.map(&String.split/1)
      end)

    {winning_board, numbers} = get_winning_board([], numbers_to_call, boards)

    winning_sum = winning_board
     |> unmarked_numbers(numbers)
     |> Enum.map(&String.to_integer/1)
     |> Enum.sum()

    winning_sum * String.to_integer(hd(numbers))
  end

  def part2(args) do
    [numbers | boards] =
      args
      |> String.trim()
      |> String.split("\n\n")

    numbers_to_call =
      numbers
      |> String.split(",")

    boards =
      boards
      |> Enum.map(fn
        board ->
          board
          |> String.split("\n")
          |> Enum.map(&String.split/1)
      end)

    {last_board, numbers} = get_last_board([], numbers_to_call, boards)

    unmarked_sum = last_board
     |> unmarked_numbers(numbers)
     |> Enum.map(&String.to_integer/1)
     |> Enum.sum()

    unmarked_sum * String.to_integer(hd(numbers))
  end

  defp get_winning_board(numbers, [head | tail], boards) do
    #find if there are any boards that win with the current numbers
    case Enum.find(boards, &is_winning(&1, numbers)) do
      #no boards found, recurse
      nil ->
        get_winning_board([head | numbers], tail, boards)
      #once found return
      board ->
        {board, numbers}
    end
  end

  defp get_last_board(numbers, [head | tail], boards) do
    # take the boards that haven't won yet and keep playing
    case Enum.filter(boards, &(!is_winning(&1, numbers))) do
      #once the last board wins, return the board and winning numbers
      [] ->
        {hd(boards), numbers}
      # recurse on boards that have not won
      boards ->
        get_last_board([head | numbers], tail, boards)
    end
  end

  defp is_winning(board, numbers) do
    #invert board rows
    columns = board |> Enum.zip() |> Enum.map(&Tuple.to_list/1)

    Enum.any?(board ++ columns, fn rowcol ->
      Enum.all?(rowcol, &Enum.member?(numbers, &1))
    end)
  end

  defp unmarked_numbers(board, numbers) do
    board
    |> Enum.reduce([], fn row, acc -> row ++ acc end)
    |> Enum.filter(&(!Enum.member?(numbers, &1)))
  end
end
