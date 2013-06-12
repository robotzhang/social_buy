class StoresController < ApplicationController
  def new
    @store = Store.new
    @store.links = [Link.new] if @store.links.blank?
    @store.businesses = [Business.new] if @store.businesses.blank?
  end

  def create
    @store = Store.new(params[:store])
    @store.save
    render :action => :new
  end
end
