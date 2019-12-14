class Cachorro
  attr_accessor :nome, :comida_favorita

  def initialize(nome, comida_favorita)
    @nome = nome
    @comida_favorita = comida_favorita
  end

  def altera_comida_favorita(comida)
    self.comida_favorita = comida
  end
end
