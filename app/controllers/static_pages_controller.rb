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
  end

  def mail_send
    setting_birth_info

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
    end
end
