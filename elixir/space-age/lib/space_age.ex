defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @second_per_earth_year 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    case planet do
      :mercury -> {:ok, seconds / 0.2408467 / @second_per_earth_year}
      :venus -> {:ok, seconds / 0.61519726 / @second_per_earth_year}
      :earth -> {:ok, seconds / @second_per_earth_year}
      :mars -> {:ok, seconds / 1.8808158 / @second_per_earth_year}
      :jupiter -> {:ok, seconds / 11.862615 / @second_per_earth_year}
      :saturn -> {:ok, seconds / 29.447498 / @second_per_earth_year}
      :uranus -> {:ok, seconds / 84.016846 / @second_per_earth_year}
      :neptune -> {:ok, seconds / 164.79132 / @second_per_earth_year}
      _ -> {:error, "not a planet"}
    end
  end
end
