from functools import reduce
import time

def count(digits):
    if len(digits) <= 1:
        return 0
    next_digits = tuple(map(int, str(reduce(lambda a, b: a * b, digits, 1))))
    return count(next_digits) + 1

max_times, max_digits = 1, None
_t = time.time()
N = 50  # O(N**3)
for c in range(N):
    for b in range(N):
        for a in range(N):
            for p1, p2, p3 in ((2, 3, 7), (3, 5, 7)):
                if '0' in str(p1 ** a * p2 ** b * p3 ** c):
                    continue
                digits = (p1,) * a + (p2,) * b + (p3,) * c
                times = count(digits)
                if max_times < times:
                    max_times, max_digits = times, digits
                    print('{} times digit={} ({:.3f} [sec]) '.format(
                        max_times,
                        ''.join(map(str, max_digits)),
                        time.time() - _t,
                    ))
print ('Finished ({:.3f} [sec]) '.format(time.time() - _t))
