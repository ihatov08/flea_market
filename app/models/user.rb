class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :timeoutable,
         :trackable

  has_many :items, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :given_name
    validates :family_name
    validates :given_name_kana
    validates :family_name_kana
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end

  def self.birth_year_options
    (1900..Date.current.year).to_a
  end
end
