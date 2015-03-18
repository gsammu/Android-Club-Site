ActiveAdmin.register User do

  permit_params :username, :email, :password, :password_confirmation, :user_ids

  form do |f|
    f.semantic_errors *f.object.errors.keys
    
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

end
