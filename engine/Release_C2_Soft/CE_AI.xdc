<?xml version="1.0"?><doc>
<members>
<member name="T:CharacterAnimation" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="61">
CharacterAnimation class
Load the animation information.
This code does not manage the actual model animating. This is a child of CharacterModel, and therefore only 
contains ONE animation data (which may contain several frames within itself).
It does, however, contain its own sound and manages the playing of it(maybe?).
Each animation has only one sound at the moment.
Access is public, because CharacterAnimation is primarily a container of information. It does not manage its 'models'
animation process.

</member>
<member name="M:CharacterAnimation.Process" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="82">
Process the animation.
1) Play the sound if needed

</member>
<member name="T:CharacterModel" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="91">
CharacterModel class
Contains Animation and model data for the model. The model hasMany animations and hasOne model data.
This class only manages animation and model data, not sounds or AI characteristics.

</member>
<member name="M:CharacterModel._generateAlphaFlags(TagMODEL*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="108">
Generate alpha transparency for model textures
NOTE: Only in D3d or Glide mode; not in software
@access protected

</member>
<member name="M:CharacterModel._generateModelMipMaps(TagMODEL*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="155">
Generate the models mipmaps on the textures
@access protected

</member>
<member name="M:CharacterModel._DATASHIFT(System.UInt16*,System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="228">
Not sure what this does
@access protected

</member>
<member name="M:CharacterModel._brightenTexture(System.UInt16*,System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="246">
Brighten the texture according to user settings. Also, if its night time then apply the green effect as well
@access protected

</member>
<member name="M:CharacterModel._releaseData" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="269">
Release memory to loaded data and reset loaded data
@access protected

</member>
<member name="M:CharacterModel._correct" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="299">
Make final corrections/optimiztions to loaded model data.
@access protected

</member>
<member name="M:CharacterModel.Load(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="358">
Load from file

</member>
<member name="T:Creature" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="451">
Generic Class for creatures. Includes basic AI, which can be overridden by each creature type

</member>
<member name="M:Creature.#ctor" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="464">
Constructor 

</member>
<member name="M:Creature.Load(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte*)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="472">
Load character information and characteristics

</member>
<member name="M:Creature.Reset" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="493">
Reset character information to the defaults. Totally blanks the creature and sets to default data

</member>
<member name="M:Creature.Place(System.Single,System.Single)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="501">
Place the character at the specified location. Return true if OK. False if failed

</member>
<member name="M:Creature.Update" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="509">
Update and process AI characteristics and move the character in response

</member>
<member name="M:CreatureBrain.Boot" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\ce_ai.cpp" line="563">
Load main storage "memory" and temp/current_state "memory"

</member>
</members>
</doc>