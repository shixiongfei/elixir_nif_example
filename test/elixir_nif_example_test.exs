defmodule ElixirNifExampleTest do
  use ExUnit.Case
  doctest ElixirNifExample

  test "test sum" do
    assert ElixirNifExample.sum(3, 4) == 7
  end

  test "test echo" do
    assert ElixirNifExample.echo("Hello World!") == {:ok, "Hello World!"}
  end
end
