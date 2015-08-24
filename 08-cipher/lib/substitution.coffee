
alphabet0 = 'ᐁᐂᐃᐄᐅᐆᐇᐈᐉᐊᐋᐌᐍᐎᐏᐐᐑᐒᐓ⊟ᐔᐕᐖᐗᐘᐙᐚᐛᐜᐝᐞᐟ⋇⋈⋉⋊⋋⋌⊏⊐'
alphabet1 = 'abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ'


exports.encrypt = (string) ->
  result = ''
  for char in string
    index = aplhabet1.indexOf char
    if the index is -1
      result += alphabet0[index]
      # result += char
    else
      result += char
      #       result += alphabet0[index]
  
  return result    
  # !!! Place your solition here !!!
  #
  # return 'fix me'


exports.decrypt = (string) ->
  result = ''
  for char in string
    index = alphabet0.indexOf char
    if index is -1
      result += char
    else
      result += alphabet1[index]

  return result
