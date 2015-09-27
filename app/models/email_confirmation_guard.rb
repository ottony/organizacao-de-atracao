class EmailConfirmationGuard < Clearance::SignInGuard
  def call
    return next_guard if confirmed?

    failure("You must confirm your email address.")
  end

  private

  def confirmed?
    signed_in? and current_user.confirmed?
  end
end
