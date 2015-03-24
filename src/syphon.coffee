##
# Syphon Class
#
# Easily serialize forms into a JSON representation
# 
# @author Ges Jeremie <http://www.gesjeremie.fr>
# @copyright Copyright (c) 2014, Ges Jeremie
# @since Version 1.1
#
##
class @Syphon

  ##
  # Constructor
  #
  # 
  #
  ##
  constructor: ->


  ##
  # Get
  #
  # Fetch datas from a from (selector jquery)
  #
  ##
  get: (selector) ->

    # Serialize datas with array way
    serialized = $(selector).serializeArray()


    # Init object
    get = {}

    # Loop all datas serialized and create an object
    for data in serialized

      # Already exists, we need to "push" the value
      if data.name of get

        if typeof get[data.name] is 'string'

          get[data.name] = [get[data.name], data.value]
        else
          get[data.name].push(data.value)
      else
        get[data.name] = data.value

    # jQuery serialize don't take checkboxes not checked 
    # but we need it.
    $(selector).find('input[type=checkbox]:not(:checked)').each ->

      name = $(this).attr('name')

      unless name of get

        get[name] = false

    # Same for radios
    $(selector).find('input[type=radio]:not(:checked)').each ->

      name = $(this).attr('name')

      unless name of get 

        get[name] = false

    # Same for multiple select
    $(selector).find("select[multiple]:not(:checked)").each ->

      name = $(this).attr('name')

      unless name of get 

        get[name] = false

    return get