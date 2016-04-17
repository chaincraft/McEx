defmodule McEx.Mixfile do
  use Mix.Project

  def project do
    [app: :mc_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: ["lib", "plugins"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:rustler] ++ Mix.compilers,
     deps: deps,
     rustler_crates: ["native/world", "native/chunk"]]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :cutkey, :httpotion, :gproc],
     mod: {McEx, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:gpb, github: "tomas-abrahamsson/gpb"},
     {:poison, "~> 2.0.0"},
     {:cutkey, github: "imtal/cutkey"},
     {:ibrowse, github: "cmullaparthi/ibrowse"},
     {:httpotion, "~> 2.1.0"},
     {:gproc, "~> 0.5.0"},
     {:uuid, "~> 1.1"},
     {:credo, "~> 0.3", only: [:dev, :test]},
     {:mc_chunk, github: "McEx/McChunk"},
     {:mc_protocol, path: "../McProtocol"},
     {:rustler, "~> 0.0.5"}]
  end
end
