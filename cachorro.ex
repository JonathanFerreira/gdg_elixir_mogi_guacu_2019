defmodule Cachorro do
  defstruct nome: nil, comida_favorita: nil

  def new(nome, comida_favorita) do
    %Cachorro{nome: nome, comida_favorita: comida_favorita}
  end

  def altera_comida_favorita(%Cachorro{nome: nome, comida_favorita: _comida_favorita}, comida) do
    new(
      nome,
      comida
    )
  end
end
