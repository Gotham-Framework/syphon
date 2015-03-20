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

      get[data.name] = data.value

    # jQuery serialize don't take checkboxes not checked 
    # but we need it.
    $('input[type=checkbox]:not(:checked)').each ->

      name = $(this).attr('name')

      unless name of get

        get[name] = false

    # Same for radios
    $('input[type=radio]:not(:checked)').each ->

      name = $(this).attr('name')

      unless name of get 

        get[name] = false


    return get

  push: (selector, datas) ->
    ###
    for name, data of datas 

      $(selector).find('[name="' + name + '"]').each ->

        tag = $(this).prop('tagName').toLowerCase()

        if tag is 'textarea'

          $(this).val(data)

        else

          type = $(this).attr('type').toLowerCase()

          switch type
            when 'text' then $(this).val(data)
            when 'password' then $(this).val(data)
            when 'date' then $(this).val(data)




        #console.log $(this).prop('tagName')


    return datas
    ###
