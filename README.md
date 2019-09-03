# Pwned Passwords Check for Preside

## Overview

This [Preside](http://preside.org/) extension provides password checking using Pwned Passwords via https://haveibeenpwned.com/API/v3#PwnedPasswords. In their password policy admins can specify to not allow passwords that have previously been exposed in data breaches. The extension sends a partial hash of the provided password to the API and then compares the returned hash ranges with the full (local) password hash to determine if the password has previously been exposed.

## Installation

Install the extension to your application via either of the methods detailed below (Git submodule / CommandBox) and then enable the extension by opening up the Preside developer console and entering:

```
extension enable preside-ext-pwnedpasswords
reload all
```

### CommandBox (box.json) method

From the root of your application, type the following command:

```
box install preside-ext-pwnedpasswords
```

### Git Submodule method

From the root of your application, type the following command:

```
git submodule add https://github.com/smoufa/preside-ext-pwnedpasswords.git application/extensions/preside-ext-pwnedpasswords
```
