# Clean Architecture Structure

This folder contains the clean architecture structure for the EduManagement-iOS project. The structure is divided into three main layers:

1. Presentation Layer
2. Domain Layer
3. Data Layer

## Presentation Layer

Located in the `Presentation` folder, this layer is responsible for UI components and view models. It handles how the data is presented to the user and how user interactions are processed.

## Domain Layer

Located in the `Domain` folder, this layer contains the business logic of the application. It includes use cases, domain models, and repository interfaces.

## Data Layer

Located in the `Data` folder, this layer is responsible for data retrieval and storage. It includes repository implementations, data sources (local and remote), and data models.

Each layer should be independent and communicate only through well-defined interfaces, following the Dependency Rule of Clean Architecture.
