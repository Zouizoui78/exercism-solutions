defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> to_charlist()
    |> Enum.reduce(0, &(&2 + letter_score(&1)))
  end

  defp letter_score(letter) do
    cond do
      letter in ~c"AEIOULNRST" -> 1
      letter in ~c"DG" -> 2
      letter in ~c"BCMP" -> 3
      letter in ~c"FHVWY" -> 4
      letter in ~c"K" -> 5
      letter in ~c"JX" -> 8
      letter in ~c"QZ" -> 10
      true -> 0
    end
  end
end
