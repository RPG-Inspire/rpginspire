# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?

    can :manage, Topic, user_id: user.id
    can :edit_tag, Topic, user_id: nil
  end
end
