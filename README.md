# CoordiNation

CoordiNation is a web application designed to help you organize groups efficiently. Whether you're managing a team at work, coordinating events for a club, or simply trying to keep track of meetings with friends, CoordiNation has you covered.

## Features

- **Meeting Minutes**: Easily create, update, read, and delete meeting minutes using a text editor powered by Trix.
- **Member Management**: Keep track of members by viewing member details and monitoring member count.
- **Task Management**: Manage tasks effortlessly with statuses such as "not started," "in progress," and "completed."
- **Event Tracking**: Stay organized with an integrated calendar for tracking events and important dates.

## Usage

To use CoordiNation, simply sign up for an account or log in if you already have one. Once logged in, you'll have access to all the features mentioned above. Here's a quick overview of how to get started:

1. **Meeting Minutes**: Click on the "Meeting Minutes" tab to start creating or managing your meeting notes.
2. **Member Management**: Navigate to the "Members" section to view details about group members and keep track of the member count.
3. **Task Management**: Head to the "Tasks" page to organize your tasks and track their progress.
4. **Event Tracking**: Use the calendar feature to keep track of upcoming events and deadlines.

## Technologies Used

CoordiNation is built using the following technologies:

- Ruby on Rails: Provides the backend framework for handling server-side logic and data storage.
- Trix Editor: Powers the text editor for creating and editing meeting minutes.
- Calendar API: Integrates with a calendar API to provide event tracking functionality.

## Installation

To run CoordiNation locally on your machine, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the project directory and install dependencies by running `bundle install`.
3. Set up the database by running `rails db:create` followed by `rails db:migrate`.
4. Start the Rails server with `rails server`.
5. Access the application in your web browser by visiting `http://localhost:3000`.

## Contributing

Thank you for considering contributing to CoordiNation! We welcome contributions from the community to help improve and grow the project. Whether it's adding new features, fixing bugs, or enhancing existing functionality, your contributions are valued.

### How to Contribute

If you'd like to contribute to CoordiNation, please follow these steps:

1. [Fork the repository on GitHub.](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo)
2. Clone your fork to your local machine.
3. Create a new branch for your contribution:
`git checkout -b feature/your-feature-name`

Ensure your branch name is descriptive of the changes you are making.

4. Make your changes locally, adhering to our coding standards and guidelines (outlined below).
5. Test your changes thoroughly to ensure they work as expected.
6. Commit your changes with clear and descriptive commit messages:
`git commit -m Brief description of your changes`

7. Push your changes to your fork:
`git push origin feature/your-feature-name`

8. Open a pull request (PR) against the `main` branch of the original repository.
9. Provide a clear description of your changes in the PR, including any relevant context or reasoning.
10. Wait for feedback and be prepared to address any requested changes.

### Coding Standards

When contributing code to CoordiNation, please adhere to the following coding standards:

- Follow the existing code style and conventions used throughout the project.
- Write clear and concise code with meaningful variable and function names.
- Include comments where necessary to explain complex logic or functionality.
- Ensure your code is well-formatted and readable.

### Pull Request Guidelines

When submitting a pull request, please ensure the following:

- Your PR addresses a single concern or feature.
- You provide a clear title and description for your PR, explaining the changes made.
- Reference any related issues or PRs in your description for better context.
- Be responsive to feedback and be prepared to make further changes if necessary.

By following these guidelines, you help maintain a clean and efficient development process. Thank you for your contributions!

<hr>

# Code Review

## Documentation
- Good read me file

## Version Control
- Good branching and commit messages
- Missing issue tracking

## Frontend
- Clean style on desktop
- Work on improving mobile responsivity

## Backend
- Missing security and authorization; consider adding pundit
