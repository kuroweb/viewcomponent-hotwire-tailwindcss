import { Controller } from '@hotwired/stimulus';
import validator from 'validator';
import flatpickr from 'flatpickr';
import { Japanese } from 'flatpickr/dist/l10n/ja';

export default class extends Controller {
  static values = {};

  connect() {
    const CreateFormValidation = (() => {
      // タイトル
      const initTitleValidation = () => {
        const validation = () => {
          const isValid = validationRules.title();
          const messageElement = document.getElementById('title_field_message');

          if (isValid) {
            messageElement.innerText = '';
          } else {
            messageElement.innerText = 'タイトルが不正です。';
          }
        };

        document
          .getElementById('title_field')
          .addEventListener('change', () => validation());

        document
          .getElementById('title_field')
          .addEventListener('blur', () => validation());
      };

      // 詳細
      const initSummaryValidation = () => {
        const validation = () => {
          const isValid = validationRules.summary();
          const messageElement = document.getElementById(
            'summary_field_message'
          );

          if (isValid) {
            messageElement.innerText = '';
          } else {
            messageElement.innerText = '詳細が不正です。';
          }
        };

        document
          .getElementById('summary_field')
          .addEventListener('change', () => validation());

        document
          .getElementById('summary_field')
          .addEventListener('blur', () => validation());
      };

      // 締切日
      const initDueDateValidation = () => {
        const validation = () => {
          const isValid = validationRules.dueDate();
          const messageElement = document.getElementById(
            'due_date_field_message'
          );

          if (isValid) {
            messageElement.innerText = '';
          } else {
            messageElement.innerText = '締切日が不正です。';
          }
        };

        document
          .getElementById('due_date_field')
          .addEventListener('change', () => validation());

        document
          .getElementById('due_date_field')
          .addEventListener('blur', () => validation());
      };

      // 優先度
      const initPriorityValidation = () => {
        const validation = () => {
          const isValid = validationRules.priority();
          const messageElement = document.getElementById(
            'priority_field_message'
          );

          if (isValid) {
            messageElement.innerText = '';
          } else {
            messageElement.innerText = '優先度が不正です。';
          }
        };

        document
          .getElementById('priority_field')
          .addEventListener('change', () => validation());

        document
          .getElementById('priority_field')
          .addEventListener('blur', () => validation());
      };

      // onSubmit時のバリデーション
      const initOnSubmit = () => {
        document
          .getElementById('create_task_form')
          .addEventListener('submit', (e) => {
            document
              .getElementById('title_field')
              .dispatchEvent(new Event('change'));
            document
              .getElementById('summary_field')
              .dispatchEvent(new Event('change'));
            document
              .getElementById('due_date_field')
              .dispatchEvent(new Event('change'));
            document
              .getElementById('priority_field')
              .dispatchEvent(new Event('change'));

            if (!validationRules.title()) return e.preventDefault();
            if (!validationRules.summary()) return e.preventDefault();
            if (!validationRules.dueDate()) return e.preventDefault();
            if (!validationRules.priority()) return e.preventDefault();
          });
      };

      // バリデーションロジック
      const validationRules = {
        title: () => {
          const titleValue = document.getElementById('title_field').value;
          return titleValue.length !== 0;
        },
        summary: () => {
          return true;
        },
        dueDate: () => {
          const dueDateValue = document.getElementById('due_date_field').value;
          return validator.isDate(dueDateValue, { format: 'YYYY/MM/DD' });
        },
        priority: () => {
          const priorityValue = document.getElementById('priority_field').value;
          return ['high', 'medium', 'low'].includes(priorityValue);
        },
      };

      return {
        init: () => {
          initTitleValidation();
          initSummaryValidation();
          initDueDateValidation();
          initPriorityValidation();
          initOnSubmit();
        },
      };
    })();

    const CreateForm = (() => {
      const initDueDatePicker = () => {
        // faltpickrを日本語化
        flatpickr.localize(Japanese);

        // 締切日フォームを初期化
        flatpickr('#due_date_field', {
          dateFormat: 'Y/m/d',
        });
      };

      return {
        init: () => {
          initDueDatePicker();
        },
      };
    })();

    (() => {
      CreateFormValidation.init();
      CreateForm.init();
    })();
  }
}
