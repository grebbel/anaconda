jQuery ->
    $('.btn-group.assignee a.assign-to-user').live 'click', (event) ->
      Anaconda.api.sendJson($(this).attr('method'), $(this).attr('href'), { userId: $(this).data('userId') }).success (fragment) =>
        fragment = $(fragment)
        $('a.assignee', fragment).addClass('btn-inverse')
        # For some reason we can't access the .btn-group.assignee element through $.parent() here, 
        # so we traverse the parent elements manually.
        container = $(this).parent().parent().parent()
        $(container).html(fragment.html())
        $('.autoupdate').trigger(Anaconda.CONTENT_UPDATED_EVENT)
        window.location.reload() if $(this).data('refreshPage')          
      event.preventDefault()
