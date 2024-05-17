000010 IDENTIFICATION  DIVISION.
000020 CLASS-ID. MyFirstClass AS "MyFirstClassLibraryCobol.MyFirstClass" 
000021           INHERITS CLASS-ServicedComponent.
000030 ENVIRONMENT DIVISION.
000040 CONFIGURATION SECTION.
000051 SPECIAL-NAMES.
000052     CUSTOM-ATTRIBUTE AutoCompleteAttribute  
000053                     CLASS CLASS-AutoCompleteAttribute
000054     .
000060 REPOSITORY.
000070     CLASS CLASS-AutoCompleteAttribute 
000071           AS "System.EnterpriseServices.AutoCompleteAttribute"
000073     CLASS CLASS-STRING AS "System.String"
000075     CLASS CLASS-ARGUMENTEXCEPTION AS "System.ArgumentException"
000076     CLASS CLASS-ServicedComponent 
000077           AS "System.EnterpriseServices.ServicedComponent"
000078     CLASS CLASS-OBJECT AS "System.Object"
000079     .
000080 STATIC.
000090 DATA DIVISION.
000100 WORKING-STORAGE SECTION.
000110 PROCEDURE DIVISION.
000120
000130 END STATIC.
000140
000150 OBJECT.
000160 DATA DIVISION.
000170 WORKING-STORAGE SECTION.
000180 PROCEDURE DIVISION.
000190
000200 METHOD-ID. DOTRANSACTION AS "DoTransaction" 
000201            CUSTOM-ATTRIBUTE IS AutoCompleteAttribute.
000202 
000210 DATA DIVISION.
000220 WORKING-STORAGE SECTION.
000221   01 MyException   OBJECT REFERENCE CLASS-ARGUMENTEXCEPTION.
000222   01 MyString   PIC X(10).
000223 LINKAGE SECTION.
000224   01 InputString     OBJECT REFERENCE CLASS-STRING.
000225   01 ReturnString    OBJECT REFERENCE CLASS-STRING.
000230 PROCEDURE DIVISION USING BY VALUE InputString RETURNING ReturnString 
000231     RAISING CLASS-ARGUMENTEXCEPTION.
000240*    The Input Parm is tested to be non-blank for DEMO purposes
000241     SET MyString TO InputString
000242     IF MyString NOT > SPACE
000243         INVOKE CLASS-ARGUMENTEXCEPTION "NEW" 
000244         USING BY VALUE "Invalid Input Parameter" 
000245         RETURNING MyException
000246         EXIT METHOD RAISING MyException
000247     END-IF
000248     SET ReturnString TO "Hello World with Enterprise Services".
000249
000250 END METHOD DOTRANSACTION.
000260
000270 END OBJECT.
000280 END CLASS MyFirstClass.
000290