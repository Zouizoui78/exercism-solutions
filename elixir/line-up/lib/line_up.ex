defmodule LineUp do
  @doc """
  Formats a full ticket sentence for the given name and number, including
  the person's name, the ordinal form of the number, and fixed descriptive text.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    r10 = rem(number, 10)
    r100 = rem(number, 100)
    n =
      cond do
        r10 == 1 && r100 != 11 -> "#{number}st"
        r10 == 2 && r100 != 12 -> "#{number}nd"
        r10 == 3 && r100 != 13 -> "#{number}rd"
        true -> "#{number}th"
      end
    "#{name}, you are the #{n} customer we serve today. Thank you!"
  end
end
