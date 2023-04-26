require "rails_helper"

RSpec.describe Tasks::DestroyService do
  describe "#call" do
    let!(:user) { create(:user) }
    let!(:task) { create(:task, user:) }

    context "taskパラメータが「正常」な場合" do
      it "「ServiceResponse.success」を返却すること" do
        result = described_class.call(task:)
        expect(result.success?).to be(true)
      end
    end

    context "「taskパラメータ」が不正な場合" do
      it "「StandardError」を返却すること" do
        expect { described_class.call(task: nil) }.to raise_error(StandardError)
      end
    end
  end
end
