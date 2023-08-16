defmodule ExDocuSeal.MixProject do
  use Mix.Project

  @github_url "https://github.com/sebastianbachmann/ExDocuSeal"

  def project do
    [
      app: :ex_docu_seal,
      version: "1.1.0",
      description: "DESCRIPTION TODO",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        maintainers: ["sebastianbachmann", "vKxni"],
        licenses: ["MIT"],
        links: %{
          GitHub: @github_url
        }
      ],
      source_url: @github_url,
      docs: [
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # HTTP requests
      {:httpoison, "~> 2.1"},
      # for parsing JSON
      {:jason, "~> 1.4"},
      # documentation generator
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:dotenv_parser, "~> 2.0"}
    ]
  end
end
