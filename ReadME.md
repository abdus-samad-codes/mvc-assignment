# BOOKHUB - Library Management System

Hi! This is my **Library Management System** project, which I built to manage books, authors, and categories in a library. I developed this application as part of my MVC assignment to show how a full-stack Spring Boot application works, focusing on a clean structure and a simple, easy-to-use interface.

## 📖 What is this project?

The goal of this project was to create a practical tool for librarians. It allows them to keep track of their book collection, manage author profiles, and organize everything into categories. I wanted to make sure it wasn't just functional but also well-organized behind the scenes using modern development practices.

### Key Features

*   **Book Management**: Complete CRUD (Create, Read, Update, Delete) operations for books, including details like ISBN, publisher, and available copies.
*   **Author Management**: Manage author profiles and associate them with their respective books.
*   **Dynamic Search & Filtering**: Easily find books by title, author, or category using the built-in filtering system on the discovery page.
*   **Category Organization**: Books are organized into predefined categories (Fiction, Science, Technology, etc.) for better cataloging.
*   **Real-time Validation**: Robust server-side validation to ensure data integrity (e.g., unique email checks, required field validation).
*   **Automatic Data Setup**: On startup, the system automatically initializes essential categories to ensure the application is ready for use.

---

## 🛠️ The Tech Stack I Used

To make this app robust and modern, I chose these technologies:

*   **Java 17 & Spring Boot 3**: The foundation of the whole application.
*   **Spring Data JPA**: For handling the database work.
*   **MapStruct**: A tool I used to map my data objects (DTOs) to database entities automatically.
*   **JSP & JSTL**: For building the web pages and showing dynamic data.
*   **MySQL**: My main database for storing all the library information.
*   **Custom CSS**: I wrote my own CSS to give the app a clean, professional look that I call the "BookHub" style.

---

## 🏗️ How I Built It (The Architecture)

I followed a **Layered Architecture** to keep the code clean and easy to maintain. Here is how I organized the different parts:

1.  **Controller Layer**: This is where I handle all the web requests and decide which page to show the user next.
2.  **Service Layer**: This is the "brain" of the app. It contains the business logic, like making sure an author isn't deleted if they still have books in the library.
3.  **Repository Layer**: I used Spring Data JPA here to talk to the MySQL database without writing a lot of manual SQL.
4.  **DTO Pattern**: I used Data Transfer Objects to move data between the database and the web pages. This helps keep the internal database structure separate from what the user sees.

---

## 🚀 Getting Started

### Prerequisites

*   **Java 17** installed.
*   **Maven** installed (or use the provided `./mvnw`).
*   **MySQL Server** running on your machine.

## Setup Instructions

### Running the Application (Recommended – No Setup Required)
For the first run, I have configured the project to use the H2 in-memory database under the `test` profile. This allows the application to run without any external database setup.

In IntelliJ, create a Run Configuration and add the following VM option:
`-Dspring.profiles.active=test`

Then run the application. The database will be created automatically, and sample data will be loaded.

### Access the Web Interface
Open your browser and navigate to:
[http://localhost:8080/books/list](http://localhost:8080/books/list)

### Running with MySQL (Optional)
If you want to use MySQL instead of H2:

* Create a MySQL database named `library`.
* Update `src/main/resources/application-dev.properties` with your MySQL username and password.

Then run the application using the `dev` profile:
`-Dspring.profiles.active=dev`

### Build the Project (Optional)
```bash
./mvnw clean install

## 📂 Project Structure

*   `src/main/java`: Contains the Java source code (Controllers, Services, Repositories, etc.).
*   `src/main/resources`: Configuration files and SQL scripts.
*   `src/main/webapp`: JSP views and static assets (CSS, Images).
*   `src/test/java`: Unit and integration tests for various components.

---

Thank you for reviewing my project! I hope this application demonstrates my understanding of Spring Boot MVC and modern web development practices.
