class GigsController < ProtectedController
  before_action :set_gig, only: [:show, :update, :destroy]

  # GET /gigs
  def index
    @gigs = Gig.all

    render json: @gigs
  end

  # GET /gigs/1
  def show
    render json: @gig
  end

  # POST /gigs
  def create
    @gig = current_user.gigs.build(gig_params)

    if @gig.save
      render json: @gig, status: :created, location: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gigs/1
  def update
    if @gig.update(gig_params)
      render json: @gig
    else
      render json: @gig.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gigs/1
  def destroy
    @gig.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gig
      @gig = current_user.gigs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gig_params
      params.require(:gig).permit(:title, :date, :time, :texttime, :description)
    end
end
