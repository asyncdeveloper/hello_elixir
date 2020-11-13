defmodule HelloElixir do
  @moduledoc """
    Provides methods for handling a deck of cards
  """

  @doc """
    create a deck of cards
  """
  def createDeck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suites = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suite <- suites do
        "#{value} of #{suite}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Determines if deck contains a given card

  ## Examples
      iex> deck = HelloElixir.createDeck
      iex> HelloElixir.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    `handSize` indicates how many hands to return

  ## Examples
        iex> deck = HelloElixir.createDeck
        iex> { hand, deck } = HelloElixir.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, handSize) do
    Enum.split(deck, handSize)
  end

  def save(deck, fileName) do
    binary = :erlang.term_to_binary(deck)
    File.write(fileName, binary)
  end

  def load(fileName) do
    case File.read(fileName) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } ->  "File not found."
    end
  end

  def createHand(size) do
    HelloElixir.createDeck
    |> HelloElixir.shuffle
    |> HelloElixir.deal(size)
  end

end
