class Restaurant < ApplicationRecord
  categories = ["chinese", "italian", "japanese", "french", "belgian"]

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: categories,
                                    message: "possibilities : #{categories[0]}, #{categories[1]}, #{categories[2]}, #{categories[3]}"}

end
