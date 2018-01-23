@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
 
 /*------------------------------------------------------------------------
    File        : HelloWorldController
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : joost
    Created     : Fri Jan 12 18:08:04 CET 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS be.mips.hello.world.HelloWorldController: 
    
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    METHOD PUBLIC CHARACTER Hello(  ):
        
        RETURN "Hello World".

    END METHOD.
    
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    METHOD PUBLIC VOID SayHello(INPUT UserName AS CHARACTER, OUTPUT HelloMessage AS CHARACTER):
        
        ASSIGN
            HelloMessage = SUBSTITUTE("Hello &1", UserName).
    
    END METHOD.    
    
    
END CLASS.