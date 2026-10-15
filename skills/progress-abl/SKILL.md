---
name: progress-abl
description: >
  Use when exact Progress OpenEdge ABL / Progress 4GL syntax must be confirmed: the full syntax, options or
  return type of a statement, function, handle attribute/method, widget, class, or built-in class/interface
  (Progress.Lang.*, OpenEdge.Core.*, collections, Assert); whether an option or attribute exists; whether an
  identifier is a reserved keyword; or when an ABL compile error points to unfamiliar syntax.
---

# Progress ABL Syntax Reference

## Overview

Official ABL language reference split by topic in `references/`. These files are authoritative for
syntax — prefer them over memory when the exact form, option list, or return type matters.

This skill covers **syntax only**. Coding conventions, architecture, PASOE, and ERP-specific practices
belong to whatever guidance the project or other skills provide; this skill does not override them.

## How to look things up

The files are large (up to ~10k lines). **Grep, don't read whole files.** Entries start at the
beginning of a line with the keyword followed by its kind:

```
SUBSTRING function
SUBSTRING statement
BUFFER-COPY( ) method
```

1. Pick the file from the index below.
2. Grep for the entry header, e.g. `^SUBSTRING (function|statement)` or `^BUFFER-COPY\( \) method`.
3. Read from that line onward until the next entry header (syntax, options, examples, notes).
4. If unsure which file holds it, grep the entry header across all of `references/`.

## Reference Index

| Topic | Reference File |
|-------|---------------|
| Reserved keywords (check before naming identifiers) | `references/keyword_index.txt` |
| Code execution: CASE, DO, FOR, REPEAT, RUN, PROCEDURE, FUNCTION | `references/code_execution.txt` |
| Data manipulation & database: FOR EACH, FIND, CREATE, DELETE, UPDATE | `references/data_manipulation_and_database_management.txt` |
| Query manipulation: OPEN QUERY, GET, DEFINE QUERY | `references/query_manipulation.txt` |
| Temp-tables & Datasets (ProDataSet) | `references/logical_data_(datasets_temp-tables).txt` |
| DEFINE VARIABLE, data types, extents | `references/define_variable.txt` |
| VAR statement (modern variable declaration) | `references/var_statement.txt` |
| String functions: SUBSTRING, INDEX, REPLACE, TRIM, etc. | `references/string_manipulation.txt` |
| Date & time functions: TODAY, NOW, DATE, DATETIME, etc. | `references/date_manipulation.txt` |
| Calculation functions: ABS, ROUND, TRUNCATE, MIN, MAX, etc. | `references/calculation_functions.txt` |
| Data type conversion: INTEGER, DECIMAL, CHARACTER, etc. | `references/data_type_conversion.txt` |
| Arrays (extents) | `references/array_statements.txt` |
| Collections (IList, ICollection, etc.) | `references/collections.txt` |
| Error handling: CATCH, THROW, ERROR-STATUS | `references/abl_error_handling.txt` |
| Transactions: TRANSACTION, UNDO, RETRY | `references/transaction_statements.txt` |
| Object-Oriented: CLASS, METHOD, INTERFACE, ABSTRACT | `references/object_oriented_syntax.txt` |
| Class interface & enumeration reference | `references/class_interface_and_enumeration_reference.txt` |
| Class properties & methods | `references/class_properties_and_methods_reference.txt` |
| Class events | `references/class_events_reference.txt` |
| Handle-based objects: BUFFER, QUERY, TEMP-TABLE handles | `references/handle_reference.txt` |
| Handle attributes & methods introduction | `references/handle_attributes_and_methods_reference_introduction.txt` |
| Handle attributes & methods A–D | `references/handle_attributes_and_methods_reference_a_d.txt` |
| Handle attributes & methods E–H | `references/handle_attributes_and_methods_reference_e_h.txt` |
| Handle attributes & methods I–O | `references/handle_attributes_and_methods_reference_i_o.txt` |
| Handle attributes & methods P–S | `references/handle_attributes_and_methods_reference_p_s.txt` |
| Handle attributes & methods T–Z | `references/handle_attributes_and_methods_reference_t_z.txt` |
| Handle-based object events | `references/handle-based_object_events_reference.txt` |
| Dynamic statements: DYNAMIC-FUNCTION, CREATE, TYPE-OF | `references/dynamic_statements.txt` |
| Input/Output: INPUT, OUTPUT, STREAM, PUT, GET | `references/input_output_statements.txt` |
| User interface: FRAME, WINDOW, DIALOG, BROWSE | `references/user_interface_statements.txt` |
| Widgets: buttons, fields, combo-boxes, etc. | `references/widget_reference.txt` |
| Memory manipulation: BUFFER-COPY, BUFFER-COMPARE | `references/memory_manipulation.txt` |
| Integration: Web Services, SOAP, AppServer | `references/integration_statements.txt` |
| Operating system functions | `references/operating_system.txt` |
| Security statements | `references/security_statements.txt` |
| Session management | `references/session_management.txt` |
| Punctuation & special characters | `references/punctuation_and_special_characters.txt` |
| XML manipulation | `references/xml_manipulation.txt` |
| Auditing | `references/auditing_statements.txt` |
| Assert (OpenEdge.Core.Assert) | `references/openedge_abl_api_reference_openedge_core_assert.txt` |
| Assertion package (AssertArray, AssertJson, etc.) | `references/openedge_abl_api_reference_openedge_core_assertion_package.txt` |

## Common Mistakes

- **Reading a whole file** for one entry — wastes thousands of lines of context. Grep the header.
- **Grepping the bare keyword** (`SUBSTRING`) — matches every example and cross-reference. Anchor
  with `^` and the entry kind.
- **Stopping at the first match** — many keywords have both a `function` and a `statement` entry
  (e.g. `SUBSTRING`, `ENTRY`, `LENGTH`, `EXTENT`) with different semantics. Check which one applies.
