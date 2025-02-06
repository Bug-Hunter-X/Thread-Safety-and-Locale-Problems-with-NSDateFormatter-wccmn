# Objective-C NSDateFormatter Thread Safety and Locale Handling

This repository demonstrates a common issue in Objective-C related to the `NSDateFormatter` class: thread safety and locale handling.  Incorrect usage can lead to inconsistent date formatting and potential crashes.

## Problem

`NSDateFormatter` is *not* thread-safe. Accessing and modifying its properties (like `dateFormat` or `locale`) concurrently from multiple threads can cause unpredictable behavior, data corruption, or application crashes.

Additionally, the `locale` setting significantly impacts date/time interpretation.  Failure to specify a locale explicitly can lead to unexpected formatting results depending on the system's default locale.

## Solution

The solution involves using thread-safe mechanisms (like a serial queue or using a dedicated `NSDateFormatter` instance per thread) and explicitly setting the locale to ensure consistent and predictable results across different environments and threads.

## Code Example

The included code files (`bug.m` and `bugSolution.m`) demonstrate the problematic code and its corrected version.