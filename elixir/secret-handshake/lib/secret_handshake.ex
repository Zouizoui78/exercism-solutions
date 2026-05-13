defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code # e.g. 10
      |> Integer.digits(2) # [1, 0, 1, 0]
      |> Enum.reverse() # [0, 1, 0, 1]
      |> Enum.with_index() # [{0, 0}, {1, 1}, {0, 2}, {1, 3}]
      |> Enum.filter(fn {bit, _} -> bit == 1 end) # [{1, 1}, {1, 3}]
      |> Enum.reduce([], fn {_, index}, acc -> apply_operation(index, acc) end) # ["jump", "double blink"]
      |> Enum.reverse() # ["double blink", "jump"]
  end

  defp apply_operation(0, operations), do: ["wink" | operations]
  defp apply_operation(1, operations), do: ["double blink" | operations]
  defp apply_operation(2, operations), do: ["close your eyes" | operations]
  defp apply_operation(3, operations), do: ["jump" | operations]
  defp apply_operation(4, operations), do: Enum.reverse(operations)
  defp apply_operation(_, operations), do: operations

end
