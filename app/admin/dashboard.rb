ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Users" do
          ul do
            User.all.order(created_at: :desc).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end
      column do
        panel "Tasks" do
          ul do
            TodoItem.all.order(created_at: :desc).map do |todo_item|
              li link_to("#{ todo_item.todo_list.title } :: #{ todo_item.title }", admin_todo_item_path(todo_item))
            end
          end
        end
      end
    end

  end # content
end
