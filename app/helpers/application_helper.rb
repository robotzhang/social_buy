module ApplicationHelper
  def nav_active(controller=nil, action=nil)
    arr = controller.is_a?(Array) ? controller : [controller]
    return ' class=active' if arr.include?(params[:controller]) && (action == params[:action] || action.blank?)
    return ' class=active' if  action == 'index' && params[:controller] == 'application'
    ''
  end

  def weibo_url(uid)
    'http://weibo.com/u/'+uid
  end
end
