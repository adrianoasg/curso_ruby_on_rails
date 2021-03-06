namespace :dev do

  desc "Setup Development"
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')

    puts "Executando o setup para desenvolvimento..."

    puts "APAGANDO BD... #{%x(rake db:drop)}"
    puts "APAGANDO imagens de Public/system #{%x(rm -rf #{images_path})}"
    puts "CRIANDO BD... #{%x(rake db:create)}" 
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)

    puts "Setup completado com sucesso!"
  end

    ######################################################################

  desc "Cria Administradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando os ADMINISTRADORES..."

    10.times do
    Admin.create!(
      name: Faker::Name.name, 
      email: Faker::Internet.email, 
      password: "123456", 
      password_confirmation: "123456",
      role: [0,0,1,1,1].sample
    )
    end

    puts "ADMINISTRADORES cadastrados com sucesso!"
  end

  ######################################################################

  desc "Cria Membros Fake"
    task generate_members: :environment do
      puts "Cadastrando os MEMBROS..."

      100.times do
      Member.create!( 
        email: Faker::Internet.email, 
        password: "123456", 
        password_confirmation: "123456"
      )
      end

      puts "MEMBROS cadastrados com sucesso!"
  end

  ######################################################################
  desc "Cria Anúcios Fake"
  task generate_ads: :environment do
    puts "Cadastrando ANÚNCIOS..."

    5.times do
      Ad.create!(
        title: Faker::Lorem.paragraph(sentence_count: 2),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.paragraph(sentence_count: 2),
        description: LeroleroGenerator.paragraph([1,2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end

end