defmodule Practice.MixProject do
  use Mix.Project

  def project do
    [
      app: :practice,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp aliases do
    [
      compile: ["compile --warnings-as-errors"],
      test: ["test --exclude skip"]
    ]
  end

  defp deps do
    []
  end
end
