module Admin
  class ValidationsController < BaseController
    before_action :set_validation, only: [:show, :update]


    def index
      # @validations = User.where(["validated = ?", 0]).pluck(:id)
      @validations = User.all
    end


    def show
      @validation =  User.find(params[:id]) 
      @new_user = User.new()
    end

    def validate_user
      
      @user = User.find(params[:user][:id])
      
      respond_to do |format|
        if @user.update(validated: params[:user][:validated])
          format.html { redirect_to admin_user_validation_path, notice: 'Se valido el usuario.' }
          # format.json { render :show, status: :ok, location: @validation }
        else
          format.html { render "index" }
          # format.json { render json: @validation.errors, status: :unprocessable_entity }
        end
      end

    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_validation
        @validation = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def validation_params
        params[:validation]
      end
  end
end
