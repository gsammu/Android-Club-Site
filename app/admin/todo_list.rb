ActiveAdmin.register TodoList do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :deadline,
                todo_items_attributes: [:id, :title, :description,
                  :_destroy, :position]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  show do

    panel "The List" do
      h3 todo_list.title
      h4 todo_list.deadline
    end

    panel "The Items" do
      table_for todo_list.todo_items do
        column :title
        column :description
      end
    end

  end

  form do |f|
    f.inputs 'Todo List' do
      f.input :title
      f.input :deadline, as: :datepicker, datepicker_options: { min_date: Time.now.to_date }
    end
    f.inputs 'Assignees' do
      f.input :users, :as => :check_boxes, :input_html => { :checked => 'checked' }
    end
    #f.has_many :users, heading: 'Assignees', allow_destroy: false, new_record: false do |a|
    #    a.input :username, :as => :select, :collection => User.all, :multiple => true,
    #     :label_method => :username, :value_method => :id, :prompt => 'Select One' 
    #end
    f.inputs do
      f.has_many :todo_items, sortable: :position, sortable_start: 1, allow_destroy: true, new_record: true do |item|
        item.input :title
        item.input :description
      end
    end

    f.actions
  end

end
