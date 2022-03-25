class List < ApplicationRecord
    belongs_to :genre

    validates :name, presence: true
    validates :rate, presence: true
end
