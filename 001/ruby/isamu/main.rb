def combination origin, num
  (num).times do |l|
    (num - l + 1 ).times do |m|
      n = num - l - m
      # p [l, m, n]
      yield (origin[0] ** l) * (origin[1]  ** m ) * (origin[2] ** n), [l,m, n]
    end
  end
end

def next_val i
  num = i;
  ret = 1
  while num > 0
    ret = ret * (num % 10);
    num /= 10;
  end
  ret
end

def calc i
  if i < 10 
    return i;
  end
  
  next_val(i)
end

def originalNumnber origin, b
  3.times.map{|i|
    b[i].times.map{ origin[i].to_s}
  }.join()
end

i = 5
max = 0;

loop do 
  [[3,5,7], [2,3,7]].each {|origin|

    combination(origin, i) {|a, b|
      counter = 1
      res = a;
      while res > 9 do
        res = calc(res);
        counter = counter + 1
      end
      
      if max < counter
        max = counter
        p [originalNumnber(origin, b), a, counter]
      end
    }
  }
  i = i + 1
  # p i
end
