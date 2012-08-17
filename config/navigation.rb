# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'active'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #
    
    primary.item :work, t('navigation.work'), root_path do |secondary|
      secondary.dom_class = 'nav nav-list'
      secondary.item :work_heading, t('navigation.work'), :class => 'nav-header'
      secondary.item :dashboard, t('navigation.dashboard'), root_path
      secondary.item :tasks, t('navigation.tasks'), tasks_path, :highlights_on => /tasks/ do |task|
        task.item :task_show, cat("breadcrumb_title", :task => task_summary(@task), :request => @task.request.description), task_path(@task) if @task
      end
      secondary.item :analyses, t('navigation.analyses'), analyses_path, :highlights_on => /^\/analyses/ do |analysis|
        analysis.item :analysis_show, cat('breadcrumb_title', :request => @analysis.request.description, :target => @analysis.target.name), analysis_path(@analysis) if @analysis && @analysis.id?
      end
      secondary.item :requests, t('navigation.requests'), requests_path, :highlights_on => /^\/requests/ do |request|
        request.item :request_show, @request.description, request_path(@request) if @request && @request.id?
      end
    end

    primary.item :admin, t('navigation.admin'), admin_path do |secondary|
      secondary.dom_class = 'nav nav-list'
      secondary.item :admin_heading, t('navigation.admin'), :class => 'nav-header'
      secondary.item :admin_home, t('navigation.home'), admin_path
      secondary.item :reference_data, t('navigation.reference_data'), :class => 'nav-header'
      secondary.item :tags, t('navigation.tags'), tags_path, :highlights_on => /tags/ do |tag|
        tag.item :tag_edit, @tag.name, edit_tag_path(@tag) if @tag && @tag.id?
      end
      secondary.item :targets, t('navigation.targets'), targets_path, :highlights_on => /targets/ do |target|
        target.item :target_edit, @target.name, edit_target_path(@target) if @target && @target.id?
      end
      secondary.item :colors, t('navigation.colors'), colors_path
      secondary.item :assays, t('navigation.assays'), assays_path, :highlights_on => /assays/ do |assay|
        assay.item :assay_edit, @assay.name, edit_assay_path(@assay) if @assay && @assay.id?
      end
      secondary.item :import_export, t('navigation.import_export'), :class => 'nav-header'
      secondary.item :import_definitions, t('navigation.import_definitions'), import_definitions_path, :highlights_on => /import_definitions/ do |import_definition|
        import_definition.item :import_definition_edit, @import_definition.name, edit_import_definition_path(@import_definition) if @import_definition && @import_definition.id?
      end
      secondary.item :test_data, t('navigation.test_data'), :class => 'nav-header'
      secondary.item :request_generator, t('navigation.request_generators'), new_request_generator_path
      secondary.item :amplification_generator, t('navigation.amplification_generators'), new_amplification_generator_path
      secondary.item :manage_data, t('navigation.data_management'), data_management_path
    end

    # Add an item which has a sub navigation (same params, but with block)
    #primary.item :key_2, 'name', url, options do |sub_nav|
    #  # Add an item to the sub navigation (same params again)
    #  sub_nav.item :key_2_1, 'name', url, options
    #end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    #primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'
    primary.dom_class = 'nav pull-left'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
