defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    n = x*x + y*y
    cond do
      n <= 1 -> 10
      n <= 25 -> 5
      n <= 100 -> 1
      true -> 0
    end
  end
end
