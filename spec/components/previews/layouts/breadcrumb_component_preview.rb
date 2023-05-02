# frozen_string_literal: true

module Layouts
  class BreadcrumbComponentPreview < ViewComponent::Preview
    def default
      render(
        Layouts::BreadcrumbComponent.new(
          [
            { name: "Hoge", url: "/", class_name: "" },
            { name: "Fuga", url: "", class_name: "font-semibold" }
          ]
        )
      )
    end
  end
end
