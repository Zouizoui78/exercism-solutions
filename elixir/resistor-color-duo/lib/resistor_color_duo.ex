defmodule ResistorColorDuo do
  @type color ::
    :black
    :brown
    :red
    :orange
    :yellow
    :green
    :blue
    :violet
    :grey
    :white

  @spec code(color) :: integer()
  defp code(color) do
    case color do
    :black -> 0
    :brown -> 1
    :red -> 2
    :orange -> 3
    :yellow -> 4
    :green -> 5
    :blue -> 6
    :violet -> 7
    :grey -> 8
    :white -> 9
    end
  end

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    code(Enum.at(colors, 0)) * 10 + code(Enum.at(colors, 1))
  end
end
