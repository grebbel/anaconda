# Renders Breadcrumbs using Twitter Bootstrap markup.
# http://twitter.github.com/bootstrap/components.html#breadcrumbs
class BootstrapBreadcrumbRenderer < SimpleNavigation::Renderer::Base

  def render(item_container)
    content_tag(:ul, a_tags(item_container).join(join_with), {:id => item_container.dom_id, :class => :breadcrumb})
  end

  protected
  
  def a_tags(item_container)
    item_container.items.inject([]) do |list, item|
      if item.selected?
        list << content_tag(:li, tag_for(item)) if item.selected?
        if include_sub_navigation?(item)
          list.concat a_tags(item.sub_navigation)
        end
      end
      list
    end
  end

  def join_with
    @join_with ||= content_tag(:span, '/', :class => :divider)# options[:join_with] || " "
  end

  def suppress_link?(item)
    super || (options[:static_leaf] && item.active_leaf_class)
  end

  # Extracts the options relevant for the generated link
  #
  def link_options_for(item)
    if options[:allow_classes_and_ids]
      opts = super
      opts[:id] = "breadcrumb_#{opts[:id]}" if opts[:id]
      opts
    else
      {:method => item.method}.merge(item.html_options.except(:class,:id))
    end
  end
end
