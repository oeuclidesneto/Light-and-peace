# Speech Management

## Overview

The Speech Management module allows administrators to manage the weekly public lectures displayed on the Light & Peace website.

Speeches can be managed individually through the ActiveAdmin interface or imported in bulk from the annual spreadsheet used by the centre.

---

# Manual Management

Administrators can perform the following actions from the **Speeches** section of ActiveAdmin.

## Create

Creates a new lecture date.

Rules:

- Only Mondays are accepted.
- Only one speech can exist for a given date.

---

## Edit

Updates:

- Date
- Speaker
- Theme

---

## Clear Details

The **Clear Details** action removes:

- Speaker
- Theme

while preserving the lecture date.

This action is intended for situations where the lecture will still occur but the speaker or topic has not yet been confirmed.

---

## Delete

Deletes the speech record completely.

This should only be used when the lecture date itself was created by mistake.

If the lecture is still scheduled to occur, **Clear Details** should be used instead.

---

# Spreadsheet Import

The annual lecture schedule can be imported directly from ActiveAdmin.

The importer accepts **XLSX** files only.

Navigation:

ActiveAdmin → Speeches → Import Spreadsheet

---

## Required Columns

The importer only uses the following columns:

- Data
- Palestrante
- Tema

Additional columns are ignored.

---

## Worksheet Detection

The importer automatically searches for the worksheet containing the required columns.

The worksheet does not need a fixed name.

The worksheet named:

Palestrantes (nao deletar)

is always ignored.

---

## Import Behaviour

For each lecture date:

- existing speeches are updated
- missing speeches are created
- speeches not present in the spreadsheet remain unchanged

The importer never deletes existing speeches.

---

# Business Rules

## Monday Only

Every speech must occur on a Monday.

Any other weekday causes the import to fail.

---

## One Speech Per Date

Duplicate lecture dates are not allowed.

Duplicate dates inside the spreadsheet also cause the import to fail.

---

## Blank Speaker or Theme

Speaker and Theme are optional.

This allows future lecture dates to exist before speakers have been confirmed.

---

## Transaction Safety

Imports are executed inside a database transaction.

If any row contains an error:

- no speeches are imported
- no speeches are updated
- the database remains unchanged

---

# Design Decisions

## Missing Spreadsheet Dates

Dates that are missing from the spreadsheet are intentionally preserved.

The annual schedule only contains lecture dates.

Periods such as holidays, recesses or other weeks without lectures are simply omitted from the spreadsheet.

Deleting records that do not appear in the spreadsheet could accidentally remove valid historical or manually created data.

---

## Why "Clear Details" Exists

Deleting a speech would also remove its lecture date.

In practice, administrators often know that a lecture will occur before they know the speaker or theme.

For that reason, "Clear Details" removes only the speaker and theme while preserving the scheduled lecture date.

---

# Automated Tests

The SpeechImportService is covered by automated tests.

Current scenarios include:

- importing new speeches
- updating existing speeches
- preserving blank speaker/theme values
- rejecting non-Monday dates
- rejecting duplicate dates
- preserving speeches missing from the spreadsheet

These tests help ensure that future changes do not unintentionally break the import process.
