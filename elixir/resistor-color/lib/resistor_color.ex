defmodule ResistorColor do
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

  @doc """
  Return the value of a color band
  """
  @spec code(color) :: integer()
  def code(color) do
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
end
