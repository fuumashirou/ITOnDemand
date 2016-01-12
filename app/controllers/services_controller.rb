class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  before_action :check_validated_user

  def index
    @services = Service.all
#     @suscriptions = Suscription.where(["user_id = ?", current_user.id]).pluck(:id)
#     @services = Service.where(:id => 'Entrevista')
# raise
#       @survey_data = Survey.where(:survey_type => 'Entrevista').order('random()').first
#     unless @survey_data.nil?
#       redirect_to show_job_interview_survey_path(data_id: @survey_data.id)
#     end
  end

  def show
    @service =  Service.find(params[:id]) 
    @suscription = Suscription.where(["user_id = ? AND service_id = ? ", current_user.id, params[:id]]).pluck(:id)
    @new_suscription = Suscription.new
  end

  def suscribe
    @suscription = Suscription.new(service_id: params[:suscription][:service_id], user_id: params[:suscription][:user_id])
    if @suscription.save
      redirect_to service_path(params[:suscription][:service_id]), notice: "Se ha suscrito a este servicio."
    else
      flash.now[:alert] = "Se produjo un error , intente de nuevo"
      render "show"
    end
  end

  def unsuscribe
    # service = Suscription.where(["id = ?",]).pluck(:service_id)
    suscription = Suscription.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to service_path(params[:service_id]), notice: 'Se ha desuscrito del servicio' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def check_validated_user
      if(!current_user.validated)
        redirect_to controller: "restricted_access", action:"restricted_user"
      end
    end
end
