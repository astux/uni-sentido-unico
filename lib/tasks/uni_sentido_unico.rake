#encoding: utf-8
namespace :uni_sentido_unico do
  desc "Seed"
  task :seed => :environment do
    CourseContract.create({ :name => 'FAERPI Pós-Graduação'})
    CourseContract.create({ :name => 'OAB'})
  end
end