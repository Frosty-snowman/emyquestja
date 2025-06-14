class QuestsController < ApplicationController
  before_action :set_quest, only: %i[show update destroy]

  def index
    @quests = Quest.all
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def create
    Quest.create!(quest_params)
    redirect_to root_path
  end

  def update
    @quest.update(quest_params)
    redirect_to root_path
  end

  def destroy
    quest = Quest.find(params[:id])
    quest.destroy
    redirect_to root_path
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:name, :status, :completed)
  end
end