import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};

  connect() {
    const SearchForm = (() => {
      // faltpickrを日本語化
      flatpickr.localize(Japanese);

      // 締切日の開始日フォームを初期化
      const initStartDatePicker = () => {
        flatpickr('#due_date_start_date_field', {
          dateFormat: 'Y/m/d',
        });
      };

      // 締切日の終了日フォームを初期化
      const initEndDatePicker = () => {
        flatpickr('#due_date_end_date_field', {
          dateFormat: 'Y/m/d',
        });
      };

      return {
        init: () => {
          initStartDatePicker();
          initEndDatePicker();
        },
      };
    })();

    (() => {
      SearchForm.init();
    })();
  }
}
