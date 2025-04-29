ActiveAdmin.register QuarterlyReport do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :quarter, :year, :recyclables, :canteen, :donations
  #
  # or
  #
  # permit_params do
  #   permitted = [:quarter, :year, :recyclables, :canteen, :donations]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #


  ActiveAdmin.register QuarterlyReport do
    permit_params :quarter, :year, :pdf, :recyclables, :canteen, :donations

    form do |f|
      f.inputs 'Quarterly Report Details' do
        f.input :quarter, as: :select, collection: ['Q1', 'Q2', 'Q3', 'Q4'], include_blank: false
        f.input :year, as: :select, collection: (2020..Date.today.year).to_a.reverse
        f.input :recyclables
        f.input :canteen
        f.input :donations
        f.input :pdf, as: :file
      end
      f.actions
    end

    index do
      selectable_column
      id_column
      column :quarter
      column :year
      column :recyclables
      column :canteen
      column :donations
      column :pdf do |report|
        link_to 'Download', rails_blob_path(report.pdf, disposition: "attachment", only_path: true) if report.pdf.attached?
      end
      actions
    end

    show do
      attributes_table do
        row :quarter
        row :year
        row :recyclables
        row :canteen
        row :donations
        row :pdf do |report|
          link_to 'Download PDF', rails_blob_path(report.pdf, disposition: "attachment", only_path: true) if report.pdf.attached?
        end
      end
    end
  end
end
