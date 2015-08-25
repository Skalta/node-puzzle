# Build your comprehensive validation function here!
validator = require('data-validate');
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  # Very naive checks - change them!
  if data.id < 0 then return false

  if !/^[a-zA-Z\s]{1,63}$/.test data.name then return false

  if !/^\w+@[a-zA-Z_]+?\.[a-zA-Z]+$/.test data.email then return false
  if data.email.length > 255 then return false
  
  # if data.taxRate <= 0 && data.taxRate >= 1 then return false
  if 1<=data.taxRate then return false
  if 0>data.taxRate then return false
  
  if !/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.test data.favouriteColour then return false
  
  if (data.interests)
  	 if (data.interests.length>4)
  	 	 return false
	 else 
	 	for i in [0...data.interests.length-1]
  			if (data.interests[i].length>31)
  				 return false


  return true
