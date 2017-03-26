def my_abs(x):
	if x>0:
		return x
	else :
		return -x

print(my_abs(2))

# none funtion
def nop():
	pass

print(nop())

# check type
def check_type(x):
	if not isinstance(x,(int,float)):
		raise TypeError('bad operand type')
	if x>=0:
		return x
	else:
		return -x
	pass
# check_type('x')


# return multlte value

import math

def move(x,y,step,angle=0):
	nx=x+step*math.cos(angle)
	ny=y-step*math.sin(angle)
	return nx,ny
	
r=move(100,100,60,math.pi/6)
print(r)
