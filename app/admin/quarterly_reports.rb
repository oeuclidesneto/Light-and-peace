ActiveAdmin.register QuarterlyReport do
  menu label: "📊 Quarterly Reports", priority: 2
  permit_params :quarter, :year, :recyclables, :canteen, :donations, :pdf

  index do
    selectable_column
    column :quarter
    column :year
    column("Recyclables ($)", &:recyclables)
    column("Canteen ($)", &:canteen)
    column("Donations") do |report|
      amount = report.donations
      badge_class = if amount >= 500
                      'status_tag ok'
                    elsif amount >= 100
                      'status_tag warning'
                    else
                      'status_tag error'
                    end
      status_tag "$#{amount}", class: badge_class
    end

    column "PDF" do |report|
      if report.pdf.attached?
        link_to "Download", rails_blob_path(report.pdf, disposition: "attachment", only_path: true)
      end
    end
    actions
  end

  filter :year
  filter :quarter

  form do |f|
    f.semantic_errors

    panel "📅 Quarter & Year", class: "activeadmin-panel" do
      f.inputs do
        f.input :quarter, as: :select, collection: ['Q1', 'Q2', 'Q3', 'Q4'], include_blank: "Select quarter"
        f.input :year, as: :select, collection: (2020..Date.today.year).to_a.reverse, include_blank: "Select year"
      end
    end

    panel "💰 Financial Totals", class: "activeadmin-panel" do
      f.inputs do
        f.input :recyclables, placeholder: "e.g. 102.50", hint: "Donations from cans, bottles, etc."
        f.input :canteen,     placeholder: "e.g. 250.00", hint: "Revenue from canteen sales"
        f.input :donations,   placeholder: "e.g. 400.00", hint: "One-time or regular direct donations"
      end
    end

    panel "📎 PDF Upload", class: "activeadmin-panel" do
      f.inputs do
        f.input :pdf, as: :file, hint: f.object.pdf.attached? ? link_to('View current file', rails_blob_path(f.object.pdf, only_path: true)) : content_tag(:span, "No file uploaded")
      end
    end

    panel "📝 Internal Notes", class: "activeadmin-panel" do
      f.inputs do
        f.input :admin_notes, input_html: { rows: 3, placeholder: "e.g. Mention if this was uploaded late, has pending adjustments..." }
      end
    end

    f.actions
  end

  csv do
    column :quarter
    column :year
    column :recyclables
    column :canteen
    column :donations
  end

  show do
    attributes_table do
      row :quarter
      row :year
      row("Recyclables") { |r| number_to_currency(r.recyclables) }
      row("Canteen")     { |r| number_to_currency(r.canteen) }
      row("Donations")   { |r| number_to_currency(r.donations) }
      row :pdf do |report|
        if report.pdf.attached?
          link_to "Download PDF", rails_blob_path(report.pdf, disposition: "attachment", only_path: true)
        else
          "No file uploaded"
        end
      end
    end
  end
end
