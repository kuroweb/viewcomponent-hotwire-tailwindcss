import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {};
  static targets = ['destroyTaskForm'];

  connect() {
    const DestroyForm = (() => {
      const init = () => {
        document.querySelectorAll('.destroy_task_modal').forEach((element) => {
          element.addEventListener('click', (event) => {
            // 更新対象のTask.idを取得
            const taskId = event.currentTarget.dataset.id;

            // URLパラメータを取得
            const url = new URL(location.href);
            const params = url.searchParams.toString();

            // actionを更新
            this.destroyTaskFormTarget.action = `/tasks/${taskId}?${params}`;
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
