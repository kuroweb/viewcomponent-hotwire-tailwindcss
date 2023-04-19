import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {};
  static targets = ['destroyTaskForm'];

  connect() {
    const DestroyForm = (() => {
      const init = () => {
        document.querySelectorAll('.destroy_task_modal').forEach((e) => {
          e.addEventListener('click', (e) => {
            this.destroyTaskFormTarget.action = `${this.destroyTaskFormTarget.action}/${e.currentTarget.dataset.id}`;
          });
        });
      };

      return {
        init: () => {
          init();
        },
      };
    })();

    (() => {
      DestroyForm.init();
    })();
  }
}
