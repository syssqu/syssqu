ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'syssqu.herokuapp.com',
  :user_name            => 'syssqu@gmail.com', # full email address (user@your.host.name.com)
  :password             => 'Squareadm11#',
  :authentication       => 'login',
  :enable_starttls_auto => true
}
