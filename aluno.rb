class Aluno

  attr_accessor :id,
                :matricula,
                :nome,
                :nota1,
                :nota2,
                :media,
                :recuperacao,
                :resultado

  def initialize(id, matricula, nome, nota1, nota2)

    @id = id
    @matricula = matricula
    @nome = nome

    @nota1 = nota1
    @nota2 = nota2

    @recuperacao = nil

    calcular
  end

  def calcular

    @media = (@nota1 + @nota2) / 2.0

    if @media >= 7
      @resultado = "Aprovado"

    elsif @media >= 4
      @resultado = "Recuperação"

    else
      @resultado = "Reprovado"
    end

  end

  def aplicar_recuperacao(nota)

    @recuperacao = nota

    @media = (@media + nota) / 2

    if @media >= 5
      @resultado = "Aprovado"
    else
      @resultado = "Reprovado"
    end

  end

end
