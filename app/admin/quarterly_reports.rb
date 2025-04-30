ActiveAdmin.register QuarterlyReport do
  permit_params :quarter, :year, :recyclables, :canteen, :donations, :pdf

  index do
    selectable_column
    column :quarter
    column :year
    column("Recyclables ($)", &:recyclables)
    column("Canteen ($)", &:canteen)
    column("Donations ($)", &:donations)
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

    f.inputs "Quarter Information" do
      f.input :quarter, as: :select, collection: ['Q1', 'Q2', 'Q3', 'Q4'], include_blank: false
      f.input :year, as: :select, collection: (2020..Date.today.year).to_a.reverse
    end

    f.inputs "Financial Totals" do
      f.input :recyclables
      f.input :canteen
      f.input :donations
    end

    f.inputs "Upload Report PDF" do
      f.input :pdf, as: :file, hint: f.object.pdf.attached? ? link_to('Current file', rails_blob_path(f.object.pdf, only_path: true)) : content_tag(:span, "No file uploaded")
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
