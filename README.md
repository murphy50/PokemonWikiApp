# PokemonWikiApp

PokemonWikiApp is an iOS application designed to provide a comprehensive Pokemon encyclopedia. It fetches data from the Pokemon API and presents it in a user-friendly manner using a table view. The app follows the VIPER architecture, ensuring a modular and scalable codebase.

## Features

- **Pokemon Data Display:** View a list of Pokemon in a table view, presenting key information.
- **Detail Screen:** Tap on a Pokemon in the table to navigate to a detailed screen with in-depth information.
- **VIPER Architecture:** Utilizes VIPER for a clean and structured iOS app development.

## Screenshots

<img src="https://github.com/murphy50/PokemonWikiApp/assets/80280986/4830367f-c48e-4bea-962f-c7c238e0e50b" width="300">
<img src="https://github.com/murphy50/PokemonWikiApp/assets/80280986/f0fb9cef-e308-41db-bb3c-d25e8377812e" width="300">
<img src="https://github.com/murphy50/PokemonWikiApp/assets/80280986/53b98b6d-61a2-48b8-9c74-2b62bd757e15)" width="300">

## Getting Started

These instructions will help you set up the project on your local machine for development and testing purposes.

## VIPER Architecture

- **The app is structured following the VIPER architecture pattern:** 
- **View (V):**  The table view and detail screen interfaces.
- **Interactor (I):**  Manages data retrieval and business logic.
- **Presenter (P):**  Formats data for display and communicates with the interactor.
- **Entity (E):**  Represents the data model (Pokemon information).
- **Router (R):**  Handles navigation between modules.
- **The VIPER**  architecture promotes separation of concerns and maintainability, making it easier to understand and extend the application.

### Prerequisites

- Xcode 15 installed on your machine.
- Basic knowledge of Swift and iOS development.

### Installation

1. Clone the repository:


   ```bash
   git clone https://github.com/murphy50/PokemonWikiApp.git
