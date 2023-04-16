import { Controller } from '@hotwired/stimulus';
import { Notyf } from 'notyf';

export default class extends Controller {
  static values = {
    flash: Array,
  };

  connect() {
    // MEMO: コンポーネント固有のJS処理を記述
    const notyf = new Notyf();
    this.flashValue.forEach((f) => {
      switch (f[0]) {
        case 'notice':
          notyf.success(f[1]);
          break;
        default:
          notyf.error(f[1]);
      }
    });
  }
}
