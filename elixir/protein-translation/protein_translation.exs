defmodule ProteinTranslation do
  @codon_db %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    _of_rna(rna, [])
  end
  
  defp _of_rna("", acc), do: { :ok, Enum.reverse(acc) }

  defp _of_rna(rna, acc) do
    {codon, rest} = String.split_at(rna, 3)
    case _of_codon(codon) do
      "STOP" -> { :ok, Enum.reverse(acc) }
      :error -> { :error, "invalid RNA" }
      protein -> _of_rna(rest, [protein|acc])
    end
  end

  defp _of_codon(codon) do
    if Map.has_key?(@codon_db, codon), do: @codon_db[codon], else: :error
  end


  @doc """
  Given a codon, return the corresponding protein

  UGU => Cysteine
  UGC => Cysteine
  UUA => Leucine
  UUG => Leucine
  AUG => Methionine
  UUU => Phenylalanine
  UUC => Phenylalanine
  UCU => Serine
  UCC => Serine
  UCA => Serine
  UCG => Serine
  UGG => Tryptophan
  UAU => Tyrosine
  UAC => Tyrosine
  UAA => STOP
  UAG => STOP
  UGA => STOP
  """



  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    if Map.has_key?(@codon_db, codon), do: {:ok, @codon_db[codon]}, else: { :error, "invalid codon" }
  end
end

