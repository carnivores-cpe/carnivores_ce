<?xml version="1.0"?>
<doc>
<members>
<member name="D:irrklang.ik_u8" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="13">
This is a typedef for unsigned char, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_s8" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="17">
This is a typedef for signed char, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_c8" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="21">
This is a typedef for char, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_u16" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="27">
This is a typedef for unsigned short, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_s16" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="31">
This is a typedef for signed short, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_u32" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="37">
This is a typedef for unsigned int, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_s32" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="41">
This is a typedef for signed int, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_f32" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="47">
This is a typedef for float, it ensures portability of the engine. 
</member>
<member name="D:irrklang.ik_f64" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irrklangtypes.h" line="51">
This is a typedef for double, it ensures portability of the engine. 
</member>
<member name="T:irrklang.IRefCounted" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_irefcounted.h" line="13">
This class provides reference counting through the methods grab() and drop().
	It also is able to store a debug string for every instance of an object.
	Most objects of irrKlang are derived from IRefCounted, and so they are reference counted.

	When you create an object in irrKlang, calling a method
	which starts with 'create', an object is created, and you get a pointer
	to the new object. If you no longer need the object, you have 
	to call drop(). This will destroy the object, if grab() was not called
	in another part of you program, because this part still needs the object.
	Note, that you only need to call drop() to the object, if you created it,
	and the method had a 'create' in it. 

	A simple example:

	If you want to create a texture, you may want to call an imaginable method
	IDriver::createTexture. You call
	ITexture* texture = driver-&gt;createTexture(128, 128);
	If you no longer need the texture, call texture-&gt;drop().

	If you want to load a texture, you may want to call imaginable method
	IDriver::loadTexture. You do this like
	ITexture* texture = driver-&gt;loadTexture("example.jpg");
	You will not have to drop the pointer to the loaded texture, because
	the name of the method does not start with 'create'. The texture
	is stored somewhere by the driver.

</member>
<member name="T:irrklang.IVirtualRefCounted" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_ivirtualrefcounted.h" line="15">
See IRefCounted for the basics of this class.
	The difference to IRefCounted is that the class has to implement reference counting
	for itself. 

</member>
<member name="M:irrklang.IVirtualRefCounted.grab" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_ivirtualrefcounted.h" line="29">
To be implemented by the derived class. If you don't want to
		implement this, use the class IRefCounted instead. See IRefCounted::grab() for details
		of this method. 
</member>
<member name="M:irrklang.IVirtualRefCounted.drop" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_ivirtualrefcounted.h" line="35">
To be implemented by the derived class. If you don't want to
		implement this, use the class IRefCounted instead. See IRefCounted::grab() for details
		of this method. 
</member>
<member name="F:ESOD_DIRECT_SOUND_8" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundoutputdrivers.h" line="18">
In contrast to ESOD_DIRECT_SOUND, this supports sophisticated sound effects
		but may not be available on old windows versions. It behaves very similar 
		to ESOD_DIRECT_SOUND but also supports DX8 sound effects.
</member>
<member name="T:irrklang.E_SOUND_OUTPUT_DRIVER" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundoutputdrivers.h" line="11">
Values of this enumeration can be used as parameter when calling createIrrKlangDevice(). 
</member>
<member name="F:ESEO_MULTI_THREADED" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="18">
Using this flag, irrKlang will update
		all streams, sounds, 3d positions and whatever automaticly. You also don't need to call ISoundEngine::update()
		if irrKlang is running multithreaded. However, if you want to run irrKlang in the same thread
		as your application (for easier debugging for example), don't set this. But you need to call ISoundEngine::update()
		as often as you can (at least about 2-3 times per second) to make irrKlang update everything correctly then. 
</member>
<member name="F:ESEO_MUTE_IF_NOT_FOCUSED" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="26">
This will only work when irrKlang is using the DirectSound output driver. 
</member>
<member name="F:ESEO_LOAD_PLUGINS" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="30">
Plugins usually are .dll, .so or .dylib
		files named for example ikpMP3.dll (= short for irrKlangPluginMP3) which are executed
		after the startup of the sound engine and modify it for example to make it possible
		to play back mp3 files. Plugins are being loaded from the current working directory 
		as well as from the position where the .exe using the irrKlang library resides. 
		It is also possible to load the plugins after the engine has started up using 
		ISoundEngine::loadPlugins(). 
</member>
<member name="F:ESEO_USE_3D_BUFFERS" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="40">
If this flag is not specified, all buffers will by created
		in 2D only and 3D positioning will be emulated in software, making the engine run
		faster if hardware 3d audio is slow on the system.  
</member>
<member name="F:ESEO_PRINT_DEBUG_INFO_TO_DEBUGGER" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="46">
irrKlang will print debug info and status messages to any windows debugger supporting 
		OutputDebugString() (like VisualStudio).
		This is useful if your application does not capture any console output (see ESEO_PRINT_DEBUG_INFO_TO_STDOUT). 
</member>
<member name="F:ESEO_PRINT_DEBUG_INFO_TO_STDOUT" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="52">
irrKlang will print debug info and status messages stdout, the console window in Windows. 
</member>
<member name="F:ESEO_LINEAR_ROLLOFF" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="56">
If specified, instead of the default logarithmic one, irrKlang will 
		 use a linear rolloff model which influences the attenuation 
		 of the sounds over distance. The volume is interpolated linearly between the MinDistance
		 and MaxDistance, making it possible to adjust sounds more easily although this is not
		 physically correct.
		 Note that this option may not work when used together with the ESEO_USE_3D_BUFFERS
		 option when using Direct3D for example, irrKlang will then turn off ESEO_USE_3D_BUFFERS
		 automaticly to be able to use this option and write out a warning. 
</member>
<member name="F:ESEO_FORCE_32_BIT" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="70">
Don't use this. 
</member>
<member name="T:irrklang.E_SOUND_ENGINE_OPTIONS" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_esoundengineoptions.h" line="11">
When using createIrrKlangDevice, use a combination of this these
	as 'options' parameter to start up the engine. By default, irrKlang
	uses ESEO_DEFAULT_OPTIONS, which is set to the combination 
	ESEO_MULTI_THREADED | ESEO_LOAD_PLUGINS | ESEO_USE_3D_BUFFERS | ESEO_PRINT_DEBUG_INFO_TO_DEBUGGER | ESEO_PRINT_DEBUG_INFO_TO_STDOUT. 
</member>
<member name="F:irrklang.SAudioStreamFormat.FrameCount" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_saudiostreamformat.h" line="32">
If the stream has an unknown lenght, this is -1 
</member>
<member name="T:irrklang.ISoundSource" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="18">
It provides some informations about the sound source like the play lenght and
	can have default settings for volume, distances for 3d etc. There is some example code on how
	to use Sound sources at @ref soundSources.
</member>
<member name="M:irrklang.ISoundSource.setStreamMode(irrklang.E_STREAM_MODE)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="29">
Note that if this is set to ESM_NO_STREAMING, the engine still might decide
		to stream the sound if it is too big. The threashold for this can be 
		adjusted using ISoundSource::setForcedStreamingThreshold(). 
</member>
<member name="M:irrklang.ISoundSource.getStreamMode" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="35">
Note: If the returned type is ESM_AUTO_DETECT, this mode will change after the
		sound has been played the first time. 
</member>
<member name="M:irrklang.ISoundSource.getPlayLength" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="40">
Returns -1 if not known for this sound for example because its decoder
		does not support lenght reporting or it is a file stream of unknown size.
		Note: If the sound never has been played before, the sound engine will have to open
		the file and try to get the play lenght from there, so this call could take a bit depending
		on the type of file. 
</member>
<member name="M:irrklang.ISoundSource.getAudioFormat" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="48">
\return Returns the structure filled with 0 or negative values if not known for this sound for example because 
		because the file could not be opened or similar.
		Note: If the sound never has been played before, the sound engine will have to open
		the file and try to get the play lenght from there, so this call could take a bit depending
		on the type of file. 
