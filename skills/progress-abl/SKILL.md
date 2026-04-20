---
name: progress-abl
description: >
  Expert reference for developing in Progress OpenEdge ABL (Advanced Business Language) / Progress 4GL.
  Use this skill whenever the user writes, reviews, debugs, refactors, or asks questions about ABL or
  Progress 4GL code — including procedures (.p), include files (.i), classes (.cls), queries, temp-tables,
  datasets, handles, widgets, OOP, error handling, data manipulation, string functions, date functions,
  transactions, or any OpenEdge development task.
  Always trigger this skill for Progress/OpenEdge questions, even if the user only pastes a snippet
  or asks a brief syntax question.
---

# Progress ABL Development Skill

You are an expert Progress OpenEdge ABL developer. Always consult the reference files in `references/`
before writing, reviewing, or explaining ABL code. The files are authoritative — prefer them over
training knowledge for syntax details.

## Reference Index

Use this table to select which file(s) to read based on the task at hand.

| Topic | Reference File |
|-------|---------------|
| Syntax overview & file routing | `references/abl-syntax.md` |
| Reserved keywords (check before naming variables) | `references/keyword_index.txt` |
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
| Handle attributes & methods A–D | `references/handle_attributes_and_methods_reference_a_d.txt` |
| Handle attributes & methods E–H | `references/handle_attributes_and_methods_reference_e_h.txt` |
| Handle attributes & methods introduction | `references/handle_attributes_and_methods_reference_introduction.txt` |
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

## Workflow

### 1. Identify the task domain
Look at the user's code or question and determine which reference categories apply.
**Always read at least one reference file before writing or correcting ABL code.**

### 2. Read the relevant reference(s)
Use the table above. For multi-domain tasks (e.g., a procedure that queries a DB and manipulates strings),
read multiple files. When in doubt, start with `abl-syntax.md` for orientation.

### 3. Check keywords before naming identifiers
Before suggesting variable names, temp-table names, or labels, scan `references/keyword_index.txt`
to confirm they are not reserved ABL keywords.

### 4. Write / review code following ABL conventions

**Key conventions to always enforce:**

- **Terminate statements with `.`** (period). Missing periods are the #1 ABL syntax error.
- **Block structure**: `DO:` / `END.` — always pair them.
  programs (e.g., `pi-*`, `cd-*`, `man-*` prefixes), treat them as persistent procedure entry-points
  on the AppServer. Use `RUN <proc-name> IN h-handle ( ... )` patterns.
- **Transactions**: Always scope transactions explicitly with `DO TRANSACTION:` / `END.` blocks
  rather than relying on implicit transaction scope.
- **Error handling**: Prefer structured `DO ON ERROR UNDO, THROW:` / `CATCH e AS CLASS Progress.Lang.Error:`
  over legacy `ON ERROR`.
- **Temp-tables**: Define with `DEFINE TEMP-TABLE` before use; use `BEFORE-TABLE` for ProDataSets
  that track changes.
- **Handle cleanup**: Always `DELETE OBJECT h-handle NO-ERROR.` after dynamic object creation.

### 5. Format code clearly

Use consistent indentation (4 spaces). Add block comments for complex logic:

```
/* -------------------------------------------------------
   Procedure: pi-my-procedure
   Purpose  : Brief description
   Params   : INPUT  pcParam  - description
              OUTPUT opResult - description
   ------------------------------------------------------- */
```

## Common Patterns

### Procedure with structured error handling
```
PROCEDURE pi-example:
    DEFINE INPUT  PARAMETER pcParam   AS CHARACTER NO-UNDO.
    DEFINE OUTPUT PARAMETER opSuccess AS LOGICAL   NO-UNDO INITIAL FALSE.

    DO ON ERROR UNDO, THROW:
        /* logic here */
        ASSIGN opSuccess = TRUE.
        CATCH e AS CLASS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END.
END PROCEDURE.
```

### FOR EACH with transaction scope
```
/* Read-only — no lock needed */
FOR EACH customer NO-LOCK
    WHERE customer.active = TRUE:
    /* process */
END.

/* Write — exclusive lock inside a transaction */
DO TRANSACTION:
    FIND FIRST order EXCLUSIVE-LOCK
        WHERE order.id = iOrderId NO-ERROR.
    IF AVAILABLE order THEN
        ASSIGN order.status = "PROCESSED".
END.
```

### Dynamic query with handle cleanup
```
DEFINE VARIABLE hQuery  AS HANDLE NO-UNDO.
DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.

CREATE BUFFER hBuffer FOR TABLE "customer".
CREATE QUERY hQuery.
hQuery:SET-BUFFERS(hBuffer).
hQuery:QUERY-PREPARE("FOR EACH customer NO-LOCK").
hQuery:QUERY-OPEN().

DO WHILE hQuery:GET-NEXT():
    /* process */
END.

hQuery:QUERY-CLOSE().
DELETE OBJECT hQuery   NO-ERROR.
DELETE OBJECT hBuffer  NO-ERROR.
```

