# cubit_tdd_todo

A Flutter project demonstrating Test-Driven Development (TDD) principles with a Todo List application using the Cubit state management pattern. This project was developed as part of the Flutterando Masterclass course on testing.

## Project Structure

The project follows a clean architecture approach with the following components:

### Models

- `Task`: Core data model representing a todo item with id, description and check status

### State Management

- `BoardState`: Defines different states for the todo list (Loading, Getted, Empty, Failure)
- `BoardCubit`: Handles business logic and state management for the todo list operations

### Data Layer

- `BoardRepository`: Abstract interface for data operations
- `IsarBoardRepository`: Implementation using Isar database
- `IsarDatasource`: Handles direct database operations
- `TaskModel`: Database model for Isar

## Features

- Create new todo items
- Mark todos as complete/incomplete
- Remove todos
- Persist todos using Isar database
- Full test coverage following TDD practices

## Testing

The project includes comprehensive tests:

- Unit tests for the Cubit logic
- Repository tests
- Database integration tests

## Tech Stack

- Flutter
- Bloc/Cubit for state management
- Isar for local database
- Mocktail for mocking in tests
- Equatable for value comparisons
