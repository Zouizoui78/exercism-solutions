defmodule ResistorColorTrio do
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

  @spec value(colors :: [atom]) :: integer
  defp value(colors) do
    code(Enum.at(colors, 0)) * 10 + code(Enum.at(colors, 1))
  end

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    case Enum.at(colors, 2) do
      :black -> {value(colors), :ohms}
      :brown -> {value(colors) * 10, :ohms}
      :red -> {value(colors) / 10, :kiloohms}
      :orange -> {value(colors), :kiloohms}
      :yellow -> {value(colors) * 10, :kiloohms}
      :green -> {value(colors) / 10, :megaohms}
      :blue -> {value(colors), :megaohms}
      :violet -> {value(colors) * 10, :megaohms}
      :grey -> {value(colors) / 10, :gigaohms}
      :white -> {value(colors), :gigaohms}
    end
  end
end
