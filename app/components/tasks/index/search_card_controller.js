import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};
  static targets = ['startDateField', 'endDateField', 'resetButton'];

  connect() {
    const SearchForm = (() => {
      // flatpickrを日本語化
      flatpickr.localize(Japanese);

      // 締切日の開始日フォームを初期化
      const initStartDatePicker = () => {
        flatpickr(this.startDateFieldTarget, { dateFormat: 'Y/m/d' });
      };

      // 締切日の終了日フォームを初期化
      const initEndDatePicker = () => {
        flatpickr(this.endDateFieldTarget, { dateFormat: 'Y/m/d' });
      };

      // 締切日のリセットボタンを初期化
      const initDueDateResetButton = () => {
        this.resetButtonTarget.addEventListener('click', () => {
          this.startDateFieldTarget.value = '';
          this.endDateFieldTarget.value = '';
        });
      };

      return {
        init: () => {
          initStartDatePicker();
          initEndDatePicker();
          initDueDateResetButton();
        },
      };
    })();

    (() => {
      SearchForm.init();
    })();
  }
}
