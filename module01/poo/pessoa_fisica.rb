require_relative 'pessoa'

class PessoaFisica < Pessoa
    attr_accessor :cpf
    attr_accessor :data_nascimento
end

pf = PessoaFisica.new
pf.nome = "Jakcson"
pf.data_nascimento = "09/09/1989"
pf.cpf = "017.789.998-65"
puts pf.nome
puts pf.data_nascimento
puts pf.cpf