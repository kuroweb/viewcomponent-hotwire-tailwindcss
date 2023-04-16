module Layouts
  module Notyf
    class Component < ViewComponent::Base
      def initialize(flash)
        @flash = flash # ApplicationController flashオブジェクト
        super
      end
    end
  end
end
