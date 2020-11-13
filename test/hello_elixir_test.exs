defmodule HelloElixirTest do
  use ExUnit.Case
  doctest HelloElixir

  test "createDeck makes 20 cards" do
    deckLength = length(HelloElixir.createDeck)
    assert deckLength == 20
  end

  test "shuffling a deck randomizes it" do
    deck = HelloElixir.createDeck
    refute deck == HelloElixir.shuffle(deck)
  end
end
