ActiveAdmin.register_page "Dashboard" do
  menu priority: 0, label: "🏠 Dashboard"

  content title: "Welcome to Light & Peace Admin" do
    columns do
      column do
        panel "📊 Donations This Year" do
          year = Date.today.year
          total = QuarterlyReport.where(year: year).sum(:donations)
          div do
            span "Total Donations in #{year}: "
            strong number_to_currency(total)
          end
        end
      end

      column do
        panel "📝 Latest Quarterly Report" do
          latest = QuarterlyReport.order(year: :desc, quarter: :desc).first
          if latest
            ul do
              li "Quarter: #{latest.quarter}"
              li "Year: #{latest.year}"
              li "Donations: #{number_to_currency(latest.donations)}"
              li link_to "View Report", admin_quarterly_report_path(latest)
            end
          else
            span "No reports yet."
          end
        end
      end
    end

    columns do
      column do
        panel "⚡ Quick Actions" do
          ul do
            li link_to "➕ New Quarterly Report", new_admin_quarterly_report_path
            li link_to "📋 View All Reports", admin_quarterly_reports_path
            li link_to "📅 View Centre Events", admin_centre_events_path
          end
        end
      end
    end
  end
end
