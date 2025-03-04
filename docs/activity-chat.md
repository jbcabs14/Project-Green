# Activity Chat Dialog Mock-Up



# Description
The **Activity Chat Dialog** offers the feature where participants of a certain event or movements can communicate and update of the cetain event.

# Use Case Scenario

## Use Case
 - User Sign-In

## Actors
 - User, System

## Preconditions
 - User is on the homepage and clicks the "Sign-In" button in the navbar.

## Basic Flow
 1. User clicks on the "Sign-In" button.
 2. System displays the Sign-In form with fields for email and password
 3. User enters their email and password
 4. System verifies the credentials:
    - If correct, the user is authenticated.
    - If incorrect, the system displays an error message.
 5. User is redirected to their dashboard or the last visited page.

## Alternative Flow
 - If the user enters an incorrect email or password, the system displays an "Invalid credentials" message.
 - If the user forgets their password, they can click "Forgot Password" to reset it.
 - If the user cancels the sign-in process, they are redirected back to the homepage.

## Postconditions
 - Successful: The user is authenticated and gains access to their account.
 - Failed: The user remains on the Sign-In page until valid credentials are entered.


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
