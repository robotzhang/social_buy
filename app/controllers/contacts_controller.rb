#coding=utf-8
class ContactsController < ApplicationController
  def destroy
    contact = Contact.find(params[:id])
    flash[:alert] = contact.destroy ? '联系方式删除成功' : '联系方式删除失败'
    @user = contact.user
    render "users/update"
  end
end
