# Add Activity Dialog Mock-Up

## Description
The **Add Activity Dialog** is a feature that lets the users add a movement or event. In this dialog, the user will have to input the description, time, date and other important details of the agenda.

## Use Case Scenario

| Use Case        | User Adds an Activity                                                                   |
|-----------------|----------------------------------------------------------------------------------------|
| **Actors**      | User, System                                                                           |
| **Preconditions** | User is logged in and navigates to the add activity dialog.                           |
| **Basic Flow**  | 1. User navigates to the add activity dialog.                                           |
|                 | 2. System displays the activity input fields.                                           |
|                 | 3. User fills out the activity details and submits the form.                            |
|                 | 4. System validates the input and saves the activity.                                   |
|                 | 5. User is redirected to the committed activities page with the new activity listed.    |
| **Alternative Flow** | - If the input is invalid, the system displays an error message.                  |
| **Postconditions** | New activity is added and visible in the committed activities page.                  |

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