</member>
<member name="M:irrklang.ISoundSource.setDefaultVolume(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="65">
The default value of this is 1.0f. 
		Note that the default volume is being multiplied with the master volume
		of ISoundEngine, change this via ISoundEngine::setSoundVolume(). 
		//! \param volume 0 (silent) to 1.0f (full volume). Default value is 1.0f. 
</member>
<member name="M:irrklang.ISoundSource.getDefaultVolume" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="72">
You can influence this default volume value using setDefaultVolume().
		Note that the default volume is being multiplied with the master volume
		of ISoundEngine, change this via ISoundEngine::setSoundVolume(). 
		//! \return 0 (silent) to 1.0f (full volume). Default value is 1.0f. 
</member>
<member name="M:irrklang.ISoundSource.setDefaultMinDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="79">
 This value influences how loud a sound is heard based on its distance.
		See ISound::setMinDistance() for details about what the min distance is.
		This method only influences the initial distance value of sounds. For changing the
		distance while the sound is playing, use ISound::setMinDistance() and ISound::setMaxDistance().
		\param minDistance: Default minimal distance for 3D sounds from this source. Set it to a negative
		value to let sounds of this source use the engine level default min distance, which
		can be set via ISoundEngine::setDefault3DSoundMinDistance(). Default value is -1, causing
		the default min distance of the sound engine to take effect. 
</member>
<member name="M:irrklang.ISoundSource.getDefaultMinDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="90">
 This value influences how loud a sound is heard based on its distance.
		See ISound::setMinDistance() for details about what the minimal distance is.
		\return Default minimal distance for 3d sounds from this source. If setDefaultMinDistance()
		was set to a negative value, it will return the default value set in the engine,
		using ISoundEngine::setDefault3DSoundMinDistance(). Default value is -1, causing
		the default min distance of the sound engine to take effect. 
</member>
<member name="M:irrklang.ISoundSource.setDefaultMaxDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="99">
 Changing this value is usually not necessary. Use setDefaultMinDistance() instead.
		Don't change this value if you don't know what you are doing: This value causes the sound
		to stop attenuating after it reaches the max distance. Most people think that this sets the
		volume of the sound to 0 after this distance, but this is not true. Only change the
		minimal distance (using for example setDefaultMinDistance()) to influence this.
		See ISound::setMaxDistance() for details about what the max distance is.
		This method only influences the initial distance value of sounds. For changing the
		distance while the sound is played, use ISound::setMinDistance() 
		and ISound::setMaxDistance().
		\param maxDistance Default maximal distance for 3D sounds from this source. Set it to a negative
		value to let sounds of this source use the engine level default max distance, which
		can be set via ISoundEngine::setDefault3DSoundMaxDistance(). Default value is -1, causing
		the default max distance of the sound engine to take effect. 
</member>
<member name="M:irrklang.ISoundSource.getDefaultMaxDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="115">
This value influences how loud a sound is heard based on its distance.
		Changing this value is usually not necessary. Use setDefaultMinDistance() instead.
		Don't change this value if you don't know what you are doing: This value causes the sound
		to stop attenuating after it reaches the max distance. Most people think that this sets the
		volume of the sound to 0 after this distance, but this is not true. Only change the
		minimal distance (using for example setDefaultMinDistance()) to influence this.
		See ISound::setMaxDistance() for details about what the max distance is.
		\return Default maximal distance for 3D sounds from this source. If setDefaultMaxDistance()
		was set to a negative value, it will return the default value set in the engine,
		using ISoundEngine::setDefault3DSoundMaxDistance(). Default value is -1, causing
		the default max distance of the sound engine to take effect. 
</member>
<member name="M:irrklang.ISoundSource.forceReloadAtNextUse" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="129">
Sounds which are not played as streams are buffered to make it possible to
		replay them without much overhead. If the sound file is altered after the sound
		has been played the first time, the engine won't play the changed file then.
		Calling this method makes the engine reload the file before the file is played
		the next time.
</member>
<member name="M:irrklang.ISoundSource.setForcedStreamingThreshold(System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="137">
When specifying ESM_NO_STREAMING for playing back a sound file, irrKlang will
		ignore this setting if the file is bigger than this threshold and stream the file
		anyway. Please note that if an audio format loader is not able to return the 
		size of a sound source and returns -1 as length, this will be ignored as well 
		and streaming has to be forced.
		\param threshold: New threshold. The value is specified in uncompressed bytes and its default value is 
		about one Megabyte. Set to 0 or a negative value to disable stream forcing. 
</member>
<member name="M:irrklang.ISoundSource.getForcedStreamingThreshold" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="147">
 The value is specified in uncompressed bytes and its default value is 
		about one Megabyte. See setForcedStreamingThreshold() for details. 
</member>
<member name="M:irrklang.ISoundSource.getSampleData" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundsource.h" line="152">
\return Returns a pointer to the sample data. The data is provided in decoded PCM data. The
		exact format can be retrieved using getAudioFormat(). Use getAudioFormat().getSampleDataSize()
		for getting the amount of bytes. The returned pointer will only be valid as long as the sound
		source exists.
		This function will only return a pointer to the data if the 
		audio file is not streamed, namely ESM_NO_STREAMING. Otherwise this function will return 0.
		Note: If the sound never has been played before, the sound engine will have to open
		the file and decode audio data from there, so this call could take a bit depending
		on the type of the file.
