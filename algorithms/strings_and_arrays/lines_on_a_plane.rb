# Given an a plane of coordinates, return all the lines with at least 4 points

def line_finder(points)
  lines_hash = {}

  points.each_with_index do |base, idx1|
    slope_hash = {}
    points.each_with_index do |pt, idx2|
      next if idx1 == idx2 || base == pt
      curr_slope = slope(base, pt)
      slope_hash[curr_slope] ||= [base]
      slope_hash[curr_slope] <<  pt
    end
    slope_hash.each do |_key, val|
      lines_hash[val.sort] = true if val.count >= 4
    end
  end
  lines_hash.keys
end

def slope(pt1, pt2)
  rise = pt2[1] - pt1[1]
  run = pt2[0] - pt1[0]
  return 'undefined' if run.zero?
  rise / run.to_f
end

ver = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [1, 1]]
print line_finder(ver).to_s + "\n"

hor = [[1, 0], [2, 0], [3, 0], [4, 0]]
print line_finder(hor).to_s + "\n"

diag = [[1, 1], [2, 2], [3, 3], [4, 4]]
print line_finder(diag).to_s + "\n"

ran = [[5, 2], [3, 3], [1, 3], [2, 5]]
print line_finder(ran).to_s + "\n"

all = ver.concat(hor).concat(diag).uniq
print all.to_s + "\n"
print line_finder(all).to_s + "\n"
