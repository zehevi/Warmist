attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_texcoord;
varying vec4 v_color;
varying vec4 v_pos;


uniform sampler2D samp_normal_tex;
uniform sampler2D samp_specular_tex;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_color = in_Colour;
    v_texcoord = in_TextureCoord;
    v_pos = gm_Matrices[MATRIX_WORLD] * object_space_pos;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_color;
varying vec4 v_pos;

uniform sampler2D samp_normal_tex;
uniform sampler2D samp_specular_tex;

//values used for shading algorithm...
uniform vec2 Resolution;      //resolution of screen
uniform vec3 LightPos;        //light position, normalized
uniform vec4 LightColor;      //light RGBA -- alpha is intensity
uniform vec4 AmbientColor;    //ambient RGBA -- alpha is intensity 
uniform vec3 Falloff;         //attenuation coefficients
uniform float angle;          //Image angle

struct LightSource
{
vec3 L_LightPos;
vec4 L_LightColor;
};

const int numberOfLights = 5;
LightSource lights[numberOfLights];

//light from mouse pos
LightSource light0 = LightSource(
  LightPos,
  LightColor
);

//static light one RED
LightSource light1 = LightSource(
  vec3(256.0,  256.0,  3.0),
  vec4(1.0,  0.0,  0.0, 1.0)
);

//static light two GREEN
LightSource light2 = LightSource(
  vec3(600.0,  256.0,  3.0),
  vec4(0.0,  1.0,  0.0, 1.0)
);

//static light three BLUE
LightSource light3 = LightSource(
  vec3(256.0,  600.0,  3.0),
  vec4(0.0,  0.0,  1.0, 1.0)
);

//stactic light four YELLOW
LightSource light4 = LightSource(
  vec3(600.0,  600.0,  3.0),
  vec4(1.0,  1.0,  0.0, 1.0)
);


void main()
{

  lights[0] = light0;
  lights[1] = light1;
  lights[2] = light2;
  lights[3] = light3;
  lights[4] = light4;
  
  vec4 totalLighting;
 
   for (int index = 0; index < numberOfLights; index++) // for all light sources
    {
        //RGBA of our diffuse color
        vec4 DiffuseColor = texture2D(gm_BaseTexture, v_texcoord);
    
        //RGB of our normal map
        vec3 NormalMap = texture2D(samp_normal_tex, v_texcoord).rgb;
        
        vec4 SpecularMap = texture2D(samp_specular_tex, v_texcoord);
        
        //normalize the normal map
        vec3 N = normalize(NormalMap * 2.0 - 1.0);
       
        //Calculate the real position of the vector from the pixel (normal) to the light
        float x_cosine = cos(angle);
        float y_sine = sin(angle);
        vec3 LightDir = vec3( (lights[index].L_LightPos.x - v_pos.x) * x_cosine - (lights[index].L_LightPos.y - v_pos.y) * y_sine , 
                        ( lights[index].L_LightPos.x - v_pos.x) * y_sine + (lights[index].L_LightPos.y - v_pos.y) * x_cosine , 
                          lights[index].L_LightPos.z);
                          
        //Normalize the lights vetor, it's now ready to be used
        vec3 Final_Light = normalize(LightDir);
    
        //Find the length of the vector                          
        float Light_Length = length(LightDir);
    
        //Pre-multiply light color with intensity
        //Then perform "N dot L" to determine our diffuse term
        vec3 Diffuse = (lights[index].L_LightColor.rgb * lights[index].L_LightColor.a) * max(dot(N, Final_Light), 0.0);
    
        //pre-multiply ambient color with intensity
        vec3 Ambient = AmbientColor.rgb * AmbientColor.a;
    
        //calculate attenuation
        float Attenuation = Resolution.x / ( Falloff.x + (Falloff.y*Light_Length) + (Falloff.z*Light_Length*Light_Length) );
   
        //the calculation which brings it all together
        vec3 Intensity = Ambient + Diffuse * Attenuation ;
        vec3 FinalColor = DiffuseColor.rgb * SpecularMap.rgb * Intensity;
    
        //add it all up for the final product
        totalLighting = totalLighting + vec4( v_color * vec4(FinalColor, DiffuseColor.a));
   
   }

   gl_FragColor = totalLighting;

}
