defmodule ElixirNifExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_nif_example,
      version: "0.1.0",
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:elixir_make, "~> 0.9.0"}
    ]
  end
end
