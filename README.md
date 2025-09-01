# OCaml Warmup 🐪

This repository contains my solutions to my first project, an OCaml warm-up assignment, from my CMSC330: Organization of Programming Languages course at UMD. This project served as an introduction to functional programming in OCaml, focusing on core concepts like non-recursive functions, recursive functions, list manipulation, and higher-order functions.

The goal was to implement a series of functions adhering to strict functional programming paradigms and specific constraints, providing a solid foundation in OCaml syntax and problem-solving.

## Project Overview

This project is divided into four main parts, each building on fundamental OCaml concepts:

### Part 1: Non-Recursive Functions
Implementation of basic utility functions without explicit recursion, demonstrating foundational OCaml syntax and pattern matching.
* `abs x`: Returns the absolute value of an integer.
* `rev_tup tup`: Reverses the order of elements in a 3-tuple.
* `is_even x`: Checks if an integer is even.
* `area p q`: Calculates the area of a rectangle given two opposite corner coordinates.

### Part 2: Recursive Functions
Implementation of classic algorithms using recursion, showcasing proficiency in defining recursive helper functions and managing recursive calls.
* `fibonacci n`: Computes the nth term of the Fibonacci sequence.
* `pow x p`: Calculates `x` raised to the power `p`.
* `log x y`: Computes the integer logarithm of `y` with base `x`.
* `gcf x y`: Finds the greatest common factor of two non-negative integers.

### Part 3: List Manipulation
Functions designed to work with OCaml lists, covering common list operations and more complex transformations.
* `reverse lst`: Reverses the order of elements in a list.
* `zip lst1 lst2`: Merges two lists of 2-element tuples into a single list of 4-element tuples.
* `merge lst1 lst2`: Merges two sorted lists into a single sorted list.
* `is_present lst x`: Checks if an element `x` exists in a list `lst`.
* `every_nth n lst`: Extracts every `n`th element from a list.
* `jumping_tuples lst1 lst2`: Implements a complex interwoven list transformation based on tuple elements and indices from two input lists.
* `max_func_chain init funcs`: Determines the maximum value achievable by selectively applying a chain of functions to an initial value.

### Part 4: Higher-Order Functions (HOF)
Implementation of functions strictly using `map`, `fold`, or `fold_right` from the `Funs` module, without explicit recursion. This section demonstrates an understanding of functional programming principles and the power of higher-order functions.
* `is_there lst x`: Checks if an element `x` is present in a list `lst` (re-implemented using HOF).
* `count_occ lst target`: Counts occurrences of a `target` element in a list (re-implemented using HOF).
* `uniq lst`: Removes duplicate elements from a list (re-implemented using HOF).
* `every_xth x lst`: Extracts every `x`th element from a list (re-implemented using HOF).

## Constraints & Learning

A key aspect of this project was adhering to specific "Ground Rules":
* **No imperative structures:** This included no `ref` keyword, `:=`, semicolons for sequencing, or loops.
* **Restricted library usage:** Only functions from the `Stdlib` module (including `@` and `::`) were permitted; no submodules or the `List` module were allowed.
* **Higher-Order Function enforcement:** Part 4 specifically disallowed direct recursion, requiring the use of `map`, `fold`, or `fold_right`.

These constraints challenged me to think purely functionally and leverage OCaml's strengths in pattern matching and recursion (where permitted) or higher-order abstractions.

## Repository Structure

* `src/basics.ml`: Contains the implementation of all functions for the project.
* `src/funs.ml`: (Provided) Includes implementations for higher-order functions used in Part 4.
* `src/basics.mli`, `src/funs.mli`: (Provided) Interface files defining function signatures.
* `test/`: Contains testing infrastructure (public and student tests).

## How to Run / Test the Project

To run and test this OCaml project, ensure you have OCaml version 4.13.0 or newer installed. The project uses `dune` as its build system.

1.  **Build the Project:**
    Compile your code:
    ```bash
    dune build
    ```

2.  **Run All Tests (Public and Student):**
    Execute all available tests:
    ```bash
    dune runtest -f
    ```

3.  **Run Specific Test File (e.g., public tests):**
    To run tests from a particular file:
    ```bash
    dune runtest -f test/public
    ```

    (Replace `test/public` with the path to your desired test file.)

4.  **Interactive Testing with Utop:**
    For an interactive OCaml top-level environment with your project functions loaded:
    ```bash
    dune utop src
    ```

    In `utop`, all commands must end with `;;`. Exit `utop` by typing `#quit;;` or pressing `Ctrl-D` / `Cmd-D`.
