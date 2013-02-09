###!
Test suite for jQuery Smallipop
###

$('.smallipop').smallipop()

test 'Smallipop exists', ->
  smallipop = $ '.smallipop-instance'

  # Test existance of rondell
  equal smallipop.length, 1, 'Smallipop instance should exist'

  equal smallipop.attr('id'), 'smallipop1', 'First smallipop should have id 1'


asyncTest 'Show and hide tooltip by interaction', ->
  smallipop = $ '.smallipop-instance'
  trigger = $ '.smallipop:first'

  # Check if lightbox is created and shown by calling the api
  trigger.trigger 'mouseenter'

  # Try closing the smallipop by clicking the document
  setTimeout( ->
    ok smallipop.is(':visible'), 'Smallipop should be visible'

    $(document).trigger 'click'

    setTimeout( ->
      equal smallipop.css('display'), 'none', 'Smallipop should now be hidden'

      # Resume testrunner
      start()
    , 300)
  , 200)


asyncTest 'Show and hide tooltip with api', ->
  smallipop = $ '.smallipop-instance'
  trigger = $ '.smallipop:first'

  # Check if lightbox is created and shown by calling the api
  trigger.smallipop 'show'

  # Try closing the smallipop by clicking the document
  setTimeout( ->
    ok smallipop.is(':visible'), 'Smallipop should be visible'

    trigger.smallipop 'hide'

    setTimeout( ->
      equal smallipop.css('display'), 'none', 'Smallipop should now be hidden'

      # Resume testrunner
      start()
    , 300)
  , 200)


asyncTest 'Change tooltip content with api', ->
  smallipop = $ '.smallipop-instance'
  trigger = $ '.smallipop:first'

  oldHint = trigger.data('smallipop').hint
  newHint = 'some fancy new hint'

  notEqual oldHint, newHint

  # Update the smallipop hint
  trigger.smallipop 'update', newHint

  setTimeout( ->
    equal $('.sipContent', smallipop).text(), newHint, 'Hint should have changed'

    # Resume testrunner
    start()
  , 200)