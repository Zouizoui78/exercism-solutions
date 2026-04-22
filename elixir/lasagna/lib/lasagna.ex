defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(min_spent_in_oven), do: expected_minutes_in_oven() - min_spent_in_oven

  def preparation_time_in_minutes(layers_count), do: layers_count*2

  def total_time_in_minutes(layers_count, min_spent_in_oven) do
    preparation_time_in_minutes(layers_count) + min_spent_in_oven
  end

  def alarm(), do: "Ding!"
end
