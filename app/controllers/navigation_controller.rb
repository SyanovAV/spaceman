class NavigationController < ApplicationController

  def show
    @resource = Item.all
    @resources = @resource.tags.map{ |x| x.childrens.where.not(id: params[:id]) }.flatten.uniq

    return redirect_to action: 'index'
    render stream: true if stale? @resource
  end
end
#   def render(item_container)
#     return '' if item_container.empty?
#     content = menu_content(item_container)
#     content_tag(:ul, content, dom_attributes(item_container))
#   end
#
#   private
#
#   def dom_attributes(item_container)
#     dom_attrs = item_container.dom_attributes
#     cls = Array(dom_attrs[:class])
#     cls += Array(add_classes(item_container))
#
#     dom_attrs[:class] = cls.join(' ')
#     dom_attrs
#   end
#
#   def menu_content(item_container)
#     items = item_container.items.map do |item|
#       item_options = item.html_options.except(:link)
#       item_class = Array(item_options[:class])
#       item_class << 'menu-item'
#
#       link_options = { data: {} }
#       item_content = ''
#       if include_sub_navigation?(item)
#         item_class << 'dropdown'
#         item_class << 'dropdown-submenu' if item_container.level > 1
#         link_options[:class] = 'dropdown-toggle'
#         link_options[:data][:toggle] = 'dropdown'
#         item_content << render_sub_navigation_for(item)
#       end
#       if item_container.level == 1 && include_sub_navigation?(item)
#         item_content.prepend link_to((item.name+' '+content_tag(:span, '', class: 'caret')).html_safe, item.url, **link_options)
#       else
#         item_content.prepend link_to(item.name, item.url, **link_options)
#       end
#       item_options[:class] = item_class.join(' ')
#       content_tag(:li, item_content, item_options)
#     end
#     items.join("\n")
#   end
#
#   def add_classes(item_container)
#     classes = []
#     case item_container.level
#     when 1 then classes << 'nav navbar-nav'
#     else classes << 'dropdown-menu'
#     end
#     classes
#   end
# end
