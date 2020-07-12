class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_way
  belongs_to :delivery_day

  mount_uploaders :images, ImageUploader

  with_options presence: true do
    validates :price
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_way_id
    validates :delivery_day_id
  end
end
