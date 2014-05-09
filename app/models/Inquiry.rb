# coding: utf-8
#activerecordを継承していないモデル
class Inquiry
  include ActiveModel::Validations # モデルオブジェクトとして振る舞うようにする
  include ActiveModel::Conversion  # バリデーション機能を使えるようにする
  extend  ActiveModel::Naming      # オブジェクトをform_forで使えるようにする
  extend  ActiveModel::Translation # リデーション時のエラーメッセージに日本語の属性名を使用できるようにする
   
  attr_accessor :family_name, :first_name, :kana_family_name, :kana_first_name,
                :mail, :mail_confirmation, :inquiry

  validates :family_name,       presence: true, length: { maximum: 20 }
  validates :first_name,        presence: true, length: { maximum: 20 }
  validates :kana_family_name,  presence: true, length: { maximum: 20 }
  validates :kana_first_name,   presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail,              presence: true, format: { with: VALID_EMAIL_REGEX }, length: { maximum: 90 }
  validates :mail_confirmation, presence: true, format: { with: VALID_EMAIL_REGEX }, length: { maximum: 90 }
  validates :inquiry,           presence: true, length: { maximum: 600 }

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
