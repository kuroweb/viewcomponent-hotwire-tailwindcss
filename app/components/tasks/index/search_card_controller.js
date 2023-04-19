import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};

  connect() {
    const SearchForm = (() => {
      // flatpickrを日本語化
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

      // 締切日のリセットボタンを初期化
      const initDueDateResetButton = () => {
        const buttonElement = document.getElementById('due_date_reset_button');

        buttonElement.addEventListener('click', () => {
          const startDatePicker = document.getElementById(
            'due_date_start_date_field'
          );
          const endDatePicker = document.getElementById(
            'due_date_end_date_field'
          );

          startDatePicker.value = '';
          endDatePicker.value = '';
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
