ActiveAdmin.register Reservation do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :injector_id, :user_id, :provider_id, :location, :date_time, :services, :party_size

end
