#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# case 1
s1 = 75
s2 = 68
r=s1/s2
print('grade %f' %(r) )

# case 2
# print four blank
a = 3
print('%4d' %a)

# case 3
# language test
cn = '这是一个奇妙的旅程'
print(cn.encode('gb2312'))
print(cn.encode('gb2312').decode('gb2312'))

# format int and float
print('%d-%02d'%(1,2))
