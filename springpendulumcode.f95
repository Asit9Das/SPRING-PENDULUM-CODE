program springpendulum
real::t,x,y,dx,dy,h,u,v,du,dv,p,q
!x means generalised momenta for radial displacement x in problem, y means radial displacement x, u means generalised momenta for theta, v means theta, p and q are the cartesian coordinates for the bob 

open(2,file='springp.txt',status='unknown')
  
  t=0.0
h=0.005
x=0.0
y=0.5

u=0.0
v=1.0

4 p=(1+y)*sin(v)
q=-(1+y)*cos(v)
write(2,*)t,x,y,u,v,p,q
t=t+h
x=x+h*dx(x,y,u,v)
y=y+h*dy(x,y,u,v)
u=u+h*du(x,y,u,v)
v=v+h*dv(x,y,u,v)

if (t<=100.0) go to 4
  end program
function dx(x,y,u,v)
real::x,y,u,v
dx=-y+cos(v)
end function

function dy(x,y,u,v)
real::x,y,u,v
dy=x
end function
function du(x,y,u,v)
real::x,y,u,v
du=-(1+y)*sin(v)
end function

function dv(x,y,u,v)
real::x,y,u,v
dv=u/((1+y)**2)
end function

  