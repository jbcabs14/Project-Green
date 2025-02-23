# Login Page Mock-Up



## Description
The **Login Page** features a simple user-interface that has both availability for email input and mobile number input. The user may opt to sign in with third-party authenticators such as **Google**.

### Input

* **Mobile Number** - The mobile number of the user. It will automatically prepend a country code to avoid ambiguity.
* **Password** - A unique string that allows access to a specific user.

### Process

* The system will check for input validity.
* Once valid, the system will lookup the credentials entered.

### Output

Access is granted for the user that has accepted credential inputs.

## Data Dictionary

| Element ID | Element Text | Element Type | Data Type | Required? | Rules |
|---|---|---|---|---|---|
|LoginHeader|Login|Header|Text|No|None
|LoginUsername|Email or Mobile Number|Text|Text|Yes|Must be valid email or mobile number
|LoginPassword|Password|Password|Text|Yes|Masked|
|LoginInvalidUsername|Invalid username and password|Text|Text|No|Hidden
|LoginForgotPassword|Reset Password|Link|Anchor|No|Hyperlink|
|LoginSignUp|Create an account here|Link|Anchor|No|Hyperlink|
|LoginButton|Log in|Button|Component|No|None|
|LoginWithGoogle|Continue with Google|Button|Component|No|Hyperlink|
|LoginWithFacebook|Continue with Facebook|Button|Component|No|Hyperlink|

## Site Map

- [Revisions](README.md)

- [Login](docs/login.md)

  * [Sign up](docs/sign-up.md)

    * [Verification](docs/verification.md)

- [Homepage](docs/homepage.md)

- [Add Activity](docs/add-activity.md)

   * [Confirm dialog](docs/confirm-dialog.md)

- [Committed Acitivites](docs/committed-activities.md)

  * [Activity Room](docs/activity-room.md)
 
    * [Activity Chat](docs/activity-chat.md)

- [Search Activity](docs/search-activity.md)

- [User Profile](docs/user-profile.md)

  * [Edit profile](docs/edit-profile.md)
 
  * [Log out](docs/log-out.md)
