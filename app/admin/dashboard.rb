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
        panel "Todo Lists" do
          ul do
            TodoList.all.order(deadline: :asc).map do |todo_list|
              h3 li link_to("#{ todo_list.title } :: #{ todo_list.deadline }", admin_todo_list_path(todo_list))

              ul do
                todo_list.todo_items.order(position: :asc).map do |todo_item|
                  li todo_item.title
                end
              end
              
            end
          end
        end
      end
    end

  end # content
end
