# frozen_string_literal: true

module Layouts
  class NotyfComponentPreview < ViewComponent::Preview
    def default
      render(NotyfComponent.new(ActionDispatch::Flash::FlashHash.new))
    end

    def with_success
      render(NotyfComponent.new(ActionDispatch::Flash::FlashHash.new(notice: "Success")))
    end

    def with_error
      render(NotyfComponent.new(ActionDispatch::Flash::FlashHash.new(error: "Error")))
    end
  end
end
