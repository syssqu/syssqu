# coding: utf-8
#activerecordを継承していないモデル
class Entry
  include ActiveModel::Validations # モデルオブジェクトとして振る舞うようにする
  include ActiveModel::Conversion # バリデーション機能を使えるようにする
  extend ActiveModel::Naming # オブジェクトをform_forで使えるようにする
  extend ActiveModel::Translation # リデーション時のエラーメッセージに日本語の属性名を使用できるようにする
   
  attr_accessor :family_name, :first_name, :kana_family_name, :kana_first_name,
                :gender, :birth_year, :birth_month, :birth_day, :pr, :mail, :mail_confirm, :inquiry

  validates :family_name,       presence: true, length: { maximum: 20 }
  validates :first_name,        presence: true, length: { maximum: 20 }
  validates :kana_family_name,  presence: true, length: { maximum: 20 }
  validates :kana_first_name,   presence: true, length: { maximum: 20 }
  validates :gender,            presence: true
  validates :birth_year,        presence: true
  validates :birth_month,       presence: true
  validates :birth_day,         presence: true
  validates :inquiry,           presence: true, length: { maximum: 600 }
  validates :pr,                presence: true
  validates :mail,              presence: true, length: { maximum: 90 }
  validates :mail_confirm,      presence: true, length: { maximum: 90 }
   
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