# frozen_string_literal: true

# NOTE: タスク一覧画面の検索フォームのロジックをまとめたクラス
module Tasks
  class SearchFinder
    def self.call(...)
      new(...).call
    end

    def initialize(relation = Task.all, **params)
      @relation = relation
      @params = params
    end

    def call
      @relation = title_filter
      @relation = summary_filter
      @relation = due_date_filter
      @relation = priority_filter

      @relation
    end

    private

    attr_reader :relation, :params

    #===================
    # search_conditions
    #===================
    def title_filter
      return relation if params[:title].blank?

      relation.where("title LIKE ?", "%#{params[:title]}%")
    end

    def summary_filter
      return relation if params[:summary].blank?

      relation.where("summary LIKE ?", "%#{params[:summary]}%")
    end

    def due_date_filter
      start_date = string_to_date(params.dig(:due_date, :start_date))
      end_date = string_to_date(params.dig(:due_date, :end_date))

      return relation if start_date.nil? && end_date.nil?

      relation.where(due_date: start_date..end_date)
    end

    def priority_filter
      return relation if params[:priority].blank?

      case params[:priority]
      when "low"
        relation.where(priority: "low")
      when "medium"
        relation.where(priority: "medium")
      when "high"
        relation.where(priority: "high")
      else
        relation
      end
    end

    #=========
    # helpers
    #=========
    # 日付文字列をDateオブジェクトに変換
    def string_to_date(date_string)
      Date.parse(date_string)
    rescue StandardError
      nil
    end
  end
end
