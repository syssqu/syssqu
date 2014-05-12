class StaticPagesController < ApplicationController
  def home
  end

  def service
  end

  def profile_company
  end

  def policy
  end

  def profile_staff
  end

  def access
  end

  def contact
  end

  def news
  end

  def executive
  end

  def recruit
  end

  def member
  end

  def fresh
  end

  def career
  end

  def entry

    @entry = Entry.new

    setting_birth_info
    setting_adress_info
  end

  def change_day_select
    # @entry = Entry.all
    # respond_to do |format|
    #   format.slim {redirect_to @entry}
    #   format.js
    # end
   # session[:birth_day]=2
   # birth_day = (1..29).to_a
   @_birth_day = (1..29).to_a
   # @_birth_day = @_2m_birth_day
  end

  def mail_send
    setting_birth_info
    setting_adress_info

    @entry = Entry.new(params[:entry])

    if @entry.valid?
      @mail = SendMailer.send_entry(params[:entry]).deliver

      flash[:success] = 'エントリが完了しました。'
      
      redirect_to entry_url
    else
      render 'static_pages/entry'
    end
  end

  def history
  end

  def jouhouhogo
  end

  def zisseki
  end

  def sitemap    
  end

  private
    def setting_birth_info()
      @_birth_year = (1900..2014).to_a
      @_birth_month = (1..12).to_a
      @_birth_day = (1..31).to_a
      @_2m_birth_day = (1..29).to_a
      @id =2
    end
    def setting_adress_info()
       @_prefecture = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","山梨県","新潟県","富山県","石川県","福井県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    end
end
