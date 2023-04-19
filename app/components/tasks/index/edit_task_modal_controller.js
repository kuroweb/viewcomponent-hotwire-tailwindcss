import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {};

  connect() {
    const EditFormValidation = (() => {
      return {
        init: () => {},
      };
    })();

    const EditFormElement = (() => {
      return {
        init: () => {},
      };
    })();

    (() => {
      EditFormValidation.init();
      EditFormElement.init();
    })();
  }
}
