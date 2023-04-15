import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {
    tasks: Array,
  };

  connect() {
    // MEMO: コンポーネント固有のJS処理を記述
  }
}
