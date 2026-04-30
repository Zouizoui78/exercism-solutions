defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) when data <= tree.data do
    if tree.left do
      %{tree | left: insert(tree.left, data)}
    else
      %{tree | left: %{data: data, left: nil, right: nil}}
    end
  end

  def insert(tree, data) do
    if tree.right do
      %{tree | right: insert(tree.right, data)}
    else
      %{tree | right: %{data: data, left: nil, right: nil}}
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node | nil) :: [any]
  def in_order(tree), do: in_order(tree, [])

  defp in_order(nil, acc), do: acc
  defp in_order(tree, acc) do
    acc = in_order(tree.right, acc)
    in_order(tree.left, [tree.data | acc])
  end
end
