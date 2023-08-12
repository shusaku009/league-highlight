class Admin::TeamsController < Admin::BaseController
  def index
    @q = Team.ransack(params[:q])
    @pagy, @teams = pagy(@q.result(distinct: true), items: 20)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path, success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :admin_new
    end
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to admin_teams_path, success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to admin_teams_url, error: "チーム「#{@team.name}」を削除しました。"
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
