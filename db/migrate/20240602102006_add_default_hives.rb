class AddDefaultHives < ActiveRecord::Migration[7.1]
  def change
    Hive.create!(name: 'Hive 1', weight: 25, bee_species: 'Apis mellifera')
    Hive.create!(name: 'Hive 2', weight: 36, bee_species: 'Bombus terrestris')
    Hive.create!(name: 'Hive 3', weight: 21, bee_species: 'Megachile rotundata')
    Hive.create!(name: 'Hive 4', weight: 18, bee_species: 'Xylocopa violacea')
  end
end
