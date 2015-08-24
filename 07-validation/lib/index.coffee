# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  # Very naive checks - change them!
  if data.id < 0 then return false

  if data.name != 'John Doe' then return false

  #if !/\w+@\w+/.test data.email then return false
  
  if data.taxRate <= 0 and >= 1 then return false
  
 # if data.interest isnt 'cycling' and data.interests.length > 4 then return false

  return true
