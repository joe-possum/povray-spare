#include "colors.inc"
#include "stones.inc"
#include "woods.inc"

#declare thick = 4;
#declare x_ew = 144.25;
#declare y_ns = 120.25;
#declare ceiling = 108;

#declare h_nwin = 29.75;
#declare w_nwin = 65.75-2*3.5;
#declare l_nwin = x_ew-3.5-w_nwin-25.125;
#declare b_nwin = ceiling-11-h_nwin+3.5;

#declare h_ewin = 77.25-2*3.5;
#declare w_ewin = 42-2*3.5;
#declare l_ewin = 120.25-w_ewin-3.5-5.125;
#declare b_ewin = ceiling-10.75-h_ewin+3.5;

#declare h_closet = ceiling-23.25-3.5;
#declare w_closet = 54.625-2*3.5;
#declare l_closet = 3.625+2*3.5+w_closet;

#declare x_closet = 28.5;
#declare y_closet = 79.75;
union {
  box { // loudspeaker closet
    <0,0,1>,<14,25,11.5>
    texture{T_Wood10}
  }
  box { // loudspeaker closet
    <0,0,0>,<14,2,11.5>
    texture{T_Wood10}
  }
  box { // loudspeaker closet
    <0,2,0>,<14,25,1>
    texture{T_Wood4}
  }
  rotate <-26,0,0>
  rotate <0,-45,0>
  translate <x_closet+7.25,ceiling-27.5,-17.25>
}

box { // loudspeaker window
  <0,0,0>,<14,25,11.5>
  texture{T_Wood10}
  rotate <-26,0,0>
  rotate <0,-45+180,0>
  translate <x_ew-8,ceiling-27.5,-y_ns+17>
}

box { // floor
  <0,0,0>,<x_ew,-thick,-y_ns>
  texture{T_Stone10}
}
box { // ceiling
  <0,ceiling,0>,<x_ew,ceiling+thick,-y_ns>
  texture{T_Stone25}
}
difference { // closet
  box { <x_closet-thick,0,0>,<x_closet,ceiling,-y_closet> }
  box { <x_closet-thick-1,0,-l_closet>,<x_closet+1,h_closet,-l_closet+w_closet>}
  texture{T_Stone25}
}
box { <0,0,-y_closet+thick>,<x_closet,ceiling,-y_closet> texture{T_Stone25}} // closet side
box { <0,0,0>,<-thick,ceiling,-y_ns> texture{T_Stone25}}
difference {
  box {
    <0,0,0>,<x_ew,ceiling,thick>
  }
  box {
    <l_nwin,b_nwin,-1>,
    <l_nwin+w_nwin,b_nwin+h_nwin,thick+1>
  }
  texture{T_Stone24}
}
difference {
  box {
    <x_ew,0,0>,<x_ew+thick,ceiling,-y_ns>
  }
  box {
    <x_ew-1,b_ewin,-l_ewin>,
    <x_ew+thick+1, b_ewin+h_ewin, -(l_ewin+w_ewin)>
  }
  texture{T_Stone24}
}
union {
  box { <x_closet,0,-l_closet-3.5>,<x_closet+0.75,h_closet+3.5,-l_closet>}
  box { <x_closet,0,-l_closet+w_closet>,<x_closet+0.75,h_closet+3.5,-l_closet+w_closet+3.5>}
  box { <x_closet,h_closet,-l_closet-3.5>,<x_closet+0.75,h_closet+3.5,-l_closet+w_closet+3.5>}
  pigment{color<1,1,1>}
}
union {
  box {<l_nwin-3.5,b_nwin-3.5,0>,<l_nwin,b_nwin+h_nwin+3.5,-0.75>}
  box {<l_nwin+w_nwin,b_nwin-3.5,0>,<l_nwin+w_nwin+3.5,b_nwin+h_nwin+3.5,-0.75>}
  box {<l_nwin-3.5,b_nwin-3.5,0>,<l_nwin+w_nwin+3.5,b_nwin,-0.75>}
  box {<l_nwin-3.5,b_nwin+h_nwin,0>,<l_nwin+w_nwin+3.5,b_nwin+h_nwin+3.5,-0.75>}
  pigment{color<1,1,1>}
}
union {
  box {<x_ew-0.75,b_ewin-3.5,-l_ewin+3.5>,<x_ew,b_ewin+h_ewin+3.5,-l_ewin>}
  box {<x_ew-0.75,b_ewin-3.5,-l_ewin+3.5>,<x_ew,b_ewin,-l_ewin-w_ewin-3.5>}
  box {<x_ew-0.75,b_ewin+h_ewin,-l_ewin+3.5>,<x_ew,b_ewin+h_ewin+3.5,-l_ewin-w_ewin-3.5>}
  box {<x_ew-0.75,b_ewin-3.5,-l_ewin-w_ewin-3.5>,<x_ew,b_ewin+h_ewin+3.5,-l_ewin-w_ewin>}
  pigment{color<1,1,1>}
}
union {
  box {<0,0,-y_ns>,<.75,6,0>}
  box {<0,0,-y_closet-.75>,<x_closet+.75,6,-y_closet>}
  box {<x_closet,0,-y_closet-.75>,<x_closet+.75,6,-l_closet>}
  box {<x_closet,0,0>,<x_closet+.75,6,-l_closet+w_closet>}
  box {<0,0,0>,<x_ew,6,.75>}
  box {<x_ew,0,-y_ns>,<x_ew-.75,6,0>}
  pigment{color<1,1,1>}
}

light_source { <x_ew/2, ceiling-30, -y_ns/2> color  White }
light_source { <x_ew/2, ceiling-30, -10*y_ns> color  .1*White }

camera {
   location  <x_ew/2, 55, -360.25>
   //location  <3*x_ew/4, 55, -y_ns/3>
   angle 40 //direction <0.0, 0.0,  0.0>
   look_at <x_ew/2,55,0>
   //look_at <0,55,-y_ns/4>
   #if (0)
   focal_point <0,-1,0>
   aperture 2
   blur_samples 100
   #end
   up        <0.0, 1.0, 0.0>
   //right x*image_width/image_height
}
