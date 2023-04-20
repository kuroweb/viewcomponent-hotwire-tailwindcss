import { Controller } from '@hotwired/stimulus';
import validator from 'validator';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};
  static targets = [
    // form
    'editTaskForm',

    // input
    'titleField',
    'summaryField',
    'priorityField',
    'dueDateField',

    // error_message
    'titleErrorMessage',
    'summaryErrorMessage',
    'priorityErrorMessage',
    'dueDateErrorMessage',
  ];

  connect() {
    const FormValidation = (() => {
      // タイトル
      const initTitleValidationEvent = () => {
        const validationHandler = () => {
          if (validations.isValidTitle()) {
            this.titleErrorMessageTarget.innerText = '';
          } else {
            this.titleErrorMessageTarget.innerText = 'タイトルが不正です。';
          }
        };

        this.titleFieldTarget.addEventListener('change', () =>
          validationHandler()
        );
        this.titleFieldTarget.addEventListener('blur', () =>
          validationHandler()
        );
      };

      // 詳細
      const initSummaryValidationEvent = () => {
        const validationHandler = () => {
          if (validations.isValidSummary()) {
            this.summaryErrorMessageTarget.innerText = '';
          } else {
            this.summaryErrorMessageTarget.innerText = '詳細が不正です。';
          }
        };

        this.summaryFieldTarget.addEventListener('change', () =>
          validationHandler()
        );
        this.summaryFieldTarget.addEventListener('blur', () =>
          validationHandler()
        );
      };

      // 締切日
      const initDueDateValidationEvent = () => {
        const validationHandler = () => {
          if (validations.isValidDueDate()) {
            this.dueDateErrorMessageTarget.innerText = '';
          } else {
            this.dueDateErrorMessageTarget.innerText = '締切日が不正です。';
          }
        };

        this.dueDateFieldTarget.addEventListener('change', () =>
          validationHandler()
        );
        this.dueDateFieldTarget.addEventListener('blur', () =>
          validationHandler()
        );
      };

      // 優先度
      const initPriorityValidationEvent = () => {
        const validationHandler = () => {
          if (validations.isValidPriority()) {
            this.priorityErrorMessageTarget.innerText = '';
          } else {
            this.priorityErrorMessageTarget.innerText = 'タイトルが不正です。';
          }
        };

        this.priorityFieldTarget.addEventListener('change', () =>
          validationHandler()
        );
        this.priorityFieldTarget.addEventListener('blur', () =>
          validationHandler()
        );
      };

      // Submit時のバリデーション
      const initSubmit = () => {
        this.editTaskFormTarget.addEventListener('submit', (e) => {
          this.titleFieldTarget.dispatchEvent(new Event('change'));
          this.summaryFieldTarget.dispatchEvent(new Event('change'));
          this.dueDateFieldTarget.dispatchEvent(new Event('change'));
          this.priorityFieldTarget.dispatchEvent(new Event('change'));

          if (!validations.isValidTitle()) return e.preventDefault();
          if (!validations.isValidSummary()) return e.preventDefault();
          if (!validations.isValidDueDate()) return e.preventDefault();
          if (!validations.isValidPriority()) return e.preventDefault();
        });
      };

      // バリデーションロジック
      const validations = {
        isValidTitle: () => {
          return this.titleFieldTarget.value.length !== 0;
        },
        isValidSummary: () => {
          return true;
        },
        isValidDueDate: () => {
          return validator.isDate(this.dueDateFieldTarget.value, {
            format: 'YYYY/MM/DD',
          });
        },
        isValidPriority: () => {
          return ['high', 'medium', 'low'].includes(
            this.priorityFieldTarget.value
          );
        },
      };

      return {
        init: () => {
          initTitleValidationEvent();
          initSummaryValidationEvent();
          initDueDateValidationEvent();
          initPriorityValidationEvent();
          initSubmit();
        },
      };
    })();

    const FormElement = (() => {
      const initDueDatePicker = () => {
        // flatpickrを日本語化
        flatpickr.localize(Japanese);

        // 締切日フォームを初期化
        flatpickr(this.dueDateFieldTarget, { dateFormat: 'Y/m/d' });
      };

      // 更新モーダルにTaskの情報を反映
      const initFormAction = () => {
        document.querySelectorAll('.edit_task_modal').forEach((element) => {
          element.addEventListener('click', (event) => {
            // 更新対象のTask.idを取得
            const taskId = event.currentTarget.dataset.id;

            // URLパラメータを取得
            const url = new URL(location.href);
            const params = url.searchParams.toString();

            // actionを更新
            this.editTaskFormTarget.action = `/tasks/${taskId}?${params}`;

            // 入力フォームの初期値を更新
            this.titleFieldTarget.value = event.currentTarget.dataset.title;
            this.summaryFieldTarget.value = event.currentTarget.dataset.summary;
            this.dueDateFieldTarget.value = event.currentTarget.dataset.due_date;
            this.priorityFieldTarget.value = event.currentTarget.dataset.priority;
          });
        });
      };

      return {
        init: () => {
          initDueDatePicker();
          initFormAction();
        },
      };
    })();

    (() => {
      FormValidation.init();
      FormElement.init();
    })();
  }
}
