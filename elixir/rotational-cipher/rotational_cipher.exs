defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
      |> String.to_charlist
      |> Enum.map(rot_x_encode(shift))
      |> List.to_string
  end

  # This function returns another function with a closure on the shift and alphabet_size
  defp rot_x_encode(x, alphabet_size \\ 26) do
    # you can also use guard clauses in elixir anon functions
    fn
      char when char in ?a..?z -> rem(char - ?a + x, alphabet_size) + ?a
      char when char in ?A..?Z -> rem(char - ?A + x, alphabet_size) + ?A
      char -> char
    end
  end
end

