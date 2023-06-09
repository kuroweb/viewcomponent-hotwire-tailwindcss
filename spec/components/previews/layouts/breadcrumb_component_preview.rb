# frozen_string_literal: true

module Layouts
  class BreadcrumbComponentPreview < ViewComponent::Preview
    def with_valid_array
      render(
        Layouts::BreadcrumbComponent.new(
          [
            { name: "Hoge", url: "/hoge" },
            { name: "Fuga", url: "/fuga" },
            { name: "Me", url: "" }
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
