import { Controller } from '@hotwired/stimulus';
import { Notyf } from 'notyf';

export default class extends Controller {
  static values = {
    url: Array,
  };

  connect() {
    // MEMO: コンポーネント固有のJS処理を記述
    const notyf = new Notyf();
    this.urlValue.forEach((url) => {
      switch (url[0]) {
        case 'notice':
          notyf.success(url[1]);
          break;
        default:
          notyf.error(url[1]);
      }
    });
  }
}
