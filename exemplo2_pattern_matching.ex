
# %{nome: "Jonathan Ferreira", palestra: "Elixir - Mais que uma linguagem!"}

# Pattern matching com estruturas

defmodule Gdg do
  def saudacao(json) do
    "#{nome_participante(json)} | #{nome_palestra(json)}"
  end

  def nome_participante(%{nome: nome}) do
    IO.puts "Seja bem-vindo #{nome}."
  end

  def nome_palestra(%{palestra: palestra}) do
    IO.puts "Você está na palestra: #{palestra}"
  end
end
