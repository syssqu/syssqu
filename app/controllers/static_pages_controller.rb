class StaticPagesController < ApplicationController
  def home
  end

  def service
  end

  def company_profile
  end

  def company_policy
  end

  def staff_profile
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
  end

  def mail_send
    setting_birth_info

    @entry = Entry.new(params[:entry])

    if @entry.valid?
      @mail = SendMailer.send_entry(params).deliver

      flash[:success] = 'エントリが完了しました。'
      
      redirect_to entry_url
    else
      render 'static_pages/entry'
    end
  end

  private
    def setting_birth_info()
      @_birth_year = (1900..2014).to_a
      @_birth_month = (1..12).to_a
      @_birth_day = (1..31).to_a
    end
end
