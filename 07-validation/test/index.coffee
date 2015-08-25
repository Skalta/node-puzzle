assert   = require 'assert'
{validate} = require '../lib'


describe '07-validation', ->

  it 'should return `true` for valid data', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: name', ->
    assert !validate
      id: 1
      name: 2 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: email', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id', ->
    assert !validate
      id: -5 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: favouriteColour', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- problem
      interests: ["cycling", "programming"]

  it 'should return 'false' for invalid data: id', ->
    assert !validate
      id: 0  # <--- problem Boundry area
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"] 
      
  it 'should retune 'false' for invalid data: taxRate', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 1.1  # problem Boundary area
      favouriteColour: '#ff6' 
      interests: ["cycling", "programming"]
      
  it 'should return 'false' for invalid data: interests', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6' 
      interests: ["cycling","programming","jogging","music","footy"] # <---- Problem More than 5 interest
    
  # !!!!!
  # Add more tests for different data that users might try to provide!

  # Positive Test
  
  it 'should return `true` for valid data', ->
    assert validate
      id: 3 # <---- positive integer
      name: 'Jjjjjjjjjjoooooooooohhhhhhhhhhnnnnnnnnnn Ddddddddddooooooooooee'  # <--- 63 Chars
      email: 'foo@bar.com'
      taxRate: 1
      favouriteColour: ''  # <---- Optional
      interests: [""]      # <---- Optional
      
  
  # Negative Scenario
  
  it 'should return `false` for invalid data: id', ->
    assert !validate
      id: A  # <--- Problem user entering a character in place of a integer
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
  
  it 'should return `false` for invalid data: name', ->
    assert !validate
      id: 1
      name: 'Jjjjjjjjjjoooooooooohhhhhhhhhhnnnnnnnnnn Ddddddddddooooooooooeee'  #<--- Problem Field with 64 chars
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
  
    it 'should return `false` for invalid data: taxRate', ->
    assert !validate
      id: 4
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 1.1 # <---- Problem Taxrate should be between 0 and 1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
      
  it 'should return `false` for invalid data: interests', ->
    assert !validate
      id: A  
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'3
      interests: ["cycling", "programming-programming-programming-programming", "cricket", "cooking"] #<--- Length of array >31 chars
  # !!!!!
