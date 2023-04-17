import { Controller } from '@hotwired/stimulus';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};

  connect() {
    // MEMO: コンポーネント固有のJS処理を記述
    flatpickr.localize(Japanese); 
    flatpickr('#due_date_field', {
      locale: {
        rangeSeparator: ' - ',
      },
      mode: 'range',
      dateFormat: 'Y/m/d',
    });
  }
}
