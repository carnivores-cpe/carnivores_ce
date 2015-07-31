// == XML file parser == //
// -> 4.18.09

// -> For more flexable data loading from xml files

#include "IrrXML1.2/irrXML.h"
using namespace irr;
using namespace io;

#include <string> // we use STL strings to store data in this example

int ProcessXML(char fname[128])
{
	IrrXMLReader* xml = createIrrXMLReader(fname);

	// strings for storing the data we want to get out of the file
	std::string modelFile;
	std::string messageText;
	std::string caption;

	// parse the file until end reached
	while(xml && xml->read())
	{
		switch(xml->getNodeType())
		{
		case EXN_TEXT:
			// in this xml file, the only text which occurs is the messageText
			messageText = xml->getNodeData();
			break;
		case EXN_ELEMENT:
			{
				if (!strcmp("startUpModel", xml->getNodeName()))
					modelFile = xml->getAttributeValue("file");
				else
				if (!strcmp("messageText", xml->getNodeName()))
					caption = xml->getAttributeValue("caption");
			}
			break;
		}
	}

	// delete the xml parser after usage
	delete xml;
	return 0;
}
