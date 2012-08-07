class DataManagementController < ApplicationController
  
  def destroy_all_requests
    count = Request.destroy_all.count
    flash[:notice] = t('data_management.delete_requests.notice', :count => count)
    redirect_to_index
  end
  
end