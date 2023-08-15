defmodule ExDocuSeal.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_docu_seal,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:dotenv_parser, "~> 2.0"},
      {:httpoison, "~> 2.1"},
      {:jason, "~> 1.4"}
    ]
  end
end
