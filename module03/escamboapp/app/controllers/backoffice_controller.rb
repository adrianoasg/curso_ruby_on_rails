class BackofficeController < ApplicationController
    before_action :authenticate_admin!
    layout "backoffice"

    def pundit_user
        current_admin # current_ user to Pundit
      end
end