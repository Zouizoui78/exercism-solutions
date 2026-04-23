defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found

  def search(numbers, key) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(numbers, key, start, stop) when start == stop do
    if elem(numbers, start) == key do
      {:ok, start}
    else
      :not_found
    end
  end

  defp search(numbers, key, start, stop) when stop - start == 1 do
    cond do
      elem(numbers, start) == key -> {:ok, start}
      elem(numbers, stop) == key -> {:ok, stop}
      true -> :not_found
    end
  end

  defp search(numbers, key, start, stop) do
    i = div(stop - start, 2) + start
    e = elem(numbers, i)
    cond do
      e == key -> {:ok, i}
      e > key -> search(numbers, key, start, i - 1)
      e < key -> search(numbers, key, i + 1, stop)
    end
  end
end
