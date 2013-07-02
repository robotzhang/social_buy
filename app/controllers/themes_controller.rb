class ThemesController < ApplicationController
  load_and_authorize_resource

  def update
    @theme = Theme.find(params[:id])
    @theme.update_attributes(params[:theme])
    unless params[:theme][:bg_image].blank?
      return render layout: false, text: @theme.bg_image
    end
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
