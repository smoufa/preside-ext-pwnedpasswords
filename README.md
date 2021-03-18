# Pwned Passwords Check for Preside

## Overview

This [Preside](http://preside.org/) extension provides password checking using [Pwned Passwords](https://haveibeenpwned.com/API/v3#PwnedPasswords) by [haveibeenpwnd.com](https://haveibeenpwned.com). In their password policy admins can specify to not allow passwords that have previously been exposed in data breaches. The extension sends a partial hash of the provided password to the API and then compares the returned hash ranges with the full (local) password hash to determine if the password has previously been exposed. This only happens when setting a new password. Passwords in the database won't be checked.

## Installation

Install the extension to your application via either of the methods detailed below (CommandBox or Git submodule) and then start or reload your application.

In Preside Admin, go to System -> Password Policies and configure the required policy. In the custom policy message you might want to place a link to https://haveibeenpwned.com and explain that the password will be anonymously checked against previously exposed passwords.

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
