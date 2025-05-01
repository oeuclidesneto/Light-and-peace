ActiveAdmin.register QuarterlyReport do
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

    panel "📅 Quarter Information", class: "activeadmin-panel" do
      f.inputs do
        f.input :quarter, as: :select, collection: ['Q1', 'Q2', 'Q3', 'Q4'], include_blank: false
        f.input :year, as: :select, collection: (2020..Date.today.year).to_a.reverse
      end
    end

    panel "💰 Financial Totals", class: "activeadmin-panel" do

      f.inputs do
        f.input :recyclables, label: "♻️ Recyclables ($)"
        f.input :canteen,     label: "🍽️ Canteen ($)"
        f.input :donations,   label: "🎁 Donations ($)"
      end
    end

    panel "📎 Upload PDF Report", class: "activeadmin-panel" do
      f.inputs do
        f.input :pdf, as: :file, hint: f.object.pdf.attached? ? link_to('📂 View current file', rails_blob_path(f.object.pdf, only_path: true)) : content_tag(:span, "No PDF uploaded yet")
      end
    end

    panel "🗒️ Internal Notes", class: "activeadmin-panel" do
      f.inputs do
        f.input :admin_notes, label: "Visible only to admins", input_html: { rows: 3 }
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
