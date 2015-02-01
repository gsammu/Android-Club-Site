ActiveAdmin.register User do

  permit_params :username, :email, :password, :password_confirmation

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

end
