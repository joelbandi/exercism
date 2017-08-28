defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
      |>String.split
      |>Enum.map(&translator/1)
      |>Enum.join(" ")
  end

  defp translator(word) do
    case consonant_or_vowel(word) do
      {:vowel,a,b} -> a<>b<>"ay"
      {:consonant,a,b} -> b<>a<>"ay"
    end
  end

  defp consonant_or_vowel(word) do
    case word do
      "yt"<>rest -> {:vowel,"yt",rest}
      "xr"<>rest -> {:vowel,"xr",rest}
      "a"<>rest -> {:vowel,"a",rest}
      "e"<>rest -> {:vowel,"e",rest}
      "i"<>rest -> {:vowel,"i",rest}
      "o"<>rest -> {:vowel,"o",rest}
      "u"<>rest -> {:vowel,"u",rest}
      "ch"<>rest -> {:consonant,"ch",rest}
      "qu"<>rest -> {:consonant,"qu",rest}
      "squ"<>rest -> {:consonant,"squ",rest}
      "thr"<>rest -> {:consonant,"thr",rest}
      "th"<>rest -> {:consonant,"th",rest}
      "sch"<>rest -> {:consonant,"sch",rest}
      other -> other |> String.split_at(1) |> Tuple.insert_at(0, :consonant)
    end
  end
end
