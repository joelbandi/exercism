defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_helper list, fun, []
  end

  defp keep_helper([head|tail], fun, acc) do
    if fun.(head) do
      keep_helper(tail, fun, [head|acc])
    else
      keep_helper(tail, fun, acc)
    end
  end

  defp keep_helper([], fun, acc) do
    Enum.reverse(acc)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, fn(x) -> !fun.(x) end)
    # keep list, &(!fun.(&1)) an alternative version
  end
end
