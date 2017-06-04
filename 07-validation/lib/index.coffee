  
# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  if data.id < 0 then return false

  if data.namelength > 255 && data.name is !string  then return false

  if !/\w+@\w+/.test data.email then return false

  if data.taxRate < 0 && data.taxRate > 1 && data.taxRate is !number then return false

  if !/\b[0-9A-Fa-f]{6}\b/g.test data.favouriteColour then return false

  for interest in data.interests && interest <= 4 && interest is string then return false   
  
  return true 
