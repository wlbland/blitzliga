ActiveAdmin.register Fixture do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :time, :venue_id, :non_league, :season_id, :void
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


  form do |f|
    f.inputs "Fixture" do
      f.input :time
      f.input :venue
      f.input :non_league
      f.input :season
      f.input :void
    end
    f.actions
  end

end
