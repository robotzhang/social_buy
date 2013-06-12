class StoresController < ApplicationController
  def index
    @stores = Store.page(params[:page]).per(16)
  end

  def show
    @store = Store.find(params[:id])
  end

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