</member>
<member name="T:irrklang.ISoundEffectControl" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="15">
Sound effects such as chorus, distorsions, echo, reverb and similar can
	be controlled using this. An instance of this interface can be obtained via
	ISound::getSoundEffectControl(). The sound containing this interface has to be started via 
	ISoundEngine::play2D() or ISoundEngine::play3D() with the flag enableSoundEffects=true, 
	otherwise no acccess to this interface will be available.
	For the DirectSound driver, these are effects available since DirectSound8. For most 
	effects, sounds should have a sample rate of 44 khz and should be at least
	150 milli seconds long for optimal quality when using the DirectSound driver.
	Note that the interface pointer is only valid as long as
	the ISound pointer is valid. If the ISound pointer gets dropped (IVirtualRefCounted::drop()),
	the ISoundEffects may not be used any more. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableChorusSoundEffect(System.Single,System.Single,System.Single,System.Single,System.Boolean,System.Single,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="34">
Chorus is a voice-doubling effect created by echoing the
		original sound with a slight delay and slightly modulating the delay of the echo. 
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fWetDryMix Ratio of wet (processed) signal to dry (unprocessed) signal. Minimal Value:0, Maximal Value:100.0f;
		\param fDepth Percentage by which the delay time is modulated by the low-frequency oscillator, in hundredths of a percentage point. Minimal Value:0, Maximal Value:100.0f;
		\param fFeedback Percentage of output signal to feed back into the effect's input. Minimal Value:-99, Maximal Value:99.0f;
		\param fFrequency Frequency of the LFO. Minimal Value:0, Maximal Value:10.0f;
		\param sinusWaveForm True for sinus wave form, false for triangle.
		\param fDelay Number of milliseconds the input is delayed before it is played back. Minimal Value:0, Maximal Value:20.0f;
		\param lPhase Phase differential between left and right LFOs. Possible values:
			-180, -90, 0, 90, 180
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableCompressorSoundEffect(System.Single,System.Single,System.Single,System.Single,System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="61">
Compressor is a reduction in the fluctuation of a signal above a certain amplitude. 
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fGain Output gain of signal after Compressor. Minimal Value:-60, Maximal Value:60.0f;
		\param fAttack Time before Compressor reaches its full value. Minimal Value:0.01, Maximal Value:500.0f;
		\param fRelease Speed at which Compressor is stopped after input drops below fThreshold. Minimal Value:50, Maximal Value:3000.0f;
		\param fThreshold Point at which Compressor begins, in decibels. Minimal Value:-60, Maximal Value:0.0f;
		\param fRatio Compressor ratio. Minimal Value:1, Maximal Value:100.0f;
		\param fPredelay Time after lThreshold is reached before attack phase is started, in milliseconds. Minimal Value:0, Maximal Value:4.0f;
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableDistortionSoundEffect(System.Single,System.Single,System.Single,System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="84">
Distortion is achieved by adding harmonics to the signal in such a way that,
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		as the level increases, the top of the waveform becomes squared off or clipped.
		\param fGain Amount of signal change after distortion. Minimal Value:-60, Maximal Value:0;
		\param fEdge Percentage of distortion intensity. Minimal Value:0, Maximal Value:100;
		\param fPostEQCenterFrequency Center frequency of harmonic content addition. Minimal Value:100, Maximal Value:8000;
		\param fPostEQBandwidth Width of frequency band that determines range of harmonic content addition. Minimal Value:100, Maximal Value:8000;
		\param fPreLowpassCutoff Filter cutoff for high-frequency harmonics attenuation. Minimal Value:100, Maximal Value:8000;
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableEchoSoundEffect(System.Single,System.Single,System.Single,System.Single,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="106">
An echo effect causes an entire sound to be repeated after a fixed delay.
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fWetDryMix Ratio of wet (processed) signal to dry (unprocessed) signal. Minimal Value:0, Maximal Value:100.0f;
		\param fFeedback Percentage of output fed back into input. Minimal Value:0, Maximal Value:100.0f;
		\param fLeftDelay Delay for left channel, in milliseconds. Minimal Value:1, Maximal Value:2000.0f;
		\param fRightDelay Delay for right channel, in milliseconds. Minimal Value:1, Maximal Value:2000.0f;
		\param lPanDelay Value that specifies whether to swap left and right delays with each successive echo. Minimal Value:0, Maximal Value:1;
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableFlangerSoundEffect(System.Single,System.Single,System.Single,System.Single,System.Boolean,System.Single,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="127">
Flange is an echo effect in which the delay between the original 
		signal and its echo is very short and varies over time. The result is 
		sometimes referred to as a sweeping sound. The term flange originated
		with the practice of grabbing the flanges of a tape reel to change the speed. 
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fWetDryMix Ratio of wet (processed) signal to dry (unprocessed) signal. Minimal Value:0, Maximal Value:100.0f;
		\param fDepth Percentage by which the delay time is modulated by the low-frequency oscillator, in hundredths of a percentage point. Minimal Value:0, Maximal Value:100.0f;
		\param fFeedback Percentage of output signal to feed back into the effect's input. Minimal Value:-99, Maximal Value:99.0f;
		\param fFrequency Frequency of the LFO. Minimal Value:0, Maximal Value:10.0f;
		\param triangleWaveForm True for triangle wave form, false for square.
		\param fDelay Number of milliseconds the input is delayed before it is played back. Minimal Value:0, Maximal Value:20.0f;
		\param lPhase Phase differential between left and right LFOs. Possible values:
			-180, -90, 0, 90, 180
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableGargleSoundEffect(System.Int32,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="156">
The gargle effect modulates the amplitude of the signal. 
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param rateHz Rate of modulation, in Hertz. Minimal Value:1, Maximal Value:1000
		\param sinusWaveForm True for sinus wave form, false for triangle.
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableI3DL2ReverbSoundEffect(System.Int32,System.Int32,System.Single,System.Single,System.Single,System.Int32,System.Single,System.Int32,System.Single,System.Single,System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="170">
An implementation of the listener properties in the I3DL2 specification. Source properties are not supported.
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param lRoom Attenuation of the room effect, in millibels (mB). Interval: [-10000, 0] Default: -1000 mB
		\param lRoomHF Attenuation of the room high-frequency effect. Interval: [-10000, 0]      default: 0 mB
		\param flRoomRolloffFactor Rolloff factor for the reflected signals. Interval: [0.0, 10.0]      default: 0.0
		\param flDecayTime Decay time, in seconds. Interval: [0.1, 20.0]      default: 1.49s
		\param flDecayHFRatio Ratio of the decay time at high frequencies to the decay time at low frequencies. Interval: [0.1, 2.0]       default: 0.83
		\param lReflections Attenuation of early reflections relative to lRoom. Interval: [-10000, 1000]   default: -2602 mB
		\param flReflectionsDelay Delay time of the first reflection relative to the direct path in seconds. Interval: [0.0, 0.3]       default: 0.007 s
		\param lReverb Attenuation of late reverberation relative to lRoom, in mB. Interval: [-10000, 2000]   default: 200 mB
		\param flReverbDelay Time limit between the early reflections and the late reverberation relative to the time of the first reflection. Interval: [0.0, 0.1]       default: 0.011 s
		\param flDiffusion Echo density in the late reverberation decay in percent. Interval: [0.0, 100.0]     default: 100.0 %
		\param flDensity Modal density in the late reverberation decay, in percent. Interval: [0.0, 100.0]     default: 100.0 %
		\param flHFReference Reference high frequency, in hertz. Interval: [20.0, 20000.0]  default: 5000.0 Hz 
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableParamEqSoundEffect(System.Single,System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="205">
Parametric equalizer amplifies or attenuates signals of a given frequency. 
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fCenter Center frequency, in hertz, The default value is 8000. Minimal Value:80, Maximal Value:16000.0f
		\param fBandwidth Bandwidth, in semitones, The default value is 12. Minimal Value:1.0f, Maximal Value:36.0f
		\param fGain Gain, default value is 0. Minimal Value:-15.0f, Maximal Value:15.0f
		\return Returns true if successful. 
</member>
<member name="M:irrklang.ISoundEffectControl.enableWavesReverbSoundEffect(System.Single,System.Single,System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundeffectcontrol.h" line="222">
\param fInGain Input gain of signal, in decibels (dB). Min/Max: [-96.0,0.0] Default: 0.0 dB.
		If this sound effect is already enabled, calling this only modifies the parameters of the active effect.
		\param fReverbMix Reverb mix, in dB. Min/Max: [-96.0,0.0] Default: 0.0 dB
		\param fReverbTime Reverb time, in milliseconds. Min/Max: [0.001,3000.0] Default: 1000.0 ms
		\param fHighFreqRTRatio High-frequency reverb time ratio. Min/Max: [0.001,0.999] Default: 0.001 
		\return Returns true if successful. 
</member>
<member name="T:irrklang.ISound" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="19">
The sound can be stopped, its volume or pan changed, effects added/removed
	and similar using this interface.
	Creating sounds is done using ISoundEngine::play2D() or ISoundEngine::play3D(). 
	More informations about the source of a sound can be obtained from the ISoundSource
	interface. 
</member>
<member name="M:irrklang.ISound.getSoundSource" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="29">
\return Returns the sound source poitner of this sound. May return 0 if the sound source
		has been removed.
</member>
<member name="M:irrklang.ISound.stop" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="40">
If you just want to pause the sound, use setIsPaused().
		After calling stop(), isFinished() will usually return true. 
</member>
<member name="M:irrklang.ISound.getVolume" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="45">
(this volume gets multiplied with the master volume of the sound engine
		and other parameters like distance to listener when played as 3d sound)  
</member>
<member name="M:irrklang.ISound.setVolume(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="50">
This volume gets multiplied with the master volume of the sound engine
		and other parameters like distance to listener when played as 3d sound.  
</member>
<member name="M:irrklang.ISound.setIsLooped(System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="64">
If the sound is playing looped and it is changed to not-looped, then it 
		will stop playing after the loop has finished. 
		If it is not looped and changed to looped, the sound will start repeating to be 
		played when it reaches its end. 
		Invoking this method will not have an effect when the sound already has stopped. 
</member>
<member name="M:irrklang.ISound.isFinished" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="72">
Don't mix this up with isPaused(). isFinished() returns if the sound has been
		finished playing. If it has, is maybe already have been removed from the playing list of the
		sound engine and calls to any other of the methods of ISound will not have any result.
		If you call stop() to a playing sound will result that this function will return true
		when invoked. 
</member>
<member name="M:irrklang.ISound.setMinDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="80">
Changes the distance at which the 3D sound stops getting louder. This works
		like this: As a listener approaches a 3D sound source, the sound gets louder.
		Past a certain point, it is not reasonable for the volume to continue to increase.
		Either the maximum (zero) has been reached, or the nature of the sound source
		imposes a logical limit. This is the minimum distance for the sound source.
		Similarly, the maximum distance for a sound source is the distance beyond
		which the sound does not get any quieter.
		The default minimum distance is 1, the default max distance is a huge number like 1000000000.0f. 
</member>
<member name="M:irrklang.ISound.getMinDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="91">
See setMinDistance() for details. 
</member>
<member name="M:irrklang.ISound.setMaxDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="95">
Changing this value is usually not necessary. Use setMinDistance() instead.
		Don't change this value if you don't know what you are doing: This value causes the sound
		to stop attenuating after it reaches the max distance. Most people think that this sets the
		volume of the sound to 0 after this distance, but this is not true. Only change the
		minimal distance (using for example setMinDistance()) to influence this.
		The maximum distance for a sound source is the distance beyond which the sound does not get any quieter.
		The default minimum distance is 1, the default max distance is a huge number like 1000000000.0f. 
</member>
<member name="M:irrklang.ISound.getMaxDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="105">
See setMaxDistance() for details. 
</member>
<member name="M:irrklang.ISound.setVelocity(irrklang.vec3d&lt;System.Single&gt;)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="115">
To use doppler effects use ISound::setVelocity to set a sounds velocity, 
		ISoundEngine::setListenerPosition() to set the listeners velocity and 
		ISoundEngine::setDopplerEffectParameters() to adjust two parameters influencing 
		the doppler effects intensity. 
</member>
<member name="M:irrklang.ISound.getVelocity" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="122">
To use doppler effects use ISound::setVelocity to set a sounds velocity, 
		ISoundEngine::setListenerPosition() to set the listeners velocity and 
		ISoundEngine::setDopplerEffectParameters() to adjust two parameters influencing 
		the doppler effects intensity. 
</member>
<member name="M:irrklang.ISound.getPlayPosition" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="129">
\return Returns -1 if not implemented or possible for this sound for example
		because it already has been stopped and freed internally or similar. 
</member>
<member name="M:irrklang.ISound.setPlayPosition(System.UInt32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="134">
\param pos Position in milliseconds. Must be between 0 and the value returned
		by getPlayPosition().
		\return Returns true successful. False is returned for example if the sound already finished
		playing and is stopped or the audio source is not seekable, for example if it 
		is an internet stream or a a file format not supporting seeking (a .MOD file for example).
		A file can be tested if it can bee seeking using ISoundSource::getIsSeekingSupported(). 
</member>
<member name="M:irrklang.ISound.setPlaybackSpeed(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="143">
Plays the sound at a higher or lower speed, increasing or decreasing its
		frequency which makes it sound lower or higher.
		Note that this feature is not available on all sound output drivers (it is on the
		DirectSound drivers at least), and it does not work together with the 
		'enableSoundEffects' parameter of ISoundEngine::play2D and ISoundEngine::play3D when
		using DirectSound.
		\param speed Factor of the speed increase or decrease. 2 is twice as fast, 
		0.5 is only half as fast. The default is 1.0.
		\return Returns true if sucessful, false if not. The current sound driver might not
		support changing the playBack speed, or the sound was started with the 
		'enableSoundEffects' parameter. 
</member>
<member name="M:irrklang.ISound.getPlaybackSpeed" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="157">
See setPlaybackSpeed() for details 
</member>
<member name="M:irrklang.ISound.getPlayLength" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="161">
Returns -1 if not known for this sound for example because its decoder
		does not support length reporting or it is a file stream of unknown size.
		Note: You can also use ISoundSource::getPlayLength() to get the length of 
		a sound without actually needing to play it. 
</member>
<member name="M:irrklang.ISound.getSoundEffectControl" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="168">
Sound effects such as Chorus, Distorsions, Echo, Reverb and similar can
		be controlled using this. The interface pointer is only valid as long as the ISound pointer is valid.
		If the ISound pointer gets dropped (IVirtualRefCounted::drop()), the ISoundEffects
		may not be used any more. 
		\return Returns a pointer to the sound effects interface if available. The sound
		has to be started via ISoundEngine::play2D() or ISoundEngine::play3D(),
		with the flag enableSoundEffects=true, otherwise 0 will be returned. Note that
		if the output driver does not support sound effects, 0 will be returned as well.
</member>
<member name="M:irrklang.ISound.setSoundStopEventReceiver(irrklang.ISoundStopEventReceiver*,System.Void*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isound.h" line="179">
This event is guaranteed to be called when the sound or sound stream is finished,
		either because the sound reached its playback end, its sound source was removed,
		ISoundEngine::stopAllSounds() has been called or the whole engine was deleted.
		There is an example on how to use events in irrklang at @ref events .
		\param receiver Interface to a user implementation of the sound receiver. This interface
		should be as long valid as the sound exists or another stop event receiver is set.
		Set this to null to set no sound stop event receiver.
		\param userData: A iser data pointer, can be null. 
</member>
<member name="T:irrklang.IFileFactory" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_ifilefactory.h" line="15">
Derive your own class from IFileFactory, overwrite the createFileReader()
		method and return your own implemented IFileReader to overwrite file access of irrKlang.
		Use ISoundEngine::addFileFactory() to let irrKlang know about your class.
		Example code can be found in the tutorial 04.OverrideFileAccess.

</member>
<member name="M:irrklang.IFileFactory.createFileReader(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_ifilefactory.h" line="27">
Derive your own class from IFileFactory, overwrite this
		method and return your own implemented IFileReader to overwrite file access of irrKlang.
		Use ISoundEngine::addFileFactory() to let irrKlang know about your class.
		Example code can be found in the tutorial 04.OverrideFileAccess.
		\param filename Name of file to open.
		\return Returns a pointer to the created file interface.
		The returned pointer should be dropped when no longer needed.
		See IRefCounted::drop() for more information. Returns 0 if file cannot be opened. 
</member>
<member name="T:irrklang.ISoundEngine" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="22">
This is the main interface of irrKlang. You usually would create this using
	the createIrrKlangDevice() function. 

</member>
<member name="M:irrklang.ISoundEngine.getDriverName" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="30">
Possible returned strings are "NULL", "ALSA", "CoreAudio", "winMM", 
		"DirectSound" and "DirectSound8". 
</member>
<member name="M:irrklang.ISoundEngine.play2D(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Boolean,System.Boolean,System.Boolean,irrklang.E_STREAM_MODE,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="35">
\param sourceFileName Filename of sound, like "sounds/test.wav" or "foobar.ogg".
		 \param playLooped plays the sound in loop mode. If set to 'false', the sound is played once, then stopped and deleted from the internal playing list. Calls to
		 ISound have no effect after such a non looped sound has been stopped automaticly.
		 \param startPaused starts the sound paused. This implies that track=true. Use this if you want to modify some of the playing
		 parameters before the sound actually plays. Usually you would set this parameter to true, then use the ISound interface to
		 modify some of the sound parameters and then call ISound::setPaused(false);
		 Note: You need to call ISound::drop() when setting this parameter to true and you don't need the ISound
		 object anymore. See 'return' for details.
		 \param track Makes it possible to track the sound. Causes the method to return an ISound interface. See 'return' for details.
		 \param streamMode Specifies if the file should be streamed or loaded completely into memory for playing.
		 ESM_AUTO_DETECT sets this to autodetection. Note: if the sound has been loaded or played before into the
		 engine, this parameter has no effect.
		 \param enableSoundEffects Makes it possible to use sound effects such as chorus, distorsions, echo, 
		 reverb and similar for this sound. Sound effects can then be controlled via ISound::getSoundEffectControl().
		 Only enable if necessary. 
		 \return Only returns a pointer to an ISound if the parameters 'track', 'startPaused' or 
		 'enableSoundEffects' have been	 set to true. Note: if this method returns an ISound as result, 
		 you HAVE to call ISound::drop() after you don't need the ISound interface anymore. Otherwise this 
		 will cause memory waste. This method also may return 0 altough 'track', 'startPaused' or 
		 'enableSoundEffects' have been set to true, if the sound could not be played.
</member>
<member name="M:irrklang.ISoundEngine.play2D(irrklang.ISoundSource*,System.Boolean,System.Boolean,System.Boolean,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="63">
An ISoundSource object will be created internally when playing a sound the first time,
		or can be added with getSoundSource().
		\param source The sound source, specifiying sound file source and default settings for this file.
		Use the other ISoundEngine::play2D() overloads if you want to specify a filename string instead of this.
		\param playLooped plays the sound in loop mode. If set to 'false', the sound is played once, then stopped and deleted from the internal playing list. Calls to
		 ISound have no effect after such a non looped sound has been stopped automaticly.
		\param startPaused starts the sound paused. This implies that track=true. Use this if you want to modify some of the playing
		 parameters before the sound actually plays. Usually you would set this parameter to true, then use the ISound interface to
		 modify some of the sound parameters and then call ISound::setPaused(false);
		 Note: You need to call ISound::drop() when setting this parameter to true and you don't need the ISound
		 object anymore. See 'return' for details.
		 \param track Makes it possible to track the sound. Causes the method to return an ISound interface. See 'return' for details.
		 \param enableSoundEffects Makes it possible to use sound effects such as chorus, distorsions, echo, 
		 reverb and similar for this sound. Sound effects can then be controlled via ISound::getSoundEffectControl().
		 Only enable if necessary. 
		 \return Only returns a pointer to an ISound if the parameters 'track', 'startPaused' or 
		 'enableSoundEffects' have been	 set to true. Note: if this method returns an ISound as result, 
		 you HAVE to call ISound::drop() after you don't need the ISound interface anymore. Otherwise this 
		 will cause memory waste. This method also may return 0 altough 'track', 'startPaused' or 
		 'enableSoundEffects' have been set to true, if the sound could not be played.
</member>
<member name="M:irrklang.ISoundEngine.play3D(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,irrklang.vec3d&lt;System.Single&gt;,System.Boolean,System.Boolean,System.Boolean,irrklang.E_STREAM_MODE,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="90">
There is some example code on how to work with 3D sound at @ref sound3d.
		\param sourceFileName Filename of sound, like "sounds/test.wav" or "foobar.ogg".
		 \param pos Position of the 3D sound.
		 \param playLooped plays the sound in loop mode. If set to 'false', the sound is played once, then stopped and deleted from the internal playing list. Calls to
		 ISound have no effect after such a non looped sound has been stopped automaticly.
		 \param startPaused starts the sound paused. This implies that track=true. Use this if you want to modify some of the playing
		 parameters before the sound actually plays. Usually you would set this parameter to true, then use the ISound interface to
		 modify some of the sound parameters and then call ISound::setPaused(false);
		 Note: You need to call ISound::drop() when setting this parameter to true and you don't need the ISound
		 object anymore. See 'return' for details.
		 \param track Makes it possible to track the sound. Causes the method to return an ISound interface. See 'return' for details.
 		 \param streamMode Specifies if the file should be streamed or loaded completely into memory for playing.
		 ESM_AUTO_DETECT sets this to autodetection. Note: if the sound has been loaded or played before into the
		 engine, this parameter has no effect.
		 \param enableSoundEffects Makes it possible to use sound effects such as chorus, distorsions, echo, 
		 reverb and similar for this sound. Sound effects can then be controlled via ISound::getSoundEffectControl().
		 Only enable if necessary. 
		 \return Only returns a pointer to an ISound if the parameters 'track', 'startPaused' or 
		 'enableSoundEffects' have been	 set to true. Note: if this method returns an ISound as result, 
		 you HAVE to call ISound::drop() after you don't need the ISound interface anymore. Otherwise this 
		 will cause memory waste. This method also may return 0 altough 'track', 'startPaused' or 
		 'enableSoundEffects' have been set to true, if the sound could not be played.
</member>
<member name="M:irrklang.ISoundEngine.play3D(irrklang.ISoundSource*,irrklang.vec3d&lt;System.Single&gt;,System.Boolean,System.Boolean,System.Boolean,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="120">
An ISoundSource object will be created internally when playing a sound the first time,
		or can be added with getSoundSource(). There is some example code on how to work with 3D sound @ref sound3d.
		\param source The sound source, specifiying sound file source and default settings for this file.
		Use the other ISoundEngine::play2D() overloads if you want to specify a filename string instead of this.
		\param pos Position of the 3D sound.
		\param playLooped plays the sound in loop mode. If set to 'false', the sound is played once, then stopped and deleted from the internal playing list. Calls to
		 ISound have no effect after such a non looped sound has been stopped automaticly.
		\param startPaused starts the sound paused. This implies that track=true. Use this if you want to modify some of the playing
		 parameters before the sound actually plays. Usually you would set this parameter to true, then use the ISound interface to
		 modify some of the sound parameters and then call ISound::setPaused(false);
		 Note: You need to call ISound::drop() when setting this parameter to true and you don't need the ISound
		 object anymore. See 'return' for details.
		 \param track Makes it possible to track the sound. Causes the method to return an ISound interface. See 'return' for details.
		 \param enableSoundEffects Makes it possible to use sound effects such as chorus, distorsions, echo, 
		 reverb and similar for this sound. Sound effects can then be controlled via ISound::getSoundEffectControl().
		 Only enable if necessary. 
		 \return Only returns a pointer to an ISound if the parameters 'track', 'startPaused' or 
		 'enableSoundEffects' have been	 set to true. Note: if this method returns an ISound as result, 
		 you HAVE to call ISound::drop() after you don't need the ISound interface anymore. Otherwise this 
		 will cause memory waste. This method also may return 0 altough 'track', 'startPaused' or 
		 'enableSoundEffects' have been set to true, if the sound could not be played.
</member>
<member name="M:irrklang.ISoundEngine.getSoundSource(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="154">
Please note: For performance reasons most ISoundEngine implementations will
		not try to load the sound when calling this method, but only when play() is called
		with this sound source as parameter. 
		\param addIfNotFound if 'true' adds the sound source to the list and returns the interface to it
		if it cannot be found in the sound source list. If 'false', returns 0 if the sound
		source is not in the list and does not modify the list. Default value: true.
		\return Returns the sound source or 0 if not available.
		Note: Don't call drop() to this pointer, it will be managed by irrKlang and
		exist as long as you don't delete irrKlang or call removeSoundSource(). However,
		you are free to call grab() if you want and drop() it then later of course. 
</member>
<member name="M:irrklang.ISoundEngine.getSoundSource(System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="167">
\param idx: Index of the loaded sound source, must by smaller than getSoundSourceCount().
		\return Returns the sound source or 0 if not available.
		Note: Don't call drop() to this pointer, it will be managed by irrKlang and
		exist as long as you don't delete irrKlang or call removeSoundSource(). However,
		you are free to call grab() if you want and drop() it then later of course. 
</member>
<member name="M:irrklang.ISoundEngine.addSoundSourceFromFile(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,irrklang.E_STREAM_MODE,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="178">
\param fileName Name of the sound file (e.g. "sounds/something.mp3"). You can also use this
		name when calling play3D() or play2D().
		\param mode Streaming mode for this sound source
		\param preload If this flag is set to false (which is default) the sound engine will
		not try to load the sound file when calling this method, but only when play() is called
		with this sound source as parameter. Otherwise the sound will be preloaded.
		\return Returns the pointer to the added sound source or 0 if not sucessful because for
		example a sound already existed with that name. If not successful, the reason will be printed
		into the log. Note: Don't call drop() to this pointer, it will be managed by irrKlang and
		exist as long as you don't delete irrKlang or call removeSoundSource(). However,
		you are free to call grab() if you want and drop() it then later of course. 
</member>
<member name="M:irrklang.ISoundEngine.addSoundSourceFromMemory(System.Void*,System.Int32,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="193">
Note: This method only accepts a file (.wav, .ogg, etc) which is totally loaded into memory.
		If you want to add a sound source from decoded plain PCM data in memory, use addSoundSourceFromPCMData() instead.
		\param memory Pointer to the memory to be treated as loaded sound file.
		\param sizeInBytes Size of the memory chunk, in bytes.
		\param soundName Name of the virtual sound file (e.g. "sounds/something.mp3"). You can also use this
		name when calling play3D() or play2D(). Hint: If you include the extension of the original file
		like .ogg, .mp3 or .wav at the end of the filename, irrKlang will be able to decide better what
		file format it is and might be able to start playback faster.
		\param copyMemory If set to true which is default, the memory block is copied 
		and stored in the engine, after	calling addSoundSourceFromMemory() the memory pointer can be deleted
		savely. If set to false, the memory is not copied and the user takes the responsibility that 
		the memory block pointed to remains there as long as the sound engine or at least this sound
		source exists.
		\return Returns the pointer to the added sound source or 0 if not sucessful because for
		example a sound already existed with that name. If not successful, the reason will be printed
		into the log. 
</member>
<member name="M:irrklang.ISoundEngine.addSoundSourceFromPCMData(System.Void*,System.Int32,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,irrklang.SAudioStreamFormat,System.Boolean)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="214">
\param memory Pointer to the memory to be treated as loaded sound file.
		\param sizeInBytes Size of the memory chunk, in bytes. 
		\param soundName Name of the virtual sound file (e.g. "sounds/something.mp3"). You can also use this
		name when calling play3D() or play2D(). 
		\param copyMemory If set to true which is default, the memory block is copied 
		and stored in the engine, after	calling addSoundSourceFromPCMData() the memory pointer can be deleted
		savely. If set to true, the memory is not copied and the user takes the responsibility that 
		the memory block pointed to remains there as long as the sound engine or at least this sound
		source exists. 
		\return Returns the pointer to the added sound source or 0 if not sucessful because for
		example a sound already existed with that name. If not successful, the reason will be printed
		into the log. 
</member>
<member name="M:irrklang.ISoundEngine.addSoundSourceAlias(irrklang.ISoundSource*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="231">
This is useful if you want to play multiple sounds but each sound isn't necessarily one single file.
		Also useful if you want to or play the same sound using different names, volumes or min and max 3D distances.
		\param baseSource The sound source where this sound source should be based on. This sound
		source will use the baseSource as base to access the file and similar, but it will have its
		own name and its own default settings.
		\param soundName Name of the new sound source to be added.
		\return Returns the pointer to the added sound source or 0 if not sucessful because for
		example a sound already existed with that name. If not successful, the reason will be printed
		into the log.
</member>
<member name="M:irrklang.ISoundEngine.removeSoundSource(irrklang.ISoundSource*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="243">
This will also cause all currently playing sounds of this source to be stopped. 
		Also note that if the source has been removed successfully, the value returned 
		by getSoundSourceCount() will have been decreased by one. 
		Removing sound sources is only necessary if you know you won't use a lot of non-streamed
		sounds again. Sound sources of streamed sounds do not cost a lot of memory.
</member>
<member name="M:irrklang.ISoundEngine.removeSoundSource(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="251">
This will also cause all currently playing sounds of this source to be stopped. 
		Also note that if the source has been removed successfully, the value returned 
		by getSoundSourceCount() will have been decreased by one. 
		Removing sound sources is only necessary if you know you won't use a lot of non-streamed
		sounds again. Sound sources of streamed sounds do not cost a lot of memory. 
</member>
<member name="M:irrklang.ISoundEngine.removeAllSoundSources" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="259">
This will also cause all sounds to be stopped. 
		Removing sound sources is only necessary if you know you won't use a lot of non-streamed
		sounds again. Sound sources of streamed sounds do not cost a lot of memory. 
</member>
<member name="M:irrklang.ISoundEngine.setSoundVolume(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="265">
\param volume 0 (silent) to 1.0f (full volume) 
</member>
<member name="M:irrklang.ISoundEngine.setListenerPosition(irrklang.vec3d&lt;System.Single&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,irrklang.vec3d&lt;System.Single&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,irrklang.vec3d&lt;System.Single&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,irrklang.vec3d&lt;System.Single&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="273">
When playing sounds in 3D, updating the position of the listener every frame should be
		done using this function.
		\param pos Position of the camera or listener.
		\param lookdir Direction vector where the camera or listener is looking into. If you have a 
		camera position and a target 3d point where it is looking at, this would be cam-&gt;getTarget() - cam-&gt;getAbsolutePosition().
		\param velPerSecond The velocity per second describes the speed of the listener and 
		is only needed for doppler effects.
		\param upvector Vector pointing 'up', so the engine can decide where is left and right. 
		This vector is usually (0,1,0).
</member>
<member name="M:irrklang.ISoundEngine.update" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="288">
This updates the 3d positions of the sounds as well as their volumes, effects,
		streams and other stuff. Call this several times per frame (the more the better) if you
		specified irrKlang to run single threaded. Otherwise it is not necessary to use this method.
		This method is being called by the scene manager automaticly if you are using one, so
		you might want to ignore this. 
</member>
<member name="M:irrklang.ISoundEngine.registerAudioStreamLoader(irrklang.IAudioStreamLoader*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="302">
Use this to enhance the audio engine to support other or new file formats.
		To do this, implement your own IAudioStreamLoader interface and register it
		with this method 
</member>
<member name="M:irrklang.ISoundEngine.isMultiThreaded" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="308">
This basicly returns the flag set by the user when creating the sound engine.
</member>
<member name="M:irrklang.ISoundEngine.addFileFactory(irrklang.IFileFactory*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="312">
Derive your own class from IFileFactory, overwrite the createFileReader()
		method and return your own implemented IFileReader to overwrite file access of irrKlang. 
</member>
<member name="M:irrklang.ISoundEngine.setDefault3DSoundMinDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="317">
 This value influences how loud a sound is heard based on its distance.
		See ISound::setMinDistance() for details about what the min distance is.
		It is also possible to influence this default value for every sound file 
		using ISoundSource::setDefaultMinDistance().
		This method only influences the initial distance value of sounds. For changing the
		distance after the sound has been started to play, use ISound::setMinDistance() and ISound::setMaxDistance().
		\param minDistance Default minimal distance for 3d sounds. The default value is 1.0f.
</member>
<member name="M:irrklang.ISoundEngine.getDefault3DSoundMinDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="327">
 This value influences how loud a sound is heard based on its distance.
		You can change it using setDefault3DSoundMinDistance().
		See ISound::setMinDistance() for details about what the min distance is.
		It is also possible to influence this default value for every sound file 
		using ISoundSource::setDefaultMinDistance().
		\return Default minimal distance for 3d sounds. The default value is 1.0f. 
</member>
<member name="M:irrklang.ISoundEngine.setDefault3DSoundMaxDistance(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="336">
Changing this value is usually not necessary. Use setDefault3DSoundMinDistance() instead.
		Don't change this value if you don't know what you are doing: This value causes the sound
		to stop attenuating after it reaches the max distance. Most people think that this sets the
		volume of the sound to 0 after this distance, but this is not true. Only change the
		minimal distance (using for example setDefault3DSoundMinDistance()) to influence this.
		See ISound::setMaxDistance() for details about what the max distance is.
		It is also possible to influence this default value for every sound file 
		using ISoundSource::setDefaultMaxDistance().
		This method only influences the initial distance value of sounds. For changing the
		distance after the sound has been started to play, use ISound::setMinDistance() and ISound::setMaxDistance().
		\param maxDistance Default maximal distance for 3d sounds. The default value is 1000000000.0f. 
</member>
<member name="M:irrklang.ISoundEngine.getDefault3DSoundMaxDistance" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="350">
 This value influences how loud a sound is heard based on its distance.
		You can change it using setDefault3DSoundmaxDistance(), but 
		changing this value is usually not necessary. This value causes the sound
		to stop attenuating after it reaches the max distance. Most people think that this sets the
		volume of the sound to 0 after this distance, but this is not true. Only change the
		minimal distance (using for example setDefault3DSoundMinDistance()) to influence this.
		See ISound::setMaxDistance() for details about what the max distance is.
		It is also possible to influence this default value for every sound file 
		using ISoundSource::setDefaultMaxDistance().
		\return Default maximal distance for 3d sounds. The default value is 1000000000.0f. 
</member>
<member name="M:irrklang.ISoundEngine.setRolloffFactor(System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="363">
The rolloff factor can range from 0.0 to 10.0, where 0 is no rolloff. 1.0 is the default 
		rolloff factor set, the value which we also experience in the real world. A value of 2 would mean
		twice the real-world rolloff. 
</member>
<member name="M:irrklang.ISoundEngine.setDopplerEffectParameters(System.Single,System.Single)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="369">
\param dopplerFactor is a value between 0 and 10 which multiplies the doppler 
		effect. Default value is 1.0, which is the real world doppler effect, and 10.0f 
		would be ten times the real world doppler effect.
		\param distanceFactor is the number of meters in a vector unit. The default value
		is 1.0. Doppler effects are calculated in meters per second, with this parameter,
		this can be changed, all velocities and positions are influenced by this. If
		the measurement should be in foot instead of meters, set this value to 0.3048f
		for example.
</member>
<member name="M:irrklang.ISoundEngine.loadPlugins(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="380">
Plugins usually are .dll, .so or .dylib
		files named for example ikpMP3.dll (= short for irrKlangPluginMP3) which
		make it possible to play back mp3 files. Plugins are being 
		loaded from the current working directory at startup of the sound engine
		if the parameter ESEO_LOAD_PLUGINS is set (which it is by default), but
		using this method, it is possible to load plugins from a custom path in addition. 
		\param path Path to the plugin directory, like "C:\games\somegamegame\irrklangplugins".
		\return returns true if sucessful or fals if not, for example because the path could 
		not be found. 
</member>
<member name="M:irrklang.ISoundEngine.getInternalAudioInterface" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="392">
Use this with caution. This is only exposed to make it possible for other libraries
		such as Video playback packages to extend or use the sound driver irrklang uses. 
</member>
<member name="T:irrklang.SInternalAudioInterface" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundengine.h" line="399">
Use ISoundEngine::getInternalAudioInterface() to get this. 
</member>
<member name="M:irrklang.IAudioStream.setPosition(System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiostream.h" line="27">
For example to let the stream be read from the beginning of the file again, 
	setPosition(0) would be called. This is usually done be the sound engine to
	loop a stream after if has reached the end. Return true if sucessful and 0 if not. 
	\param pos: Position in frames.
</member>
<member name="M:irrklang.IAudioStream.readFrames(System.Void*,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiostream.h" line="38">
\param target: Target data buffer to the method will write the read frames into. The
	specified buffer will be at least getFormat().getFrameSize()*frameCountToRead bytes big.
	\param frameCountToRead: amount of frames to be read.
	\returns Returns amount of frames really read. Should be frameCountToRead in most cases. 
</member>
<member name="M:irrklang.IAudioStreamLoader.isALoadableFileExtension(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiostreamloader.h" line="25">
This decision should be based only on the file extension (e.g. ".wav"). The given
	filename string is guaranteed to be lower case. 
</member>
<member name="M:irrklang.IAudioStreamLoader.createAudioStream(irrklang.IFileReader*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiostreamloader.h" line="30">
\return Pointer to the created audio stream. Returns 0 if loading failed.
	If you no longer need the stream, you should call IAudioFileStream::drop().
	See IRefCounted::drop() for more information. 
</member>
<member name="T:irrklang.ISoundStopEventReceiver" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundstopeventreceiver.h" line="36">
The interface has only one method to be implemented by the user: OnSoundStopped().
Implement this interface and set it via ISound::setSoundStopEventReceiver().
The sound stop event is guaranteed to be called when a sound or sound stream is finished,
either because the sound reached its playback end, its sound source was removed,
ISoundEngine::stopAllSounds() has been called or the whole engine was deleted. 
</member>
<member name="M:irrklang.ISoundStopEventReceiver.OnSoundStopped(irrklang.ISound*,irrklang.E_STOP_EVENT_CAUSE,System.Void*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isoundstopeventreceiver.h" line="49">
This is the only method to be implemented by the user.
	The sound stop event is guaranteed to be called when a sound or sound stream is finished,
	either because the sound reached its playback end, its sound source was removed,
	ISoundEngine::stopAllSounds() has been called or the whole engine was deleted.
	Please note: Sound events will occur in a different thread when the engine runs in
	multi threaded mode (default). In single threaded mode, the event will happen while
	the user thread is calling ISoundEngine::update().
	\param sound: Sound which has been stopped. 
	\param reason: The reason why the sound stop event was fired. Usually, this will be ESEC_SOUND_FINISHED_PLAYING.
	When the sound was aborded by calling ISound::stop() or ISoundEngine::stopAllSounds();, this would be 
	ESEC_SOUND_STOPPED_BY_USER. If irrKlang was deleted or the sound source was removed, the value is 
	ESEC_SOUND_STOPPED_BY_SOURCE_REMOVAL.
	\param userData: userData pointer set by the user when registering the interface
	via ISound::setSoundStopEventReceiver(). 
</member>
<member name="T:irrklang.ISoundDeviceList" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isounddevicelist.h" line="14">
The function createIrrKlangDevice() has a parameter 'deviceID' which takes the value returned by
ISoundDeviceList::getDeviceID() and uses that device then. 
The list of devices in ISoundDeviceList usually also includes the default device which is the first
entry and has an empty deviceID string ("") and the description "default device". 
There is some example code on how to use the ISoundDeviceList in @ref enumeratingDevices.
</member>
<member name="M:irrklang.ISoundDeviceList.getDeviceID(System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isounddevicelist.h" line="27">
\param index Index of the device, a value between 0 and ISoundDeviceList::getDeviceCount()-1. 
	\return Returns a pointer to a string identifying the device. The string will only as long valid 
	as long as the ISoundDeviceList exists. 
</member>
<member name="M:irrklang.ISoundDeviceList.getDeviceDescription(System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_isounddevicelist.h" line="33">
\param index Index of the device, a value between 0 and ISoundDeviceList::getDeviceCount()-1. 
</member>
<member name="T:irrklang.IAudioRecorder" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="17">
It creates sound sources into an ISoundEngine which then can be played there. 
	See @ref recordingAudio for an example on how to use this. 
</member>
<member name="M:irrklang.IAudioRecorder.startRecordingBufferedAudio(System.Int32,irrklang.ESampleFormat,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="24">
Clears all possibly previously recorded buffered audio data and starts to record. 
		When finished recording audio data, call stopRecordingAudio(). 
		All recorded audio data gets stored into an internal audio buffer, which
		can then be accessed for example using addSoundSourceFromRecordedAudio() or
		getRecordedAudioData(). For recording audio data not into an internal audio
		buffer, use startRecordingCustomHandledAudio().
		\param sampleRate: Sample rate of the recorded audio.
		\param sampleFormat: Sample format of the recorded audio.
		\param channelCount: Amount of audio channels.
		\return Returns true if successfully started recording and false if not.
</member>
<member name="M:irrklang.IAudioRecorder.startRecordingCustomHandledAudio(irrklang.ICapturedAudioDataReceiver*,System.Int32,irrklang.ESampleFormat,System.Int32)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="39">
Clears all possibly previously recorded buffered audio data and starts to record 
		audio data, which is delivered to a custom user callback interface. 
		When finished recording audio data, call stopRecordingAudio(). If instead of 
		recording the data to the receiver interface recording into a managed buffer
		is wished, use startRecordingBufferedAudio() instead.
		\param receiver: Interface to be implemented by the user, gets called once for each
		captured audio data chunk. 
		\param sampleRate: Sample rate of the recorded audio.
		\param sampleFormat: Sample format of the recorded audio.
		\param channelCount: Amount of audio channels.
		\return Returns true if successfully started recording and false if not. 
</member>
<member name="M:irrklang.IAudioRecorder.addSoundSourceFromRecordedAudio(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="59">
The returned sound source pointer then can be used to play back the recorded audio data
		using ISoundEngine::play2D(). This method only will succeed if the audio was recorded using
		startRecordingBufferedAudio() and audio recording is currently stopped.
		\param soundName Name of the virtual sound file (e.g. "someRecordedAudio"). You can also use this
		name when calling play3D() or play2D().  
</member>
<member name="M:irrklang.IAudioRecorder.clearRecordedAudioDataBuffer" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="67">
This method will only succeed if audio recording is currently stopped. 
</member>
<member name="M:irrklang.IAudioRecorder.getAudioFormat" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="74">
Also contains informations about the length of the recorded audio stream. 
</member>
<member name="M:irrklang.IAudioRecorder.getRecordedAudioData" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="78">
This method will only succeed if audio recording is currently stopped and
		something was recorded previously using startRecordingBufferedAudio(). 
		The lenght of the buffer can be retrieved using 
		getAudioFormat().getSampleDataSize(). Note that the pointer is only valid
		as long as not clearRecordedAudioDataBuffer() is called or another sample is
		recorded.
</member>
<member name="M:irrklang.IAudioRecorder.getDriverName" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="87">
Possible returned strings are "NULL", "ALSA", "CoreAudio", "winMM", 
		"DirectSound" and "DirectSound8". 
</member>
<member name="T:irrklang.ICapturedAudioDataReceiver" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="94">
Is used as parameter in IAudioRecorder::startRecordingCustomHandledAudio. 
</member>
<member name="M:irrklang.ICapturedAudioDataReceiver.OnReceiveAudioDataStreamChunk(System.Byte*,System.UInt32!System.Runtime.CompilerServices.IsLong)" decl="false" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\ik_iaudiorecorder.h" line="100">
See IAudioRecorder::startRecordingCustomHandledAudio for details.
		\param audioData: Pointer to a part of the recorded audio data
		\param lengthInBytes: Amount of bytes in the audioData buffer.
</member>
<member name="M:irrklang.createIrrKlangDevice(irrklang.E_SOUND_OUTPUT_DRIVER,System.Int32,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\irrklang.h" line="877">
\param driver The sound output driver to be used for sound output. Use irrklang::ESOD_AUTO_DETECT
	to let irrKlang decide which driver will be best.
	\param options A combination of irrklang::E_SOUND_ENGINE_OPTIONS literals. Default value is 
	irrklang::ESEO_DEFAULT_OPTIONS.
	\param deviceID Some additional optional deviceID for the audio driver. If not needed, simple
	set this to 0. 
	This can be used for example to set a specific ALSA output pcm device for output
	("default" or "hw", for example). For most driver types, available deviceIDs can be 
	enumerated using createSoundDeviceList().
	See @ref enumeratingDevices for an example or ISoundDeviceList or details.
	\param sdk_version_do_not_use Don't use or change this parameter. Always set it to
	IRRKLANG_SDK_VERSION, which is done by default. This is needed for sdk version checks.
	\return Returns pointer to the created irrKlang device or null if the
	device could not be created. If you don't need the device, use ISoundEngine::drop() to
	delete it. See IRefCounted::drop() for details.

</member>
<member name="M:irrklang.createSoundDeviceList(irrklang.E_SOUND_OUTPUT_DRIVER,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\irrklang.h" line="901">
The device IDs in this list can be used as parameter to createIrrKlangDevice() to
	make irrKlang use a special sound device. See @ref enumeratingDevices for an example on how
	to use this.
	\param driver The sound output driver of which the list is generated. Set it irrklang::ESOD_AUTO_DETECT
	to let this function use the same device as createIrrKlangDevice() would choose.
	\param sdk_version_do_not_use Don't use or change this parameter. Always set it to
	IRRKLANG_SDK_VERSION, which is done by default. This is needed for sdk version checks.
	\return Returns a pointer to the list of enumerated sound devices for the selected sound driver.
	The device IDs in this list can be used as parameter to createIrrKlangDevice() to
	make irrKlang use a special sound device. 
	After you don't need the list anymore, call ISoundDeviceList::drop() in order to free its memory. 
</member>
<member name="M:irrklang.createIrrKlangAudioRecorder(irrklang.ISoundEngine*,irrklang.E_SOUND_OUTPUT_DRIVER,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\irrklang.h" line="918">
If you want to play back recorded audio as well, create the ISoundEngine first using
	createIrrKlangDevice() and then the IAudioRecorder using createIrrKlangAudioRecorder(), where
	you set the ISoundEngine as first parameter. See @ref recordingAudio for an example on how to use this.
	Note: audio recording is a very new feature a still beta in irrKlang. It currently only works in Windows
	and with DirectSound (subject to change).
	\param irrKlangDeviceForPlayback A pointer to the already existing sound device used for playback
	of audio. Sound sources recorded with the IAudioRecorder will be added into that device so that
	they can be played back there.
	\param driver The sound output driver to be used for recording audio. Use irrklang::ESOD_AUTO_DETECT
	to let irrKlang decide which driver will be best.
	\param deviceID Some additional optional deviceID for the audio driver. If not needed, simple
	set this to 0. Use createAudioRecorderDeviceList() to get a list of all deviceIDs.
	\param sdk_version_do_not_use Don't use or change this parameter. Always set it to
	IRRKLANG_SDK_VERSION, which is done by default. This is needed for sdk version checks.
	\return Returns pointer to the created irrKlang device or null if the
	device could not be created. If you don't need the device, use ISoundEngine::drop() to
	delete it. See IRefCounted::drop() for details.

</member>
<member name="M:irrklang.createAudioRecorderDeviceList(irrklang.E_SOUND_OUTPUT_DRIVER,System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="f:\[files]\xp documents\my dropbox\carnivoressource\carnivores-src_minorenhanced_build\engine\irrklang\irrklang.h" line="943">
The device IDs in this list can be used as parameter to createIrrKlangAudioRecorder() to
	make irrKlang use a special recording device. 
	\param driver The sound output driver of which the list is generated. Set it irrklang::ESOD_AUTO_DETECT
	to let this function use the same device as createIrrKlangDevice() would choose.
	\param sdk_version_do_not_use Don't use or change this parameter. Always set it to
	IRRKLANG_SDK_VERSION, which is done by default. This is needed for sdk version checks.
	\return Returns a pointer to the list of enumerated recording devices for the selected sound driver.
	The device IDs in this list can be used as parameter to createIrrKlangAudioRecorder() to
	make irrKlang use a special sound device. 
	After you don't need the list anymore, call ISoundDeviceList::drop() in order to free its memory. 
</member>
</members>
</doc>
