require "rails_helper"

RSpec.describe Layouts::NotyfComponent, type: :component do
  describe "#render" do
    context "flashが存在する場合" do
      context "flashが「成功」の場合" do
        it "画面表示に成功すること" do
          render_preview(:with_success)

          expect(page).to be_truthy
        end

        it "成功トースターが表示されること", js: true, type: :system do
          visit("rails/view_components/layouts/notyf_component/with_success")

          assert_selector(".notyf__toast--success", count: 1)
        end
      end

      context "flashが「失敗」の場合" do
        it "画面表示に成功すること" do
          render_preview(:with_success)

          expect(page).to be_truthy
        end

        it "失敗トースターが表示されること", js: true, type: :system do
          visit("rails/view_components/layouts/notyf_component/with_error")

          assert_selector(".notyf__toast--error", count: 1)
        end
      end
    end

    context "flashが空の場合" do
      it "画面表示に成功すること" do
        render_preview(:with_blank)

        expect(page).to be_truthy
      end

      it "トースターが表示されないこと", js: true, type: :system do
        visit("rails/view_components/layouts/notyf_component/with_blank")

        assert_selector(".notyf__toast", count: 0)
      end
    end
  end
end
