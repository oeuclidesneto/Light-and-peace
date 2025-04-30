  class QuarterlyReportsController < ApplicationController
    def index
      @reports = QuarterlyReport.order(year: :desc, quarter: :desc)
    end
    def show
    @report = QuarterlyReport.find_by!(slug: params[:slug])
    end
  end
