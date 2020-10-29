# $(window).load ->

#   settings =
#     align:
#       y: "bottom"
#     offset:
#       top: -15
#     handlers:
#       mouseenter: 'show'
#       mouseleave: 'hide'

#   data = [
#     { x: 100, y: 100, text: "large format machining b" }
#   ]
#   console.log data
#   $('img.taggd').each ->
#     $(this).taggd settings
#     $(this).taggd 'items', data
#   # $('img#frostis-lab').taggd settings
#   # $('img#frostis-lab').taggd 'items', data

data = [
  {x: 27, y: 28, title: 'Large Format Machining', body: ''}
  {x: 39, y: 34, title: 'Molding and Casting', body: ''}
  {x: 63, y: 39, title: 'Laser Cutting & Engraving', body: ''}
  {x: 9, y: 46, title: 'Electronics Production', body: ''}
  {x: 44, y: 78, title: 'Programming and Design', body: ''}
  {x: 66, y: 77, title: '3D Scanning and Printing', body: ''}
  {x: 77, y: 37, title: 'Video Conferencing', body: ''}
  {x: 89, y: 60, title: 'Vinyl Cutting', body: ''}
  {x: 88, y: 84, title: 'Precision Milling', body: ''}
]

jQuery ->
  $('#frostis-lab').click (e) ->
    parentOffset = $(this).offset()

    relX = parseInt((e.pageX - parentOffset.left) / $(this).width() * 100)
    relY = parseInt((e.pageY - parentOffset.top) / $(this).height() * 100)

  for item in data
    $('#frostis-lab').append("<span class='note has-tip tip-top' title='#{item.title}' style='position: absolute; top: #{item.y}%; left: #{item.x}%'><span class='dot'>")

