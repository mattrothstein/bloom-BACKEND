class EntitiesController < ApiController
  before_action :set_entity, only: [:show, :update, :destroy]

  # GET /entities
  def index
    @entities = Entity.all

    render json: @entities
  end

  # GET /entities/1
  def show
    render json: @entity
  end

  # POST /entities
  def create
    @entity = Entity.new(entity_params)

    if @entity.save
      render json: @entity, status: :created, location: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entities/1
  def update
    if @entity.update(entity_params)
      render json: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entities/1
  def destroy
    @entity.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entity_params
      params.require(:entity).permit(:name, :details)
    end
end
