ActiveAdmin.register Service do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :provider_id, :name, :cost, :details, :disclaimer
end
