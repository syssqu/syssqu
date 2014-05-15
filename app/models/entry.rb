# coding: utf-8
#activerecordを継承していないモデル
require 'date'
class Entry
  include ActiveRecord
  include ActiveModel::Validations # モデルオブジェクトとして振る舞うようにする
  include ActiveModel::Conversion  # バリデーション機能を使えるようにする
  extend  ActiveModel::Naming      # オブジェクトをform_forで使えるようにする
  extend  ActiveModel::Translation # リデーション時のエラーメッセージに日本語の属性名を使用できるようにする
   

  attr_accessor :family_name, :first_name, :kana_family_name, :kana_first_name,
                :gender, :birth_year, :birth_month, :birth_day, :email,
                :postal_code, :prefecture, :city, :house_number, :building,
                :phone, :gakureki, :motive, :career,:pr

  validates :family_name,  presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :kana_family_name,  presence: true, length: { maximum: 20 }
  validates :kana_first_name, presence: true, length: { maximum: 20 }
  validates :gender,  presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :birth_day, presence: true
  # メールアドレス
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    confirmation: true,
                    length: { maximum: 90 },
                    format:   { with: VALID_EMAIL_REGEX },
                    uniqueness: false
  #　住所
  VALID_ADDRESS_REGEX = /\A^[0-9\-]*$\z/
  validates :postal_code, presence: true, length: { maximum: 8 },
                          format: {with: VALID_ADDRESS_REGEX } 
  validates :prefecture, presence: true
  validates :city, presence: true, length: { maximum: 80 }
  validates :house_number, length: { maximum: 80 }
  validates :building, length: { maximum: 80 }

  #　電話
  VALID_PHONE_REGEX = /\A^[0-9\-]*$\z/
  validates :phone, presence: true,length: { maximum: 13 },
                    format:   {with: VALID_PHONE_REGEX }

  validates :gakureki, length: { maximum: 600 }
  validates :motive, length: { maximum: 600 }
  # validates :career, presence: true, length: { maximum: 600 }
  validates :pr, length: { maximum: 600 }
   
  def initialize(attributes = {})
    self.attributes = attributes
  end
 
  def attributes=(attributes = {})
    if attributes
      attributes.each do |name, value|
        send "#{name}=", value
      end
    end
  end
 
  def attributes
    Hash[instance_variable_names.map{|v| [v[1..-1], instance_variable_get(v)]}]
  end

  # form_forではオブジェクトが永続化済かどうかでsubmit先を分岐している為、persisted?メソッドで常にfalseを返す
  def persisted?; false; end

end
