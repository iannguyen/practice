def radix_sort(arr)
    bool = true
    modder = 10
    divider = 1
    while(bool)
        bool = false
        hash = Hash.new

        arr.each do |num|
            mod = num%modder
            digit = mod/ divider
            bool = true if(mod < num)

            if hash.has_key?(digit)
                hash[digit].push(num)
            else
                hash[digit] = [num]
            end
        end

        arr = []

        (0..9).each do |key|
            arr.concat(hash[key]) if hash[key]
        end

        modder *= 10
        divider *= 10
    end
    arr
end

p radix_sort(arr)
