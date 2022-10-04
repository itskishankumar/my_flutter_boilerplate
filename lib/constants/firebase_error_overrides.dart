const firebaseErrorOverrides = {
  "captcha-check-failed":
      "The reCAPTCHA response token provided is either invalid, expired, already used or the domain associated with it does not match the list of whitelisted domains.",
  "code-expired": "The SMS code has expired. Please re-send the verification code to try again.",
  "credential-already-in-use": "This credential is already associated with a different user account.",
  "custom-token-mismatch": "The custom token corresponds to a different audience.",
  "requires-recent-login":
      "This operation is sensitive and requires recent authentication. Log in again before retrying this request.",
  "email-already-in-use": "The email address is already in use by another account.",
  "expired-action-code": "The action code has expired.",
  "cancelled-popup-request": "This operation has been cancelled due to another conflicting popup being opened.",
  "internal-error": "An internal error has occurred.",
  "invalid-app-credential":
      "The phone verification request contains an invalid application verifier. The reCAPTCHA token response is either invalid or expired.",
  "invalid-auth-event": "An internal error has occurred.",
  "invalid-verification-code":
      "The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.",
  "invalid-email": "The email address is badly formatted.",
  "invalid-credential": "The supplied auth credential is malformed or has expired.",
  "invalid-action-code":
      "The action code is invalid. This can happen if the code is malformed, expired, or has already been used.",
  "wrong-password": "The password is invalid or the user does not have a password.",
  "invalid-phone-number":
      "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code].",
  "invalid-verification-id": "The verification ID used to create the phone auth credential is invalid.",
  "multi-factor-info-not-found": "The user does not have a second factor matching the identifier provided.",
  "multi-factor-auth-required": "Proof of ownership of a second factor is required to complete sign-in.",
  "missing-app-credential":
      "The phone verification request is missing an application verifier assertion. A reCAPTCHA response token needs to be provided.",
  "missing-iframe-start": "An internal error has occurred.",
  "missing-multi-factor-info": "No second factor identifier is provided.",
  "missing-multi-factor-session": "The request is missing proof of first factor successful sign-in.",
  "missing-phone-number": "To send verification codes, provide a phone number for the recipient.",
  "missing-verification-id": "The phone auth credential was created with an empty verification ID.",
  "account-exists-with-different-credential":
      "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.",
  "network-request-failed":
      "A network error (such as timeout, interrupted connection or unreachable host) has occurred.",
  "no-auth-event": "An internal error has occurred.",
  "no-such-provider": "User was not linked to an account with the given provider.",
  "popup-blocked": "Unable to establish a connection with the popup. It may have been blocked by the browser.",
  "popup-closed-by-user": "The popup has been closed by the user before finalizing the operation.",
  "provider-already-linked": "User can only be linked to one identity for the given provider.",
  "redirect-cancelled-by-user": "The redirect operation has been cancelled by the user before finalizing.",
  "redirect-operation-pending": "A redirect sign-in operation is already pending.",
  "rejected-credential": "The request contains malformed or mismatching credentials.",
  "second-factor-already-in-use": "The second factor is already enrolled on this account.",
  "maximum-second-factor-count-exceeded": "The maximum allowed number of second factors on a user has been exceeded.",
  "timeout": "The operation has timed out.",
  "user-token-expired": "The user's credential is no longer valid. The user must sign in again.",
  "too-many-requests": "We have blocked all requests from this device due to unusual activity. Try again later.",
  "unsupported-first-factor":
      "Enrolling a second factor or signing in with a multi-factor account requires sign-in with a supported first factor.",
  "unsupported-persistence-type": "The current environment does not support the specified persistence type.",
  "unsupported-tenant-operation": "This operation is not supported in a multi-tenant context.",
  "unverified-email": "The operation requires a verified email.",
  "user-cancelled": "The user did not grant your application the permissions it requested.",
  "user-not-found": "There is no user record corresponding to this identifier. The user may have been deleted.",
  "user-disabled": "The user account has been disabled by an administrator.",
  "user-mismatch": "The supplied credentials do not correspond to the previously signed in user.",
  "user-signed-out": "",
  "weak-password": "The password must be 6 characters long or more.",
  "web-storage-unsupported": "This browser is not supported or 3rd party cookies and data may be disabled.",
};
