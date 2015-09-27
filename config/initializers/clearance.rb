Clearance.configure do |config|
  config.mailer_sender   = 'staf@dilek.com.br'
   config.sign_in_guards = [EmailConfirmationGuard]
end
