# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#destination_postcode_tosend").jpostal({
    postcode : [ "#destination_postcode_tosend" ],
    address  : {
                  "#destination_address_tosend" : "%3%4%5%6%7"
                }
  })