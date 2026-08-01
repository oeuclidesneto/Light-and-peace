# Changelog

All notable changes to this project will be documented in this file.

This project follows a feature-based documentation workflow.

---

# Unreleased

## Feature: Speech Management

### Added

- Added ActiveAdmin management for speeches.
- Added filtering by date, speaker and theme.
- Added native date picker for speech dates.
- Added Monday-only validation.
- Added support for blank speaker and theme values.
- Added "Clear Details" action to preserve lecture dates while removing speaker and theme.
- Added custom delete confirmation and success messages.

### Spreadsheet Import

- Added XLSX speech schedule import.
- Added automatic worksheet detection.
- Added automatic header detection.
- Added support for spreadsheets with accented or non-accented worksheet names.
- Added support for Excel date values and common text date formats.
- Added duplicate date validation.
- Added transaction-based imports.
- Added automatic creation of new speeches.
- Added automatic update of existing speeches.
- Preserved speeches not present in the spreadsheet.
- Added import summary after successful import.
- Added ActiveAdmin upload page.
- Added upload validation for XLSX files.

### Testing

- Added automated tests for SpeechImportService.
- Added coverage for:
  - creating speeches
  - updating speeches
  - blank speaker/theme values
  - Monday validation
  - duplicate date validation
  - preservation of speeches outside the spreadsheet
