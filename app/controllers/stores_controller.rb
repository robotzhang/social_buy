#coding=utf-8
class StoresController < ApplicationController
  def index
    @stores = Store.page(params[:page]).per(16)
  end

  def show
    @store = Store.includes([:user]).find(params[:id])
  end

  def new
    @store = Store.new
    page, link = Link.parser(params[:url])
    @store.name = link.name
    @store.description = Store.parser_description(page)
    @store.links << link
    @store.businesses = [Business.new] if @store.businesses.blank?
  end

  def create
    @store = Store.new(params[:store])
    @store.user_id = current_user.id
    @store.save
    render :action => :new
  end

  def edit
    @store = Store.find(params[:id])
    render :template => "stores/new"
  end

  def update
    @store = Store.find(params[:id])
    @store.update_attributes(params[:store]) ? redirect_to(:action => :index) : render(:action => :edit)
  end
end
