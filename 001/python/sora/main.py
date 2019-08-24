
import sys
from datetime import datetime


def do():
    if len(sys.argv) <= 1:
        print('set num as argment: python main.py 15')
        return
    target_num = sys.argv[1]
    if not target_num.isdecimal():
        print('set num as argment: python main.py 15')
        return
    print(datetime.now())
    print('target is {}'.format(target_num))
    result, count = calc(int(target_num))
    print('result is {}, count is {}'.format(result, count))
    print(datetime.now())


def calc(target_num: int, count: int = 1):
    next_target_num = 1
    for s in str(target_num):
        next_target_num *= int(s)
    if next_target_num < 10:
        return next_target_num, count
    count += 1
    return calc(next_target_num, count)


if __name__ == '__main__':
    do()
