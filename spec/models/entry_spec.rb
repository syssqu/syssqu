require 'spec_helper'

describe Entry do
	before do
		@entry = Entry.new( family_name: "山田",
							first_name: "太郎", 
							kana_family_name: "ヤマダ",
							kana_first_name: "タロウ",
							gender: "男",
							birth_year: "2000",
							birth_month: "1",
							birth_day: "1",
							email: "example@sys.com",
							# email_confirmation: "山田",
							postal_code: "111-1111",
							prefecture: "大阪府",
							city: "大阪市",
							house_number: "111",
							building: "山田ビル",
							phone: "080-1234-5678",
							gakureki: "山田",
							career: "山田",
							motive: "山田",
							pr: "山田" )
	end
	subject { @entry }
end