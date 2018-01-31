module CurrentUserConcern
  extend  ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: 'Guest',
                   first_name: 'Guest',
                   last_name: 'Guest',
                   email: "no email")
  end
end
