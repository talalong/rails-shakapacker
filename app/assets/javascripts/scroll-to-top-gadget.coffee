# Scroll-to-top based on:
# - http://foundation.zurb.com/forum/posts/5265#comment_5489
# - http://foundation.zurb.com/forum/posts/2325#comment_3443
# - http://foundation.zurb.com/forum/posts/2891-scroll-to-a-div-through-an-anchor-tag

$(document).on 'turbolinks:load', ->
	$gadget = $('#scroll-to-top-gadget')
	$gadget.hide()
	$(window).scroll ->
		if $(this).scrollTop() > 100 then $gadget.fadeIn() else $gadget.fadeOut()
		return

	$('#scroll-to-top-gadget').click ->
		$('html,body').animate scrollTop: 0, 300 # scroll to top, regardless of the anchor href
		off
