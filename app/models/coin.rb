class Coin < ApplicationRecord

  validates :name, presence: true
  has_paper_trail
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      coin = find_by(id: row["id"]) || new
       coin.attributes = row.to_hash.slice(*updatable_attributes)
       coin.save!
     end
  end

  def self.updatable_attributes
     ["id","coinid","name","mc","mv","price","marketl","quota","week"]
  end

end
