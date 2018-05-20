# Written by Dan Li danlee@whu.edu.cn
set term tikz standalone color tightboundingbox size 20in,20in
reset
set style textbox opaque noborder margin 0.5,0.5
level_max = 10 * pi
level_min = -10 * pi
level_incr = 0.1 * pi
n = (level_max - level_min) / 2 / level_incr
do for [i=1:2*n] {
    set style line i lc rgb '#FF0000' lt 1 lw 2 dashtype 2
    set style line i + 2*n lc rgb '#0000FF' lt 2 lw 2 
}
set style line 4*n+1 lc rgb '#FF00FF' lt 2 lw 4
set style line 4*n+2 lc rgb '#0000FF' lt 2 lw 4
set style increment user

unset border
unset xtics
unset ytics
unset key

set size square
set view map
unset surface
set contour base
set cntrparam bspline
set cntrparam levels incr level_min, level_incr, level_max 
#set cntrparam levels discrete pi, 0.5*pi, 0, -0.5*pi
set cntrlabel start 20 font ",5"
set isosam 250,250

set xrange [-5:5]
set yrange [-5:5]

u = 1.0
q = 2.0 * pi
phi_u(x,y) = u * x
psi_u(x,y) = u * y
phi_s(x,y) = q / 2.0 / pi * log(sqrt(x**2 + y**2))
#psi_s(x,y) = q / 2.0 / pi * (x*y>0?(x>0?atan(y/x):pi+atan(y/x)):(x>0?2*pi+atan(y/x):pi+atan(y/x)))
#psi_s(x,y) = q / 2.0 / pi * (x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x))))
psi_s(x,y) = q / 2.0 / pi * (y==0?(x>0?0:pi):(x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x)))))

M = 2.0 * pi
phi_d(x,y) = M / 2.0 / pi * x / (x**2 + y**2)
psi_d(x,y) = -1 * M / 2.0 / pi * y / (x**2 + y**2)

Gamma = 2 * pi
phi_v(x,y) = Gamma / 2.0 / pi * (y==0?(x>0?0:pi):(x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x)))))
psi_v(x,y) = -1 *Gamma / 2.0 / pi * log(sqrt(x**2 + y**2))

set output "uniform.tex"
splot phi_u(x,y) w l notitle,  \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y) w l notitle#, \
      #phi_u(x,y) w labels boxed notitle, \
      #psi_u(x,y) w labels boxed notitle#, \

set output "sink.tex"
splot phi_s(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_s(x,y) w l notitle#, \
      #phi_s(x,y) w labels boxed notitle, \
      #psi_s(x,y) w labels boxed notitle#, \

set output "depole.tex"
splot phi_d(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_d(x,y) w l notitle#, \

set output "vortex.tex"
splot phi_v(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_v(x,y) w l notitle#, \


set output "uniformanddepole.tex"
splot phi_u(x,y)+phi_d(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y)+psi_d(x,y) w l notitle#, \


set output "sinkandvortex.tex"
splot phi_v(x,y)-phi_s(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_v(x,y)-psi_s(x,y) w l notitle#, \


Gamma = 2 * pi
phi_v(x,y) = Gamma / 2.0 / pi * (y==0?(x>0?0:pi):(x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x)))))
psi_v(x,y) = -1 *Gamma / 2.0 / pi * log(sqrt(x**2 + y**2))
set output "uniformanddepoleandvortex1.tex"
splot phi_u(x,y)+phi_d(x,y)+phi_v(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y)+psi_d(x,y)+psi_v(x,y) w l notitle#, \

Gamma = 4 * pi
phi_v(x,y) = Gamma / 2.0 / pi * (y==0?(x>0?0:pi):(x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x)))))
psi_v(x,y) = -1 *Gamma / 2.0 / pi * log(sqrt(x**2 + y**2))
set output "uniformanddepoleandvortex2.tex"
splot phi_u(x,y)+phi_d(x,y)+phi_v(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y)+psi_d(x,y)+psi_v(x,y) w l notitle#, \

Gamma = 6 * pi
phi_v(x,y) = Gamma / 2.0 / pi * (y==0?(x>0?0:pi):(x>0&y>0?atan(y/x):(x<0&y>0?pi+atan(y/x):(x<0&y<0?pi+atan(y/x):2*pi+atan(y/x)))))
psi_v(x,y) = -1 *Gamma / 2.0 / pi * log(sqrt(x**2 + y**2))
set output "uniformanddepoleandvortex3.tex"
splot phi_u(x,y)+phi_d(x,y)+phi_v(x,y) w l notitle, \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y)+psi_d(x,y)+psi_v(x,y) w l notitle#, \

set output "uniformandsink.tex"
set style arrow 1 heads filled size screen 0.03,15 ls 4*n+2
set style arrow 2 nohead ls 4*n+1
set arrow from 0,-5 to 0, 5 ls 4*n+1
set arrow from -5,0 to 5, 0 ls 4*n+1
set arrow from -1*q/2.0/pi/u,-1.1 to -1*q/2.0/pi/u,0 as 2
set arrow from 0.0,q/4.0/u to 1.1,q/4.0/u as 2
set arrow from 0.0,-1*q/4.0/u to 1.1,-1*q/4.0/u as 2
set arrow from -1*q/2.0/pi/u,-1 to 0, -1 as 1
set arrow from 1,0 to 1, q/4/u as 1
set arrow from 1,-q/4/u to 1,0 as 1
set label 1 at -0.5*q/2.0/pi/u,-1 '\hl{$-\frac{q}{2\pi u_0}$}' center font ",35" front tc ls 4*n 
set label 2 at 1,0.5*q/4.0/u '\hl{$\frac{q}{4u_0}$}' center rotate by 90 font ",35" front tc ls 4*n 
set label 3 at 1,-0.5*q/4.0/u '\hl{$-\frac{q}{4u_0}$}' center rotate by 90 font ",35" front tc ls 4*n 
splot phi_u(x,y) + phi_s(x,y) w l notitle,  \
      for [i=1:(n-1)] i notitle, \
      psi_u(x,y) + psi_s(x,y) w l notitle#, \
unset arrow
unset label
