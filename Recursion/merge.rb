def merge_sort(ary)
  return ary if ary.legth < 2
  ary_half = ary.length/2
  left_ary = ary[0...ary_half]
  right_ary = ary[ary_half..-1]
  
  marge()
end

def merge(ary1, ary2)
  ary1.sort
  ary2.sort
end

merge_sort([3,2,4,1,7,6,5,8])

# MergeSort(arr[], l,  r)
# If r > l
#      1. Find the middle point to divide the array into two halves:  
#              middle m = (l+r)/2
#      2. Call mergeSort for first half:   
#              Call mergeSort(arr, l, m)
#      3. Call mergeSort for second half:
#              Call mergeSort(arr, m+1, r)
#      4. Merge the two halves sorted in step 2 and 3:
#              Call merge(arr, l, m, r)