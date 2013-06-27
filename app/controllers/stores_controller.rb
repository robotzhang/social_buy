#coding=utf-8
class StoresController < ApplicationController
  def index
    @stores = Store.page(params[:page]).per(16)
  end

  def show
    @store = Store.includes([:user]).find(params[:id])
  end

  def new
    link = params[:url]
    link = link.starts_with?('http') ? link : 'http://'+link
    if Link.find_by_url(link)
      return redirect_to(stores_user_path(current_user.uid), alert: {url: link, message: '店铺已经存在'})
    end
    @store = Store.new_with_url(link)
  end

  def create
    @store = Store.new(params[:store])
    @store.user_id = current_user.id
    @store.save ? redirect_to(stores_user_path(current_user.uid)) : render(:action => :new)
  end

  def edit
    @store = Store.find(params[:id])
    render :layout => false
  end

  def update
    @store = Store.find(params[:id])
    @store.businesses = Business.find_or_new_by_names(params[:businesses].split(" ")) if params[:businesses]
    respond_to do |format|
      if @store.update_attributes(params[:store])
        format.html { redirect_to(stores_user_path(current_user.uid)) }
        format.js
      else
        format.html { render(:action => :edit) }
        format.js
      end
    end
  end
end
