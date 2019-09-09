require_relative 'pessoa'

class PessoaJuridica < Pessoa
    attr_accessor :cnpj
    attr_accessor :nome_fantasia
end

pj = PessoaJuridica.new
pj.cnpj = "012.369.258/0001-89"
pj.nome_fantasia = "Loja Tal"

puts pj.cnpj
puts pj.nome_fantasia