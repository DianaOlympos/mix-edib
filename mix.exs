Code.eval_file "tasks/readme.exs"

defmodule EDIB.Mixfile do
  use Mix.Project

  @version "0.5.1"

  def project do
    [
      app:           :edib,
      name:          "edib",
      version:       @version,
      elixir:        "~> 1.0",
      deps:          deps,
      description:   description,
      package:       package,
      source_url:    "https://github.com/edib-tool/mix-edib",
      homepage_url:  "http://hexdocs.pm/mix-edib",
      docs:          &docs/0,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test
      ]
    ]
  end

  def application, do: [applications: [:logger]]

  defp description do
    """
    Mix task to create a docker image of your application release.

    More detailed information about release image building at:

    https://github.com/edib-tool/elixir-docker-image-builder
    """
  end

  defp docs do
    [
      extras:     ["README.md"],
      main:       "extra-readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/edib-tool/mix-edib"
    ]
  end

  defp package do
    [
      files:        ["lib", "tasks", "mix.exs", "README.md", "LICENSE"],
      maintainers:  ["Christoph Grabo"],
      licenses:     ["MIT"],
      links: %{
        "GitHub": "https://github.com/edib-tool/mix-edib",
        "Docs":   "http://hexdocs.pm/edib",
        "About":  "https://github.com/edib-tool/elixir-docker-image-builder"
      }
    ]
  end

  defp deps do
    [
      {:dogma, "~> 0.0.11", only: :dev},
      # {:pavlov, "~> 0.2", only: :test},
      # ^-- 0.2.3 has no subject support, therefore:
      {:pavlov, github: "sproutapp/pavlov", only: :test},
      {:excoveralls, "~> 0.4", only: :test},
      {:ex_doc, "~> 0.10", only: :docs},
      {:earmark, "~> 0.1", only: :docs},
      {:inch_ex, "~> 0.4", only: :docs},
    ]
  end
end
