# Sign up Page Mock-Up
![sign-up](https://github.com/jbcabs14/Hiraya/blob/main/img/sign-up.png)


## Description
The **Sign up** allows the users to integrate to a third party account like **Google** and they can also choose to sign-up using their mobile phone number, which will send a verification code.

## Use Case Scenario

| Use Case         | User Sign-Up with Mobile Number |
|------------------|---------------------------------|
| Actors           | User, System, SMS Gateway       |
| Preconditions    | User is on the sign-up page.    |
| Basic Flow       | 1. User enters their mobile number. <br> 2. User requests a verification code. <br> 3. User receives the code via SMS. <br> 4. User enters the code in the verification dialog. <br> 5. System verifies the code and completes the registration. |
| Alternative Flow | - If the code is incorrect, the user is shown an error message. <br> - If the user does not receive the code, they can request a new one. |
| Postconditions   | User is registered and can log in to the application. |

## Site Map

- [Revisions](https://github.com/jbcabs14/Hiraya/blob/main/README.md)

- [Sign in](sign-in.md)

  * [Sign up](sign-up.md)

    * [Verification](verification.md)

- [Homepage](homepage.md)

- [Add Activity](add-activity.md)

   * [Confirm dialog](confirm-dialog.md)

- [Committed Acitivites](committed-activities.md)

  * [Activity Room](activity-room.md)
 
    * [Activity Chat](activity-chat.md)

- [Search Activity](search-activity.md)

- [User Profile](user-profile.md)

  * [Edit profile](edit-profile.md)
 
  * [Log out](log-out.md)



