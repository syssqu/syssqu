# -*- coding: utf-8 -*-
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

  def inquiry_page

    @inquiry = Inquiry.new

  end

  def inquiry_confirm

    @inquiry_id = params[:inquiry_id]

    @inquiry = Inquiry.new(params[:inquiry])

    if @inquiry.valid?
      
      # redirect_to inquiry_confirm_url
    else
      render 'static_pages/inquiry_page'
    end
  end

  def entry

    @entry = Entry.new

    setting_birth_info
    setting_adress_info
    setting_entry_info

    @_entry_id = "entry"
  end

  def career_entry

    @entry = Entry.new

    setting_birth_info
    setting_adress_info
    setting_entry_info

    @_entry_id = "career_entry"
  end

  def change_day_select
    @year=params[:year].to_i
    @month=params[:month].to_i
    @_day=params[:day].to_i
    
    @_birth_day = (1..31).to_a
    if @month == 2
      @_birth_day = (1..28).to_a
      if @year % 400 == 0 || (@year % 4 == 0 && @year % 100 != 0)
        @_birth_day = (1..29).to_a
      end
    elsif @month==4 || @month==6 || @month==9 || @month==11
      @_birth_day = (1..30).to_a
    end
  end

  def entry_confirm
    setting_birth_info
    setting_adress_info
    @_entry_id = params[:entry_id]

    @entry = Entry.new(params[:entry])


    if @entry.valid?
      # redirect_to entry_confirm_url
    else
      if @_entry_id == 'entry'
        render 'static_pages/entry'
      elsif @_entry_id == 'career_entry'
        render 'static_pages/career_entry'
      end
    end
  end

  def entry_comp
    @_entry_id = params[:entry_id]
  end

  def mail_send
    setting_birth_info
    setting_adress_info
    @_entry_id = params[:entry_id]
    
    @entry = Entry.new(params[:entry])

    # if @entry.valid?
    begin
      @mail = SendMailer.send_entry(params[:entry]).deliver
      redirect_to entry_comp_url(entry_id: @_entry_id)
    rescue => e
      raise e
    end
      # if @_entry_id=='entry'
      #   redirect_to entry_url
      # elsif @_entry_id=='career_entry'
      #   redirect_to career_entry_url
      # end
    # else
    #   if @_entry_id=='entry'
    #     render 'static_pages/entry'
    #   elsif @_entry_id=='career_entry'
    #     render 'static_pages/career_entry'
    #   end
    # end
  end

  def inquiry_send

    @inquiry_id = params[:inquiry_id]

    @inquiry = Inquiry.new(params[:inquiry])

    # if @inquiry.valid?
    begin
      @mail = SendMailer.send_inquiry(params[:inquiry]).deliver
      redirect_to inquiry_comp_url(inquiry_id: @inquiry_id)
    rescue => e
      raise e
    end
    

      # flash[:success] = '送信完了しました。お問い合わせありがとうございました。'
      
    
    # else
    #   render 'static_pages/inquiry_page'
    # end
  end

  def inquiry_comp

    @inquiry_id = params[:inquiry_id]

  end

  def history
  end

  def jouhouhogo
    @target_info=params[:target_info]
  end

  def zisseki
  end

  def sitemap
  end 

  def contact
  end

  private
    def setting_birth_info()
      @_birth_year = (1960..2010).to_a
      @_birth_month = (1..12).to_a
      @_birth_day = (1..31).to_a
      @_30birth_day = (1..30).to_a
      @_2mu_birth_day = (1..29).to_a
      @_2m_birth_day = (1..28).to_a
    end
    def setting_adress_info()
       @_prefecture = ["北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","山梨県","新潟県","富山県","石川県","福井県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    end
    def setting_entry_info()
      @_entry_id = "entry"
    end
end
