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
							email_confirmation: "example@sys.com",
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

	it { should respond_to(:family_name) }
	it { should respond_to(:first_name ) }
	it { should respond_to(:kana_family_name) }
	it { should respond_to(:kana_first_name) }
	it { should respond_to(:gender) }
	it { should respond_to(:birth_year) }
	it { should respond_to(:birth_month) }
	it { should respond_to(:birth_day) }
	it { should respond_to(:email) }
	it { should respond_to(:email_confirmation) }
	it { should respond_to(:postal_code) }
	it { should respond_to(:prefecture) }
	it { should respond_to(:city) }
	it { should respond_to(:house_number) }
	it { should respond_to(:building) }
	it { should respond_to(:phone) }
	it { should respond_to(:gakureki) }
	it { should respond_to(:career) }
	it { should respond_to(:motive) }
	it { should respond_to(:pr) }

	describe "ユーザー入力-" do
		describe "ユーザー名-" do
			describe "氏名 ( 漢字 )" do
				describe "姓が空欄ではいけない-" do
					before { @entry.family_name=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.family_name="a"*21}
					it { should_not be_valid }
				end
			end

			describe "氏名 ( 漢字 )　名）" do
				describe "が空欄ではいけない-" do
					before { @entry.first_name=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.first_name="a"*21}
					it { should_not be_valid }
				end
			end

			describe "氏名 ( フリガナ )　セイ" do
				describe "が空欄ではいけない-" do
					before { @entry.kana_family_name=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.kana_family_name="a"*21}
					it { should_not be_valid }
				end
			end

			describe "氏名 ( フリガナ )　メイ" do
				describe "が空欄ではいけない-" do
					before { @entry.kana_first_name=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.kana_first_name="a"*21}
					it { should_not be_valid }
				end
			end
		end

		describe "性別-" do
			describe "性別" do
				describe "が空欄ではいけない-" do
					before { @entry.gender=" "}
					it { should_not be_valid}
				end
			end
		end

		describe "生年月日ー" do
			describe "生年月日　年" do
				describe "が空欄ではいけない-" do
					before { @entry.birth_year=" "}
					it { should_not be_valid}
				end

			end

			describe "生年月日　月" do
				describe "が空欄ではいけない-" do
					before { @entry.birth_month=" "}
					it { should_not be_valid}
				end

			end

			describe "生年月日　日" do
				describe "が空欄ではいけない-" do
					before { @entry.birth_day=" "}
					it { should_not be_valid}
				end

			end
			
		end

		describe "メールー" do
			describe "メール" do
				describe "が空欄ではいけない-" do
					before { @entry.email=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.email="a"*91}
					it { should_not be_valid }
				end

				describe "フォーマットの検証" do
					it "誤ったアドレス" do
						addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
						addresses.each do |invalid_address|
							@entry.email = invalid_address
							expect(@entry).not_to be_valid
						end
					end

					it "正しいアドレス" do
						addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
						addresses.each do |valid_address|
							@entry.email = valid_address
							@entry.email_confirmation = valid_address
							expect(@entry).to be_valid
						end
					end
				end
			end

			describe "メール（確認）" do
				describe "が空欄ではいけない-" do
					before { @entry.email_confirmation=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.email_confirmation="a"*91}
					it { should_not be_valid }
				end

				describe "入力した二つのメールが間違っている" do
					it { @entry.email.should include @entry.email_confirmation }
				end
			end
		end

		describe "住所ー" do
			describe "郵便番号" do
				describe "が空欄ではいけない-" do
					before { @entry.postal_code=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.postal_code="a"*9}
					it { should_not be_valid }
				end

				describe "フォーマットの検証" do
					it "誤った番号" do
						numbers = %w[123-12a2 a11-1111 1a1-1111 １１１－１１１１ 11１-1111]
						numbers.each do |numbers|
							@entry.postal_code = numbers
							expect(@entry).not_to be_valid
						end
					end

					it "正しい番号" do
						numbers = %w[111-1111 312-4235]
						numbers.each do |numbers|
							@entry.postal_code = numbers
							expect(@entry).to be_valid
						end
					end
				end
			end

			describe "都道府県" do
				describe "が空欄ではいけない-" do
					before { @entry.prefecture=" "}
					it { should_not be_valid}
				end

			end

			describe "市区町村" do
				describe "が空欄ではいけない-" do
					before { @entry.city=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.city="a"*81}
					it { should_not be_valid }
				end
			end

			describe "番地" do
				describe "文字数制限" do
					before { @entry.house_number="a"*81}
					it { should_not be_valid }
				end
			end

			describe "建物" do
				describe "文字数制限" do
					before { @entry.building="a"*81}
					it { should_not be_valid }
				end
			end
		end

		describe "電話番号ー" do
			describe "電話番号" do
				describe "が空欄ではいけない-" do
					before { @entry.phone=" "}
					it { should_not be_valid}
				end

				describe "文字数制限" do
					before { @entry.phone="a"*14}
					it { should_not be_valid }
				end

				describe "フォーマットの検証" do
					it "誤った番号" do
						numbers = %w[123-12a2-111d a11-1111-1111 1a1-1111-1111 １１１－１１１１ー３２４２ 11１-1111-d111]
						numbers.each do |numbers|
							@entry.phone = numbers
							expect(@entry).not_to be_valid
						end
					end

					it "正しい番号" do
						numbers = %w[111-1111-1111 312-4235-9876]
						numbers.each do |numbers|
							@entry.phone = numbers
							expect(@entry).to be_valid
						end
					end
				end
			end
		end

		describe "最終学歴ー" do
			describe "最終学歴" do

				describe "文字数制限" do
					before { @entry.gakureki="a"*601}
					it { should_not be_valid }
				end
			end
		end

		describe "志望動機ー" do
			describe "志望動機" do
				describe "文字数制限" do
					before { @entry.gakureki="a"*601}
					it { should_not be_valid }
				end
			end
		end

		describe "自己PRー" do
			describe "自己PR" do

				describe "文字数制限" do
					before { @entry.gakureki="a"*601}
					it { should_not be_valid }
				end
			end
		end
	end
end