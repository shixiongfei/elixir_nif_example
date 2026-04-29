defmodule Nif do
  @on_load :load_nif

  def load_nif do
    path = :code.priv_dir(:elixir_nif_example) |> :filename.join(~c"nif")
    :ok = :erlang.load_nif(path, 0)
  end

  def sum(_, _) do
    exit(:nif_library_not_loaded)
  end

  def echo(_, _) do
    exit(:nif_library_not_loaded)
  end
end
