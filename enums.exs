# Exercises ListAndRecursions-5
# Programming Elixir 1.2 by Dave Thomas

# all?, each, filter, split, take
defmodule Enums do
  def all?([ head | tail ]), do: if !!head, do: Cenum.all?(tail), else: false
  def all?([]), do: true
  def all?([head | tail], fn_arg), do: if !!fn_arg.(head), do: Cenum.all?(tail, fn_arg), else: false
  def all?([], _), do: true

  def each([], _), do: :ok
  def each([head | tail], fn_arg) do
    fn_arg.(head)
    Enums.each(tail, fn_arg)
  end

  def filter([], _), do: []
  def filter([head | tail], fn_arg) do
    if !!fn_arg.(head), do: _filter(tail, fn_arg, [head]), else: _filter(tail, fn_arg, [])
  end
  defp _filter([], _, carry_over), do: carry_over
  defp _filter([head | tail], fn_arg, carry_over) do
    if !!fn_arg.(head), do: _filter(tail, fn_arg, carry_over ++ [head]), else: _filter(tail, fn_arg, carry_over)
  end

  @docp """
  #
  # First implementation
  #

  # split (neg numbers dont work)
  def split([], _), do: { [], [] }
  def split([head | tail], index) do
    case index do
      0 -> { [], [head | tail] }
      1 -> { [head], tail }
      _ -> _split(tail, index - 1, [head])
    end
  end
  defp _split([], _, left_side), do: { left_side, [] }
  defp _split([head | tail], index, left_side) do
    case index do
      1 -> { left_side ++ [head], tail }
      _ -> _split(tail, index - 1, left_side ++ [head])
    end
  end
  """

  # taken from https://forums.pragprog.com/forums/322/topics/11935 # Patrick
  # Oscity
  def split([ head | tail ], count) when count > 0 do
    { left, right } = split(tail, count - 1)
    { [ head | left ], right }
  end
  def split(list, _), do: { [], list }
  # end

  # take, neg no. does not work
  def mtake([head | tail], index) when index > 0 do
    [ head | mtake(tail, index - 1) ]
  end
  def mtake(_, _), do: []

  # flatten
  def mflatten([]), do: []
  def mflatten([head | tail]), do: mflatten(head) ++ mflatten(tail)
  def mflatten(single), do: [single]
end
