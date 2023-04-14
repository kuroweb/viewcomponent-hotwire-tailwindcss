module Layouts
  module Header
    class Component < ViewComponent::Base
      def initialize(current_user)
        @current_user = current_user # User < ApplicationRecord
        super
      end
    end
  end
end
