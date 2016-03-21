# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev, data)->
	console.log data
	$("#comment-box").append("<p><strong>Commenter: </strong> #{data.user.email}</p><p><strong>Comment: </strong> #{data.body}</p>")
$(document).on "ajax:error", "form#comments-form", (ev, data)->
	console.log data
