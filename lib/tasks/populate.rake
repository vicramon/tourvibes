namespace :db do
  task populate: :environment do
    User.destroy_all
    House.destroy_all
    Upload.destroy_all

    User.create(name: 'Vic Ramon', email: 'vic@vicramon.com', password: 'password', password_confirmation: 'password')
  end
end
