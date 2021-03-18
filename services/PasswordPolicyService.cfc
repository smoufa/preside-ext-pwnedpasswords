/**
 * A class that provides methods for dealing with all aspects of password policies
 *
 * @singleton      true
 * @presideService true
 */
component extends="preside.system.services.passwordPolicy.PasswordPolicyService" {

	public array function listStrengths() {
		return [
			  { name="dangerous", minValue="0"  }
			, { name="pwned"    , minValue="5"  }
			, { name="bad"      , minValue="15" }
			, { name="moderate" , minValue="40" }
			, { name="good"     , minValue="65" }
			, { name="great"    , minValue="80" }
			, { name="awesome"  , minValue="95" }
		];
	}

	public string function getStrengthNameForScore( required numeric score ) {
		var strengths = listStrengths();

		for( var i=strengths.len(); i > 0; i-- ) {
			if ( arguments.score >= strengths[ i ].minValue ) {
				return strengths[ i ].name;
			}
		}

		return strengths[ 1 ].name;
	}

}
