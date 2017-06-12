ActiveAdmin.register Provider do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :license, :email, :phone, :street, :city, :state, :zip

end
