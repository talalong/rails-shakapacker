window.mmog = {} # JavaScript namespace for our application
mmog.i18n = {} # Namespace for translatable texts

# DO NOT prepend 'ready', or the code will be executed TWICE!
$(document).on 'turbolinks:load', ->

	$('a[href="#"]').click -> no
	$('a[disabled]').click -> no

	$(document).foundation()

	# Workaround for Turbolinks issues
	# https://github.com/zurb/foundation-rails/issues/177
	# http://foundation.zurb.com/forum/posts/39089-zf62-how-to-get-sticky-to-work-with-turbolinks
	$(window).trigger('load.zf.sticky')

	# Now invoked locally in the assessment view.
	# Consult with Zoran if datepicker is needed globally
	#	$('.fdatepicker').fdatepicker weekStart: 1 # 1 = monday, 0 = sunday

	##
	# Generic Reveal Box Mechanism
	#
	# - Pack your reveal stuff under a base element with an ID that starts with 'reveal-'
	# - Any link on the page that points ot '#reveal-' will open that reveal
	#
	$('body').on 'click', 'a[href^="#reveal-"]', ->
		$(@hash).foundation('open')
		off

	##
	# Unobtrusive Checkbox Groups
	#
	# - Checkboxes residing in a container with the class .checkbox-group constitute a group
	# - At most one checkbox can be checked in a checkbox group
	#
	$('body').on 'change', '.checkbox-group input[type=checkbox]', ->
		return unless @checked
		$others = $(this).closest('.checkbox-group').find('input[type=checkbox]:checked').not(this)
		$others.prop('checked', off).trigger 'change'
		return

	##
	# Generic callout for too large file
	#
	# checks if file size is not too large for nginx default of 1MB
	#
	$('body').on 'change', '.reveal[id^="import"] input[type="file"]', (e) ->
		$context = $(e.target).closest('.reveal')
		tooLarge = e.target.files[0].size >= 1048576 # 1 MB
		$('input[type="submit"]', $context).prop 'disabled', tooLarge
		$('.file_warning', $context).toggle (tooLarge)
		return

# Workaround for Turbolinks issue
# https://github.com/foundation/foundation-rails/issues/290
$(document).on 'turbolinks:before-render', ->
	if (document.documentElement.classList.contains('is-reveal-open'))
		$('.reveal').foundation('close')

# activate confirmWithReveal
$(document).confirmWithReveal()
