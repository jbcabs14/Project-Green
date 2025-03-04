# Sign in Page Mock-Up
![sign-in.png](https://github.com/jbcabs14/Hiraya/blob/main/img/sign-in.png)

## Description
The **Sign in Page** features a simple user-interface that has the availability for a mobile number input. The user may opt to sign in with third-party authenticators such as **Google**.

## Use Case Scenario

| Use Case        | User Login with Google                                                                 |
|-----------------|----------------------------------------------------------------------------------------|
| **Actors**      | User, System, Google Authentication                                                    |
| **Preconditions** | User is on the homepage and clicks the "Login" button in the navbar.                  |
| **Basic Flow**  | 1. User clicks on the "Login with Google" button.                                       |
|                 | 2. System redirects the user to Google's authentication page.                          |
|                 | 3. User selects or enters their Google account credentials.                            |
|                 | 4. Google verifies the credentials and redirects back to the system.                   |
|                 | 5. System checks if the user is new or existing:                                        |
|                 |    - If new, the system creates an account and asks for Terms of Service & Privacy Policy agreement. |
|                 |    - If existing, the user is logged in.                                                |
|                 | 6. User is redirected to their dashboard or previous page.                              |
| **Alternative Flow** | - If Google authentication fails, the user is shown an error message.             |
|                     | - If the user cancels the login process, they are redirected back to the login page.|
| **Postconditions** | User is authenticated and has access to their account.                               |

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
