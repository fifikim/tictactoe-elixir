defmodule TttElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :tictactoe,
      version: "0.1.0",
      elixir: version(),
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end

  defp escript do
    [main_module: TicTacToe.CLI]
  end

  defp version do
    File.read(".elixir_version")
    |> elem(1)
  end
end
