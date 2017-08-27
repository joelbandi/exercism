defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn(x) -> x == nucleotide end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    hist = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    Enum.reduce(strand, hist, fn(x, hist) ->
      case x do
        ?A -> %{hist | ?A => hist[?A] + 1}
        ?C -> %{hist | ?C => hist[?C] + 1}
        ?G -> %{hist | ?G => hist[?G] + 1}
        ?T -> %{hist | ?T => hist[?T] + 1}
      end
    end)
  end
end
