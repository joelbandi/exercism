defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @action_key [
    {"wink", 1},
    {"double blink", 2},
    {"close your eyes", 4},
    {"jump", 8},
  ]
  @reverse_key 16
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    results = decode(@action_key, code, [])
    if (@reverse_key &&& code) == 0, do: results, else: Enum.reverse(results)
  end

  defp decode([{action, key} | tail], code, acc) do
    case code &&& key do
      0   -> decode(tail, code, acc)
      _ -> decode(tail, code, acc ++ [action])
    end
  end

  defp decode([], _, acc) do
    acc
  end
end
