/**
 * Checks the Pwned Password service, see https://haveibeenpwned.com/API/v3#PwnedPasswords
 *
 * @singleton true
 * @presideservice true
 */
component extends="preside.system.services.passwordPolicy.PasswordStrengthAnalyzer" {

	property name="hibpService" inject="PwnedPasswordService";

	public numeric function calculatePasswordStrength( required string password ) {
		if ( $isFeatureEnabled( "pwnedPasswords" ) && hibpService.isPasswordCompromised( arguments.password ) ) {
			return 5;
		}

		return super.calculatePasswordStrength( argumentCollection = arguments );
	}

}