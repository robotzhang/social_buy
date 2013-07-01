#coding=utf-8
class LinksController < ApplicationController
  def destroy
    link = Link.find(params[:id])
    flash[:alert] = link.destroy ? '链接删除成功' : '链接删除失败'
    @store = link.store
    params[:tab] = 'links'
    render "stores/update"
  end
end
