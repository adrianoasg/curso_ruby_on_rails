require_relative 'pessoa'

class PessoaJuridica < Pessoa
    attr_accessor :cnpj
    attr_accessor :mome_fantasia
end