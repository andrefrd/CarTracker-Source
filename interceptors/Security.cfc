component {
	property name="SessionStorage" inject="coldbox:plugin:SessionStorage";

	void function configure(){
	}
	
	void function preProcess( required Any event, required Struct interceptData){
		var q = new query();
            q.setDatasource( 'CarTracker' );
            q.setSql( 'select * from Car order by createddate desc');
            var result = q.execute().getResult();
            var meta = getMetaData( result );
            var m = result.getMetaData();
            var cols = m.getColumnLabels();
            var records = [];
            for( var i=1; i<=result.recordCount; i++ ) {
            	var hashtable = {};
            	for( var x=1; x<=arrayLen( cols ); x++ ) {
            		var column = cols[ x ];
            		hashtable[ column ] = result[ column ][ i ];
            	}
            	arrayAppend( records, hashtable );
        	}
		// check Session
		var User = SessionStorage.getVar( "User" );
		if( !isStruct( User ) && !listFindNoCase( "login,checklogin,index", event.getCurrentAction() ) ) {
			prc.jsonData = {
				"data"  = "",
				"success" = false,
				"message" = "Sorry, you must be logged in to access this site. You will now be redirected to the login screen",
				"type" = "notloggedin"
			};
			event.renderData( data=prc.jsonData, type="json" ).noExecution();
		}			
	}	
	
}