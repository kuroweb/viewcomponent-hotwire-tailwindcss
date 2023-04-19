module Layouts
  class HeaderComponent < ViewComponent::Base
    def initialize(current_user)
      @current_user = current_user # User < ApplicationRecord
      super
    end
  end
end
