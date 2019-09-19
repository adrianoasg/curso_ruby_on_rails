namespace :utils do

  desc "CRIA Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando o ADMINISTRADORES..."

    10.times do
    Admin.create!(email: Faker::Internet.email, 
                    password: "123456", 
                    password_confirmation: "123456")
    end

    puts "ADMINISTRADORES cadastrado com sucesso!"
  end

end
