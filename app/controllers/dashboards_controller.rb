class DashboardsController < ApplicationController
  before_action :set_user, only: [:index, :create, :update_positions]
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  def index
    @dashboards = @user.dashboards
  end

  # GET /dashboards/1
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  def create
    @dashboard = @user.dashboards.build(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # PATCH /dashboards/update-positions
  # dashboards_order = ["1", "2", "3", "4", "5"]
  def update_positions
    new_dashboard_positions = params[:dashboards_order]&.map(&:to_i)
    user_dashboards = @user.dashboards.where(id: new_dashboard_positions)

    return head :not_found if user_dashboards.none?

    data_to_import = user_dashboards.map do |dashboard|
      dashboard.position = new_dashboard_positions.index(dashboard.id) + 1
      dashboard
    end
    
    Dashboard.import data_to_import, on_duplicate_key_update: [:position]

    respond_to do |format|
      format.json { head :ok }
    end
  end

  # DELETE /dashboards/1
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = current_user.dashboards.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Only allow a list of trusted parameters through.
    def dashboard_params
      params.require(:dashboard).permit(:title, :content)
    end
end
