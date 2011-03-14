//////////////////////////////////////////////////////////////////
//  NOTE:  This file will modify a logical model xmi (named 
//         "cbmSpaces.xmi) to create an xmi file in which all 
//         of the spaces are removed from class names and attribute 
//         names in the logical modelfile (not local value domains) 
//         and replaced with camelCase input file:  cbmtest.xmi
//		  **Note:  logical model must be in a file called "LogicalModel"
//         output file:  camelCase.xmi
/////////////////////////////////////////////////////////////////

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
using namespace std;

 string toCamelCase( string text )
{
    size_t position;
    int textLength = text.length() - 1;
    string returnText;
    string tempText;

    position = text.find( ' ' );
    while ( ( position < textLength ) && ( position != string::npos ) )
    {
	tempText = text.substr( position + 1 );
	text.erase( position );	// deletes the space
	text.append(tempText);
	text[position] = toupper( text[position] );
	position = text.find( ' ', position );
	--textLength;
    }  
    returnText.assign( text, 0, textLength + 1 );
    return returnText;
}; 

main (void){
    string line;
    size_t position;
    bool inLogicalModel(false);

    ifstream original_file( "cbmSpaces.xmi" );
    ofstream output_file( "camelCase.xmi" );

    while ( getline( original_file, line ) ) 
    {
	char* charLine = new char[128];
	size_t line_length;

	// Test to see if we have changed state of being in the logical model code
      if ( !inLogicalModel )
	{
	    position = line.find( "UML:Package name=\"LogicalModel" );
	    if ( position != string::npos )
	    {
	    	inLogicalModel = true;
	    }
	} else
	{
	// only modify code if we are in the logical model
	    position = line.find( "/UML:Package" );
	    if ( position != string::npos )
	    {
	      inLogicalModel = false;
	    }
	    // Determine if the line contains a class name or an attribute name.
          position = line.find( "UML:Class name" );
	    if ( position == string::npos )
	    {
		position = line.find( "UML:Attribute name" );
	    }

	    // If a class name or attribute name exists, change to camel case
	    if ( position != string::npos )
	    {
	      size_t initPosition, finalPosition;
	    	string originalName;
	    	string camelCaseName;

	    	initPosition = line.find( '\"', position ) + 1;
	    	finalPosition = line.find( '\"', ( initPosition + 1 ) );
	    	originalName.assign( line, initPosition, (finalPosition - initPosition) );
	    	camelCaseName = toCamelCase( originalName );
	    	line.replace( line.find( originalName ), originalName.length(), camelCaseName );
	    }  
	}

      output_file.write(line.c_str(), line.length());
    }
}
    
