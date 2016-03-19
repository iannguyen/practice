# Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

require 'set'

def contains_duplicate(nums)
    nums.to_set.count < nums.count
end
