defmodule BuscadorEndereco.Paralelo do
  def start do
    File.stream!('ceps.txt')
    # Cria uma task para cada cep
    |> Enum.map(&criar_task/1)
    # Processa a resposta de cada task
    |> Enum.map(&Task.await/1)
  end

  # Cria task
  defp criar_task(cep) do
    Task.async(fn -> por_cep(cep) end)
  end

  # Realiza a requisição
  defp por_cep(cep) do
    case HTTPoison.get(url(cep)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body |> JSON.decode!() |> parse_json

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)

      _ ->
        IO.puts("Deu ruim")
    end
  end

  # Realiza o parse da response
  defp parse_json(%{"bairro" => bairro, "logradouro" => logradouro, "cidade" => cidade}) do
    IO.puts("#{logradouro}, #{bairro} - #{cidade}")
  end

  # Define a url
  defp url(cep) do
    "https://api.postmon.com.br/v1/cep/#{cep}"
  end
end
