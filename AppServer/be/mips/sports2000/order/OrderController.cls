 
 /*------------------------------------------------------------------------
    File        : OrderController
    Syntax      : 
    Author(s)   : joost
    Created     : Fri Jan 12 18:23:41 CET 2018
    Notes       : 
  ----------------------------------------------------------------------*/
  
@program FILE(name="OrderController.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="OrderController", URI="/OrderController", schemaName="dsOrder", schemaFile="sports2000_rest/AppServer/be/mips/sports2000/order/ordercontroller.i").

USING Progress.Lang.*.
USING OpenEdge.BusinessLogic.BusinessEntity.


ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS be.mips.sports2000.order.OrderController INHERITS BusinessEntity:
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    {"be\mips\sports2000\order\ordercontroller.i"}
    
    DEFINE DATA-SOURCE srcOrder FOR sports2000.Order.
    
    
    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC OrderController():
        
        DEFINE VARIABLE hDataSourceArray AS HANDLE NO-UNDO EXTENT 1.
        DEFINE VARIABLE cSkipListArray AS CHARACTER NO-UNDO EXTENT 1.
        
        SUPER (DATASET dsOrder:HANDLE).
        
        /* Data Source for each table in dataset. Should be in table order as defined 
            in DataSet */     
         hDataSourceArray[1] =  DATA-SOURCE srcOrder:HANDLE.
         
                  
         /* Skip-list entry for each table in dataset. Should be in temp-table order 
           as defined in DataSet */
        /* Each skip-list entry is a comma-separated list of field names, to be
            ignored in create stmt */
             
         cSkipListArray[1] = "".
         
         
         THIS-OBJECT:ProDataSource = hDataSourceArray.
        THIS-OBJECT:SkipList = cSkipListArray.
                 
    END CONSTRUCTOR.
        
    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID ReadOrderController(
            INPUT filter AS CHARACTER, 
            OUTPUT DATASET dsOrder):
        
        SUPER:ReadData(filter).
              
    END METHOD.
      
    /*------------------------------------------------------------------------------
            Purpose: Create one or more new records                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/  
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID CreateOrderController(INPUT-OUTPUT DATASET dsOrder):            
               
        SUPER:CreateData(DATASET dsOrder BY-REFERENCE).        
    END METHOD.    
    
    /*------------------------------------------------------------------------------
            Purpose:  Update one or more records                                                                  
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID UpdateOrderController(INPUT-OUTPUT DATASET dsOrder):            
    
        SUPER:UpdateData(DATASET dsOrder BY-REFERENCE).          
    END METHOD.
    
    /*------------------------------------------------------------------------------
            Purpose:    Delete a record                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID DeleteOrderController(INPUT-OUTPUT DATASET dsOrder):                    
    
        SUPER:DeleteData(DATASET dsOrder BY-REFERENCE).
    END METHOD.
     
    
END CLASS.
