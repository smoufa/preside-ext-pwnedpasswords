/**
 * A class that provides methods for dealing with all aspects of password policies
 *
 * @singleton      true
 * @presideService true
 */
component extends="preside.system.services.passwordPolicy.PasswordPolicyService" {

	public array function listStrengths() {
		var strengths = super.listStrengths();

		if ( $isFeatureEnabled( "pwnedPasswords" ) ) {
			strengths.append( { name="pwned", minValue="5" } );

			arraySort( strengths, function ( e1, e2 ) {
				return compare( e1.minValue, e2.minValue );
			} );
		}

		return strengths;
	}

}
