import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {};

  connect() {
    const DestroyForm = (() => {
      const init = () => {
        document.querySelectorAll('.destroy_task_modal').forEach((e) => {
          e.addEventListener('click', (e) => {
            const formElement = document.getElementById('destroy_task_form');

            formElement.action = `${formElement.action}/${e.currentTarget.dataset.taskId}`;
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
