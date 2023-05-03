# frozen_string_literal: true

module Layouts
  class BreadcrumbComponentPreview < ViewComponent::Preview
    def default
      render(
        Layouts::BreadcrumbComponent.new(
          [
            { name: "Hoge", url: "/", class_name: "" },
            { name: "Fuga", url: "/fuga", class_name: "" },
            { name: "Me", url: "", class_name: "font-semibold" }
          ]
        )
      )
    end

    def with_blank_array
      render(Layouts::BreadcrumbComponent.new([]))
    end

    def with_nil
      render(Layouts::BreadcrumbComponent.new(nil))
    end
  end
end
