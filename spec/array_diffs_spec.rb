RSpec.describe "Development and testing (advanced)" do

  it "Diff of arrays with different elements should return those" do
    first_array = ["sarasa", "ble", "bla"]
    second_array = ["sarasa", "a thing"]
    
    result = diffs(first_array, second_array)
    expect(["ble", "bla", "a thing"].all?{|e| result.include?(e)}).to be(true)
  end

  it "diff of equal arrays should return the one with the longest element" do
    first_array = ["sarasa", "ble", "bla   "]
    second_array = ["sarasa", "ble", "bla"]

    result = diffs(first_array, second_array)
    expect(result).to eq(first_array)
  end

end

def diffs(array1, array2) 
  first_array = array1.map{|e| e.strip.downcase}
  second_array = array2.map{|e| e.strip.downcase}

  result = first_array - second_array | second_array - first_array
  return result if result.length > 0

  longest = (array1 << array2).sort{ |a, b| b.length <=> a.length }.first
  
  if array1.include?(longest)
    array1
  else
    array2
  end
end