class InjectorsController < ApiController
  before_action :set_injector, only: [:show, :update, :destroy]

  # GET /injectors
  def index
    @injectors = Injector.all

    render json: @injectors
  end

  # GET /injectors/1
  def show
    render json: @injector
  end

  # POST /injectors
  def create
    @injector = Injector.new(injector_params)

    if @injector.save
      render json: @injector, status: :created, location: @injector
    else
      render json: @injector.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /injectors/1
  def update
    if @injector.update(injector_params)
      render json: @injector
    else
      render json: @injector.errors, status: :unprocessable_entity
    end
  end

  # DELETE /injectors/1
  def destroy
    @injector.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_injector
      @injector = Injector.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def injector_params
      params.require(:injector).permit(:first_name, :last_name, :email, :phone, :title, :provider_id)
    end
end
