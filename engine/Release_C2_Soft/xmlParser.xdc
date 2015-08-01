<?xml version="1.0"?><doc>
<members>
<member name="T:irr.io.IFileReadCallBack" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="205">
With this, it is possible to make the xml parser read in other things 
	than just files. The Irrlicht engine is using this for example to 
	read xml from compressed .zip files. To make the parser read in 
	any other data, derive a class from this interface, implement the 
	two methods to read your data and give a pointer to an instance of
	your implementation when calling createIrrXMLReader(), 
	createIrrXMLReaderUTF16() or createIrrXMLReaderUTF32() 
</member>
<member name="M:irr.io.IFileReadCallBack.read(System.Void*,System.Int32)" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="220">
\param buffer: Pointer to buffer where to read bytes will be written to.
		\param sizeToRead: Amount of bytes to read from the file.
		\return Returns how much bytes were read. 
</member>
<!-- Discarding badly formed XML document comment for member 'T:irr.io.IXMLBase'. -->
<member name="D:irr.io.char16" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="369">
Not using wchar_t for this because 
	wchar_t has 16 bit on windows and 32 bit on other operating systems. 
</member>
<member name="D:irr.io.char32" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="374">
Not using wchar_t for this because 
	wchar_t has 16 bit on windows and 32 bit on other operating systems. 
</member>
<member name="D:irr.io.IrrXMLReader" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="379">
This means that all character data will be returned in 8 bit ASCII or UTF-8 by this parser. 
	The file to read can be in any format, it will be converted to UTF-8 if it is not
	in this format.
	Create an instance of this with createIrrXMLReader(); 
	See IIrrXMLReader for description on how to use it. 
</member>
<member name="D:irr.io.IrrXMLReaderUTF16" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="387">
This means that all character data will be returned in UTF-16 by this parser. 
	The file to read can be in any format, it will be converted to UTF-16 if it is not
	in this format.
	Create an instance of this with createIrrXMLReaderUTF16(); 
	See IIrrXMLReader for description on how to use it.  
</member>
<member name="D:irr.io.IrrXMLReaderUTF32" decl="false" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="395">
This means that all character data will be returned in UTF-32 by this parser. 
	The file to read can be in any format, it will be converted to UTF-32 if it is not
	in this format.
	Create an instance of this with createIrrXMLReaderUTF32(); 
	See IIrrXMLReader for description on how to use it. 
</member>
<member name="M:irr.io.createIrrXMLReader(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="404">
This means that all character data will be returned in 8 bit ASCII or UTF-8. 
	The file to read can be in any format, it will be converted to UTF-8 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReaderUTF8() instead.
	\param filename: Name of file to be opened.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReader(_iobuf*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="415">
This means that all character data will be returned in 8 bit ASCII or UTF-8. The file to read can 
	be in any format, it will be converted to UTF-8 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReaderUTF8() instead.
	\param file: Pointer to opened file, must have been opened in binary mode, e.g.
	using fopen("foo.bar", "wb"); The file will not be closed after it has been read.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReader(irr.io.IFileReadCallBack*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="427">
This means that all character data will be returned in 8 bit ASCII or UTF-8. The file to read can 
	 be in any format, it will be converted to UTF-8 if it is not in this format.
	 If you are using the Irrlicht Engine, it is better not to use this function but
	 IFileSystem::createXMLReaderUTF8() instead.
	 \param callback: Callback for file read abstraction. Implement your own
	 callback to make the xml parser read in other things than just files. See
	 IFileReadCallBack for more information about this.
	 \return Returns a pointer to the created xml parser. This pointer should be 
	 deleted using 'delete' after no longer needed. Returns 0 if an error occured
	 and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF16(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="440">
This means that
	all character data will be returned in UTF-16. The file to read can 
	be in any format, it will be converted to UTF-16 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param filename: Name of file to be opened.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF16(_iobuf*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="452">
This means that all character data will be returned in UTF-16. The file to read can 
	be in any format, it will be converted to UTF-16 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param file: Pointer to opened file, must have been opened in binary mode, e.g.
	using fopen("foo.bar", "wb"); The file will not be closed after it has been read.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF16(irr.io.IFileReadCallBack*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="464">
This means that all character data will be returned in UTF-16. The file to read can 
	be in any format, it will be converted to UTF-16 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param callback: Callback for file read abstraction. Implement your own
	callback to make the xml parser read in other things than just files. See
	IFileReadCallBack for more information about this.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF32(System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte!System.Runtime.CompilerServices.IsConst*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="478">
This means that all character data will be returned in UTF-32. The file to read can 
	be in any format, it will be converted to UTF-32 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param filename: Name of file to be opened.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF32(_iobuf*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="489">
This means that all character data will be returned in UTF-32. The file to read can 
	be in any format, it will be converted to UTF-32 if it is not in this format.
	if you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param file: Pointer to opened file, must have been opened in binary mode, e.g.
	using fopen("foo.bar", "wb"); The file will not be closed after it has been read.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
<member name="M:irr.io.createIrrXMLReaderUTF32(irr.io.IFileReadCallBack*)" decl="true" source="\\psf\home\downloads\carnivores-src_minorenhanced_build\engine\irrxml1.2\irrxml.h" line="501">
This means that
	all character data will be returned in UTF-32. The file to read can 
	be in any format, it will be converted to UTF-32 if it is not in this format.
	If you are using the Irrlicht Engine, it is better not to use this function but
	IFileSystem::createXMLReader() instead.
	\param callback: Callback for file read abstraction. Implement your own
	callback to make the xml parser read in other things than just files. See
	IFileReadCallBack for more information about this.
	\return Returns a pointer to the created xml parser. This pointer should be 
	deleted using 'delete' after no longer needed. Returns 0 if an error occured
	and the file could not be opened. 
</member>
</members>
</doc>