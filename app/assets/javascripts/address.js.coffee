jQuery ->
  $.address.change ->
    $('.autoupdate').autoupdate({ immediate: true })