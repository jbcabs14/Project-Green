# Verification Dialog Mock-Up



## Description
The **Verification Dialog** pops up after the user who want's to sign up to the application through mobile number. The code will be sent to the mobile number that was inputed by the user and the user will have to input the sent code to the verificaiton dialog.

## Use Case Scenario

| Use Case         | User Verification with Mobile Number |
|------------------|--------------------------------------|
| Actors           | User, System, SMS Gateway            |
| Preconditions    | User has entered their mobile number and requested a verification code. |
| Basic Flow       | 1. User receives a verification code via SMS. <br> 2. User enters the verification code in the dialog. <br> 3. System verifies the code. <br> 4. If the code is correct, the user is registered. |
| Alternative Flow | - If the code is incorrect, the user is shown an error message. <br> - If the user does not receive the code, they can request a new one. |
| Postconditions   | User is verified and can proceed with the registration. |

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



