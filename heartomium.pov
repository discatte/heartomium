// POV-Ray 3.7 Scene File " ... .pov"
// author:  Discatte @galacticfurball
// date:    Feb,14,2021
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {perspective angle 75               // front view
                            location  <0.0 , 1.4 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.4 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}
// sun ----------------------------------------------------------------------
light_source{< 3000,3000,-3000> color White}
// sky ----------------------------------------------------------------------
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <0.6,0.7,1.0>]
                                   [0.35 rgb <0.1,0.0,0.8>]
                                   [0.65 rgb <0.1,0.0,0.8>]
                                   [1.00 rgb <0.6,0.7,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
// ground -------------------------------------------------------------------
plane{ <0,1,0>, 0 
       texture{ pigment{ checker color rgb<1,1,1>*1.2 color rgb<0.25,0.15,0.1>*0}
              //normal { bumps 0.75 scale 0.025}
                finish { phong 0.1}
              } // end of texture
     } // end of plane
//---------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//---------------------------------------------------------------------------
/*
// sample sphere
sphere { <0,0,0>, 1 
         texture { Polished_Chrome
                   //pigment{ color Red } // rgb< 1, 0.0, 0.0>}
                   //finish { phong 1 reflection {0.40 metallic 0.5}}
                 } // end of texture 

          scale<1,1,1>  rotate<0,0,0>  translate<0,1.35,0>  
       }  // end of sphere ----------------------------------- 

*/

#declare meow_heart=
isosurface{
 function{
 
sqrt(pow(x*2.5,2)+z*z+pow(abs(y*1.1-0.8*sqrt(sqrt(z*z+pow(x/2,2)/(pow(abs(y+1.4),4)+0.001)))),2))-1
 }
 accuracy 0.005
 max_gradient 5
 contained_by{box{-1.4,1.4}}
 texture{pigment{color red 1.0 blue 0.3}finish{diffuse 1 specular 0.5 phong 1
phong_size 45}}
}  

#declare Bend = 0.5;
#declare Sharpness = 0.8;

// Contains 3 heart functions, uncomment the others to try.

isosurface { //-------------------------------------------------------------

  // function{
  //	sqrt(pow(x*2.5,2)+z*z+pow(abs(y*1.1-0.8*sqrt(sqrt(z*z+pow(x/2,2)/(pow(abs(y+1.4),4)+0.001)))),2))-1
  //	}
  function { f_heart( x,y,z,  -0.15 ) //-0.15
           }
  // function { f_sphere(y-pow(abs(x),Sharpness)*Bend,z*2,x, 0.6) }

  threshold 0.0 //fheart
  accuracy 0.000001 // 2 hour render
  //accuracy 0.005
  max_gradient 100 //fheart
  contained_by {box {<-1.1,-1.5,-1.1>,< 1.1,1.22,1.5>}}
  //open
  texture { Polished_Chrome//pigment{ color rgb<1,0.7,0.1>}
            //normal {bumps 0.5 scale 0.05}
            //finish { phong 1 specular 0.3 }
	  }
  scale 1.00
  rotate <0, 0, 0> //fheart
  //rotate <0, 90, 0>
  translate <-0, 1.3, 0>
} // end of isosurface -------------------------------------------------------

