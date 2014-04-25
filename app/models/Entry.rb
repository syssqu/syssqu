# coding: utf-8
#activerecordを継承していないモデル
class Entry
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
   
  attr_accessor :family_name, :first_name, :kana_family_name, :kana_first_name,
                :gender, :birth_year, :birth_month, :birth_day, :pr

  validates :family_name,  presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :kana_family_name,  presence: true, length: { maximum: 20 }
  validates :kana_first_name, presence: true, length: { maximum: 20 }
  validates :gender,  presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :pr, presence: true
   
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end