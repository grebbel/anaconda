module ApplicationHelper
  
  def page_title
    t('application.name')
  end
  
  def cat(key, opts = {})
    opts = { :default => t("#{controller.controller_name}.#{key}", opts) }.merge(opts)
    text = t("#{controller.controller_name}.#{controller.action_name}.#{key}", opts)
  end

  def tt(key, opts = {})
    t("task_descriptions.#{current_task.description}.#{key}", opts) if current_task
  end

  def current_task
    instance_variable_get("@task")
  end
  
  def add_association(opts, &initialize_new_object)
    # Not the most brilliant code, but it works! ;-)    
    raise ArgumentError.new(':f parameter required') unless opts[:f]
    raise ArgumentError.new(':association parameter required') unless opts[:association]
    association = opts[:association]
    f = opts[:f]
    add_label = opts[:add_label] || t('add')
    
    # title, f, association
    new_object = f.object.class.reflect_on_association(association).klass.new
    initialize_new_object.call(new_object) if block_given?
    index_marker = "_new_#{association}_"
    template = f.fields_for(association, new_object, :child_index => index_marker) do |builder|
      render("#{association.to_s.singularize}_association", :f => builder, :is_template => true)
    end
    raw <<-eos 
      <div class='template' style='display: none'>
        #{template}
      </div>
      <input type="button" class="add btn" data-association="#{association}" data-index-marker="#{index_marker}" value="#{add_label}"/>
    eos
  end
  
  def task_summary(task)
    t("task_descriptions.#{task.description}.summary")
  end
  
  def task_detail(task)
    t("task_descriptions.#{task.description}.detail")
  end
  
  def popover_content(model)
    model_name = model.class.name.downcase
    variables = {  model_name.to_sym => model }
    markup = render "shared/#{model_name}_popover_content", variables
    raw markup
  end
  
  def assignee_button(task, options = { })
    options = { :task => task, :refresh_page => false }.merge options
    render 'shared/assignee_button', options
  end

  def assign_to_user_link(opts)
    render 'shared/assign_to_user', opts
  end
  
  def link_to_task(task)
    link_to task_summary(task), task
  end
  
  def link_to_first_page
    u = URI.parse(request.url)
    u.query = 'page=1'
    link_to t('go_to_first_page'), u.to_s
  end
  
  def update_interval
    instance_variable_get('@update_interval') || 10 * 1000
  end
  
  def paginator(collection)
    markup = will_paginate collection, :renderer => BootstrapPagination::Rails, :previous_label => '<i class="icon-step-backward"></i>', :next_label => '<i class="icon-step-forward"></i>'
    markup = markup.gsub(/&amp;partial=\w+/, '') if markup
    raw markup
  end
  
  def delete_link_to(object, options = { })
    link_to cat("delete.caption"), object, :method => :delete, :confirm => cat("delete.confirm"), :class => "btn #{options[:class]}"
  end
  
  def autoupdate_partial(partial, options = { })
    variables = { :partial => partial, :url => request.url, :immediate => true }.merge(options)
    render 'shared/autoupdate_partial', variables
  end
  
  def collection
    instance_variable_get("@#{controller.controller_name}")
  end
  
  def heading
    t("#{controller.controller_name}.#{controller.action_name}.title")
  end
  
  def time_ago(time)
    "#{time_ago_in_words(time)} #{t('ago')}"
  end

  def due_in(time)
    if (Time.now < time)
      "#{t('in')} #{distance_of_time_in_words(Time.now, time)}"
    else 
      time_ago(time)
    end
  end
  
  def decimal(value, precision = 2)
    number_with_precision(value, :precision => precision)
  end
  
  def show_breadcrumbs
    controller.controller_name != 'registrations' && (controller.action_name == 'edit' || controller.action_name == 'show')
  end
  
  def analyses_data(analyses)
    # We set an instance variable to get hold of it in the RABL template
    # TODO: Find out how to get pass local variables to RABL from a 'render' call.
    @analyses = analyses
    render :template => 'analyses/index.json.rabl'#, :locals => { :analyses => analyses }
  end

  def amplification_graph(analyses, options = { })
    options = { :aspect_ratio => (4.0/2.0) }.merge(options)
    options[:analyses] = analyses
    render 'shared/amplification_graph', options
  end

  def amplification_data(analysis, section_size = 15)
    section_count = analysis.amplifications.count / section_size
    section_count += 1 if analysis.amplifications.count % section_size > 0
    amplification_sections = [ ]
    0...section_count.times do |index|
      index = index * section_size
      amplification_sections << analysis.amplifications[index..(index + section_size - 1)]
    end
    render 'shared/amplification_data', :analysis => analysis, :amplification_sections => amplification_sections
  end

  def analyses_results(analyses)
    render 'shared/analyses_results', :analyses => analyses
  end
  
end
