# ===================================================================================================================
# Dirty-checking and warn about unsaved changes
# Adapted from https://stackoverflow.com/a/32617345/4305171

# Message displayed to user. Depending on browser and if it is a turbolink,
# regular link or user-driven navigation this may or may not display.

# Selector to identify forms for inclusion in dirty-checking
FORM = 'form[method=post]'

#== Logic:
#
# Flag all or some forms as clean
setClean = ($selector = $(FORM)) -> $selector.removeClass 'dirty'
# Flag all or some forms as dirty
setDirty = ($selector = $(FORM)) -> $selector.addClass 'dirty'
# Query if we have any dirty forms on the page
anyDirty = -> $("#{FORM}.dirty").length > 0

#== Public Interface:
#
mmog.dirtiness = any: anyDirty

## Default state
#setClean()

# Reset dirty flag when page loads (with turbolinks we only need turbolinks:load)
#$(document).on 'load', -> setClean()
$(document).on 'turbolinks:load', -> setClean()

# Confirm with user if they try to go elsewhere
$(window).bind 'beforeunload', (e) ->
	# Why set e.returnValue ? => see https://developer.mozilla.org/en-US/docs/Web/Events/beforeunload#Examples
	return e.returnValue = gon.t.dirtyExitWarning if anyDirty()

# If page about to change via Turbolinks also confirm with user
$(document).on 'turbolinks:before-visit', (e) ->
	#e.preventDefault() if anyDirty() && !confirm gon.t.dirtyExitWarning
	return no if anyDirty() and not confirm gon.t.dirtyExitWarning

# Mark the page as having dirty content
$(document).on 'input', 'form[method=post] :input', ->
	setDirty $(this).closest(FORM)
	return

# The user submitted the form (to save) so no need to ask them.
$(document).on 'submit', FORM, ->
	setClean $(this).closest(FORM)
	return

# The user has reset the form so no need to ask them.
$(document).on 'reset', FORM, ->
	setClean $(this).closest(FORM)
	return
