defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_years = seconds/31557600
    case planet do
      :mercury -> Float.round(earth_years/0.2408467, 2)
      :venus -> Float.round(earth_years/0.61519726, 2)
      :earth -> Float.round(earth_years, 2)
      :mars -> Float.round(earth_years/1.8808158, 2)
      :jupiter -> Float.round(earth_years/11.862615, 2)
      :saturn -> Float.round(earth_years/29.447498, 2)
      :uranus -> Float.round(earth_years/84.016846, 2)
      :neptune -> Float.round(earth_years/164.79132, 2)
    end
  end
end
