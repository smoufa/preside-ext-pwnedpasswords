/**
* @singleton true
*/
component {

	property name="hibpAPIEndpoint";

	public function init() {
		this.hibpAPIEndpoint = "https://api.pwnedpasswords.com/range/";
	}

	public boolean function isPasswordCompromised( required string password ) {
		var hashvalue = hash( arguments.password, "SHA" );
		var hashprefix = left( hashvalue, 5 );

		var httpService = new http( method = "GET", useragent="presidecms", charset = "utf-8", url = ( this.hibpAPIEndpoint & hashprefix ) );
		var result = httpService.send().getPrefix();
		var passwordIsCompromised = 0;

		if ( ( result.status_code ?: 500 ) == 200 && len( result.filecontent ?: '' ) ) {
			var allHashValues = result.filecontent.split( "\n" );
			for ( var line in allHashValues ) {
				var linehash = hashprefix & listFirst( line, ":" );
				var numberOfOccurences = listLast( line, ":" );

				if ( linehash == hashvalue ) {
					passwordIsCompromised = numberOfOccurences;
					break;
				}
			}
		}

		return passwordIsCompromised > 0;
	}
}