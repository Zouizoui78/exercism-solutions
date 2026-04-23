defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count(list), do: [hd(list) + 1 | tl(list)]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?(list), do: has_day_without_birds?(tl(list))

  defp total([], sum), do: sum
  defp total(list, sum), do: total(tl(list), hd(list) + sum)
  def total(list), do: total(list, 0)

  defp busy_days([], count), do: count
  defp busy_days(list, count) when hd(list) >= 5, do: busy_days(tl(list), count + 1)
  defp busy_days(list, count), do: busy_days(tl(list), count)
  def busy_days(list), do: busy_days(list, 0)
end
