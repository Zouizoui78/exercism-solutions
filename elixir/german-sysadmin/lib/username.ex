defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    cleared =
      case head do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> ~c"_"
        _ -> ~c""
      end
    cleared ++ sanitize(tail)
  end
end
