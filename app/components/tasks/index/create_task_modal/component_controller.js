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
    const CreateFormValidation = (() => {
      // タイトル
      const initTitleValidationEvent = () => {
        const validation = () => {
          const isValid = validationRules.title();

          if (isValid) {
            this.titleErrorMessageTarget.innerText = '';
          } else {
            this.titleErrorMessageTarget.innerText = 'タイトルが不正です。';
          }
        };

        this.titleFieldTarget.addEventListener('change', () => validation());
        this.titleFieldTarget.addEventListener('blur', () => validation());
      };

      // 詳細
      const initSummaryValidationEvent = () => {
        const validation = () => {
          const isValid = validationRules.summary();

          if (isValid) {
            this.summaryErrorMessageTarget.innerText = '';
          } else {
            this.summaryErrorMessageTarget.innerText = '詳細が不正です。';
          }
        };

        this.summaryFieldTarget.addEventListener('change', () => validation());
        this.summaryFieldTarget.addEventListener('blur', () => validation());
      };

      // 締切日
      const initDueDateValidationEvent = () => {
        const validation = () => {
          const isValid = validationRules.dueDate();

          if (isValid) {
            this.dueDateErrorMessageTarget.innerText = '';
          } else {
            this.dueDateErrorMessageTarget.innerText = '締切日が不正です。';
          }
        };

        this.dueDateFieldTarget.addEventListener('change', () => validation());
        this.dueDateFieldTarget.addEventListener('blur', () => validation());
      };

      // 優先度
      const initPriorityValidationEvent = () => {
        const validation = () => {
          const isValid = validationRules.priority();

          if (isValid) {
            this.priorityErrorMessageTarget.innerText = '';
          } else {
            this.priorityErrorMessageTarget.innerText = 'タイトルが不正です。';
          }
        };

        this.priorityFieldTarget.addEventListener('change', () => validation());
        this.priorityFieldTarget.addEventListener('blur', () => validation());
      };

      // Submit時のバリデーション
      const initOnSubmit = () => {
        this.createTaskFormTarget.addEventListener('submit', (e) => {
          this.titleFieldTarget.dispatchEvent(new Event('change'));
          this.summaryFieldTarget.dispatchEvent(new Event('change'));
          this.dueDateFieldTarget.dispatchEvent(new Event('change'));
          this.priorityFieldTarget.dispatchEvent(new Event('change'));

          if (!validationRules.title()) return e.preventDefault();
          if (!validationRules.summary()) return e.preventDefault();
          if (!validationRules.dueDate()) return e.preventDefault();
          if (!validationRules.priority()) return e.preventDefault();
        });
      };

      // バリデーションロジック
      const validationRules = {
        title: () => {
          return this.titleFieldTarget.value.length !== 0;
        },
        summary: () => {
          return true;
        },
        dueDate: () => {
          return validator.isDate(this.dueDateFieldTarget.value, {
            format: 'YYYY/MM/DD',
          });
        },
        priority: () => {
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
          initOnSubmit();
        },
      };
    })();

    const CreateFormElement = (() => {
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
      CreateFormValidation.init();
      CreateFormElement.init();
    })();
  }
}
