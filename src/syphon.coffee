##
# Syphon Class
#
# Easily serialize forms into a JSON representation
# 
# @author Ges Jeremie <http://www.gesjeremie.fr>
# @copyright Copyright (c) 2014, Ges Jeremie
# @since Version 1.0
#
##
class @Syphon

  ##
  # Constructor
  #
  # Set basic variables
  # 
  ##
  constructor: ->

    # We will stock all datas to exclude here
    @_excluded = []

  ##
  # Get
  #
  # Fetch datas from a form
  #
  # @param [String] Jquery selector
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

    # Reduce the array with excluded datas
    get = @_reduce(get)

    return get

  ##
  # Exclude
  #
  # Exclude some datas fetched by get
  #
  # @param [Array/Arguments] Datas to exclude from the result
  ##
  exclude: () ->

    exclude = arguments

    if arguments.length > 0

      if @_isArray(arguments[0])

        exclude = arguments[0]

      # Add datas
      for data in exclude

        @_excluded.push(data)

    return @

  ##
  # Reduce
  #
  # Reduce the object given with the excluded datas
  # 
  # @access private
  # @param [Object] Datas to exclude from the result
  ##
  _reduce: (datas) ->

    if @_excluded.length is 0
      return datas

    reduced = {}

    for index, data of datas

      unless index in @_excluded

        reduced[index] = data

    # Reset exclude
    @_excluded = []

    return reduced

  ##
  # IsArray
  #
  # Check if the value given is an array. 
  # 
  # @url https://coffeescript-cookbook.github.io/chapters/arrays/check-type-is-array
  # @param [Mixed] Value to check
  ##
  _isArray: (value) ->
    value and
         typeof value is 'object' and
         value instanceof Array and
         typeof value.length is 'number' and
         typeof value.splice is 'function' and
         not ( value.propertyIsEnumerable 'length' )
