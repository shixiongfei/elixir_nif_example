defmodule ElixirNifExample do
  @moduledoc """
  Documentation for `ElixirNifExample`.

  ## Examples
      $ iex -S mix

      iex> ElixirNifExample.sum(3, 4)
      7

      iex> ElixirNifExample.echo("Hello World!")
      {:ok, "Hello World!"}
  """

  def sum(a, b) do
    Nif.sum(a, b)
  end

  def echo(content) do
    Nif.echo(self(), content)

    receive do
      msg -> msg
    end
  end
end
