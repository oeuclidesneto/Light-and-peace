  class QuarterlyReportsController < ApplicationController
    def index
      @reports = QuarterlyReport.order(year: :desc, quarter: :desc)
      @yearly_totals = @reports.group_by(&:year).transform_values do |reports|
        {
          recyclables: reports.sum(&:recyclables),
          canteen:     reports.sum(&:canteen),
          donations:   reports.sum(&:donations)
        }
      end
    end
    
    def show
    @report = QuarterlyReport.find_by!(slug: params[:slug])
    end
  end
