# frozen_string_literal: true

module Tasks
  class CreateService
    def self.call(...)
      new(...).call
    end

    def initialize(params:)
      @params = params
    end

    def call; end

    private

    attr_reader :params
  end
end
