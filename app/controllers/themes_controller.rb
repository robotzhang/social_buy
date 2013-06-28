class ThemesController < ApplicationController
  def update
    @theme = Theme.find(params[:id])
    @theme.update_attributes(params[:theme])
    respond_to do |format|
      format.js { render "themes/save" }
    end
  end

  def create
    @theme = Theme.new(params[:theme])
    @theme.save
    respond_to do |format|
      format.js { render "themes/save" }
    end
  end
end
