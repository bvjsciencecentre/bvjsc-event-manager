module Admin
  class ContactsController < ApplicationController
    before_action :set_conference
    before_action :set_conference
    before_action :set_contact, only: [:edit, :update]

    # GET /:conference/contact/edit
    def edit
    end

    # PATCH/PUT /:conference/contact
    def update
      if @contact.update(contact_params)
        redirect_to edit_admin_conference_contact_path, notice: 'Contact details were successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @conference.contact
    end

    def set_conference
      @conference = Conference.find_by(short_title: params[:conference_id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      # params.require(:contact).permit(:social_tag, :email, :facebook, :googleplus, :twitter, :instagram, :public)
      params[:contact]
    end
  end
end
