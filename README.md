# Survival guide

[![](https://dcbadge.vercel.app/api/server/CRRh5sBwDp)](https://discord.gg/CRRh5sBwDp)

This app is dedicated to helping Ensign College students to orient themselves in Ensign College. 

## Table of Contents

- [Requirements](#requirements)
- [Setup](#setup)
- [Execution](#execution)
- [Contribution](#contribution)
- [License](#license)

## Requirements

List the requirements that need to be met before starting with the project. This may include:

- Flutter, Supabase.
- Account setup for Supabase.
- Database access keys. Ask for an invitation in Discord server.

## Setup

Step-by-step instructions on how to set up the project. Include the following:
1. Clone the repository:
   `git clone https://github.com/Ensign-College/survival-guide.git`

2. Install dependencies:
    Open your terminal in survival-guide
   `flutter pub get`

3. Create a new branch and switch to it:
   `git checkout -b <your_github_username/feature-name>`

4. Ensure that the Flutter development environment is properly set up:
   `flutter doctor`

5. Create an `.env` file at root directory to store your API keys duplicating 'example.env' and renaming to '.env'. This file should not be committed to version control (.gitignore takes care of that).
   lib/.env

## Execution

Instructions for running the project. Include the following:

Option 1: Installing an Emulator

Install Android Studio: https://developer.android.com/studio

Launch Android Studio and open the AVD Manager: Click on the "AVD Manager" icon in the toolbar or access it through the "Configure" menu.

Create a new Virtual Device: Click on the "Create Virtual Device" button in the AVD Manager.

Choose a device: Select a device from the list (e.g., Pixel phone model) and click "Next."

Select a system image: Choose a system image that corresponds to the desired Android version and click "Next."

Configure the virtual device: Set configuration options (e.g., device name, storage size) and click "Finish."

Start the emulator: Select the newly created virtual device in the AVD Manager and click the "Play" button.

Wait for the emulator to launch.

Run the Flutter app: In your Flutter project directory, run the command 'flutter run' and select the running emulator from the list of devices.

Option 2: Connecting a Mobile Device

Enable Developer Options on your mobile device: Go to "Settings" > "About Phone" > Tap on "Build Number" seven times to enable Developer Options.

Enable USB Debugging: In the "Settings" menu, go to "Developer Options" and enable "USB Debugging."

Connect your device via USB: Connect your mobile device to your computer using a USB cable.

Allow USB debugging on your device: When prompted on your mobile device to allow USB debugging, tap "OK" or "Allow."

Verify device connection: Press Ctrl + Shift + P and type device, Select: 'Flutter: Select Device' and then choose your device.

Run the Flutter app: In your Flutter project directory, run 'flutter run'.

## Contribution

- Forking the repository.
- Creating feature branches.
- Making pull requests.

## License

Remember to always prioritize the security of API keys and sensitive information. Never commit or merge code that includes API keys or any confidential data. Ensure that the `.env` file is properly excluded from version control by adding it to the `.gitignore` file.
