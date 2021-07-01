namespace :dev do
  task :transfer => :environment do
    self.import('app/data/me.csv')
      CSV.foreach('app/data/me.csv', headers: true) do |row|
        coin = find_by(id: row["id"]) || new
        coin.attributes = row.to_hash.slice(*updatable_attributes)
        coin.save！
      end

     self.updatable_attributes
      ["id","name", "mc", "mv", "price", "marketl", "quota","week"]
  end
end
