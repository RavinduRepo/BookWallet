# BookWallet

## Overview

BookWallet is an app designed to help book enthusiasts manage their reading materials, track reviews, and connect with other readers. This repository contains the **frontend** implementation of the app. 

### Tools and Project Management

To effectively manage and develop BookWallet, we utilized the following tools:

- **GitHub**: For version control, code collaboration, and repository management.
  - **Frontend Repository**: [RavinduRepo/BookWallet](https://github.com/RavinduRepo/BookWallet)
  - **Backend Repository**: [RavinduRepo/BookWallet-Backend](https://github.com/RavinduRepo/BookWallet-Backend)  
    The Node.js server powering the BookWallet application.
  - **User Preference Algorithm Repository**: [kushanmalintha/BookWallet-UserPreferAlgorithm](https://github.com/kushanmalintha/BookWallet-UserPreferAlgorithm)  
    Repository for the algorithm managing user preferences and book recommendations.
  - **Image Handling Repository**: [kushanmalintha/imageUploadAndFetchBackend](https://github.com/kushanmalintha/imageUploadAndFetchBackend)  
    Backend for handling image uploads and retrieval.

- **GitHub Projects**: To organize and track tasks using a Kanban board.
  - **GitHub Project Backlog**: [Backlog · @RavinduRepo's BookWallet Project](https://github.com/users/RavinduRepo/projects/1)  

## Frontend Repository Structure

### `lib` Folder

#### Buttons

- **`custom_button.dart`**: A green, round toggle button with a white outline.
- **`selection_bar.dart`**: A button bar where you can copy code (without editing existing code) from `books_screen_body.dart` and customize names and screens.
- **`custom_button1.dart`**: A customizable text button.

#### TextBox

- **`custom_textbox.dart`**: A customizable input text box.

#### `cards` Folder

- This folder contains display cards:
  - **`review_card.dart`**: A card for displaying book reviews.
  - **`review_card2.dart`**: A variation of the book review card.

#### `screens` Folder

The `screens` folder contains different pages of the app:

- **`main_screen`**
  - **`books_screen`**: Files related to the books page.
    - `books_screen_body.dart`: Contains the books screen body with a button panel and book window.
    - `book_list_view.dart`: Contains the scrolling view for books.
  - **`groups_screen`**: Files related to the groups page.
    - `groups_screen_body.dart`: Code for group body.
    - `groups_list_view.dart`: Contains the scrolling view for groups.
  - **`home_screen`**: Files related to the home page.
    - `home_screen_body.dart`: Scrollable home screen body.
  - **`profile_screen`**: Files related to the user profile page.

- **`main_screen_frame.dart`**: Creates the main screen frame with a bottom navigation bar. It dynamically changes the top app bar based on the active page.

- **`top_panel.dart`**: Implements the top app bar, displaying the current page name.

### `colors.dart`

Defines custom colors for use within the `lib` files. To use these colors, refer to them as `MyColors.colorName`.

### `main.dart`

The main entry point for the app.

## `diagrams` Folder

The `diagrams` folder contains various diagrams, including class diagrams, entity-relationship diagrams (EER), and relational diagrams. Feel free to upload any new diagrams to this folder.

## `images` Folder

The `images` folder holds all the necessary images. Make sure to rename new images appropriately if you add any.
