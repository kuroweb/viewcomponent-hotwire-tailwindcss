import { Controller } from '@hotwired/stimulus';
import validator from 'validator';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};
  static targets = [
    // form
    'createTaskForm',

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
        this.createTaskFormTarget.addEventListener('submit', (e) => {
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
        // faltpickrを日本語化
        flatpickr.localize(Japanese);

        // 締切日フォームを初期化
        flatpickr(this.dueDateFieldTarget, { dateFormat: 'Y/m/d' });
      };

      return {
        init: () => {
          initDueDatePicker();
        },
      };
    })();

    (() => {
      FormValidation.init();
      FormElement.init();
    })();
  }
}
