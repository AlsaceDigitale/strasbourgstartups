#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

document.addEventListener "turbolinks:load", () ->
  computeBackgroundHeight = () ->
    window_height = $(window).height()

    if window_height > 230
      $("nav").css({height: window_height})
      $(".readnext").show()
    else
      $(".readnext").hide()

  if $("nav").hasClass("welcome") && !$("nav").hasClass("small")
    computeBackgroundHeight()

    $(window).on "resize", () ->
      computeBackgroundHeight()

 $(".readnext").on "click", (e) ->
    e.preventDefault()
    node = $(e.target)
    top = node.closest("nav").next().offset().top
    $("html, body").animate({scrollTop: top}, 800)
