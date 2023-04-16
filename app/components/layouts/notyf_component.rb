module Layouts
  class NotyfComponent < ViewComponent::Base
    def initialize(flash)
      @flash = flash # ApplicationController flashオブジェクト
      super
    end
  end
end
