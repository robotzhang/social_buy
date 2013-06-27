class ThemesController < ApplicationController
  def update
    theme = Theme.find(params[:id])
    theme.update_attributes(params[:theme])
  end

  def create
    theme = Theme.new(params[:theme])
    theme.save
  end
end
