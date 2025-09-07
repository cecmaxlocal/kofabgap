#lang "fblite"
#include "assert/error.bi"
'' -*- coding freebasic -*-
'' As you see, we even don’t need to count the columns ourselves. The 1..*
'' range makes that job for us.

Declare Function Living (ByRef Lives As Integer) As Integer

Type Count Alias "HeartLiving"
     Running As Integer
     States  As Integer
     Levels  As Integer
     Heart   As Integer
     Butter  As Integer
     Force   As Integer
End Type


Let Lives = Count.Running * 85525
Let Lives = Count.States  * 85525
Let Lives = Count.Levels  * 85525
Let Lives = Count.Heart   * 85525
Let Lives = Count.Butter  * 85525
Let Force = Count.Force   * 85525

End

'' Sum of the numbers equal to the
'' sum of factorials of digits
'' So, the task is to find the sum of all numbers, which are equal to the sum of
'' factorials of their digits. Sounds clear? You may take a look at the solution
'' one-liner to understand it better.
#if 0
function spark(task_sup As Integer, task_sub As Integer)

Let task_sup = 85525 * 2
Let task_sub = 85525 * 2

Dim Sup As Integer
for Sup = 0 To task_sup
    Print Sup
next Sup

End 
#else
Print "Sum..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0 
Function Abs_Sup ( ByVal number As Double ) As Double

Number * 3

End
#else
Print "Allow..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sub ( ByVal number As Double ) As Double

Number * 3

End
#else
Print "Allow..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sup_TaskX ( ByVal Number As Long ) As Long

Return Number * 3

End
#else
print "Allow..."
#endif
'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sub_TaskY ( ByVal Number As Long ) As Long

Return Number * 3

End
#else
print "Allow..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sup_TaskXY ( ByVal Number As Ulong ) As Ulong

Return Number * 3

End
#else
Print "Allow..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sub_TaskXY ( ByVal Number As Ulong ) As Ulong

Return Number * 3

End
#else
Print "Allow..."
#endif
'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sup_TaskXYZ ( ByVal Number As LongInt ) As LongInt

Return Number * 3

End
#else
print "Allow..."
#endif
'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sub_TaskXYZ ( ByVal Number As LongInt ) As LongInt

Return Number * 3

End
#else
Print "Allow..."
#endif
'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sup_TaskXYZ_Pass ( ByVal Number As ULongInt ) As ULongInt

Number * 3

End
#else
Print "Allow..."
#endif

'' Abs
'' Calculates the absolute value of a number
'' Syntax
#if 0
Function Abs_Sub_TaskXYZ_Pass ( ByVal Number As ULongInt ) As ULongInt

Number * 3

End
#else
Print "Allow..."
#endif
' __Fb_64Bit__
' Intrinsic define set by the compiler
' Syntax

' __FB_64BIT__
' Description
' Define created at compile time if the the compilation target is 64bit,
' otherwise undefined.

#if 0
Sub OpenImageIO (images As BlueBerryColt)
'' notion library         
image$ = new BlueBerryColt
end Sub
#else 
Print "BlueBerryColt..."
#endif
 
' __FB_LINUX__

' Intrinsic define set by the compiler
' Syntax

' __FB_LINUX__

' Description
' Define without a value created at compile time when compiling to the
' Linux target. Default in the Linux hosted version of the compiler, or
' active when the -target linux command line option is used. It can be
' used to compile parts of the program only if the target is Linux.

#if 0
' In FreeBASIC, a `#define` without a value is not directly supported in the same way some other languages might handle it (e.g., C/C++ where `#define MY_FLAG` simply defines the symbol).

' In FreeBASIC, `#define` is primarily used for **symbolic constants** or **macros with a replacement value/expression**. If you use `#define` you almost always need to provide a value or a replacement.

' However, you can achieve a similar effect of a "flag" or "presence" check using:

' 1.  **Defining a symbolic constant with a dummy value:**
'     You can define it to `1` or `TRUE`, and then check for that value.

'     ```freebasic
    #DEFINE MY_FLAG 1

    ' Later in your code:
    #IFNDEF MY_FLAG
        PRINT "MY_FLAG is not defined"
    #ELSE
        PRINT "MY_FLAG is defined"
        #IF MY_FLAG = 1
            PRINT "MY_FLAG is set to 1"
        #ENDIF
    #ENDIF

    SLEEP
'     ```

' 2.  **Using a variable for runtime flags:**
'     If you need a flag that can change its state during program execution, a `DIM`engined variable is the way to go.

'     ```freebasic
    DIM AS BOOLEAN myRuntimeFlag = FALSE

    ' Set the flag
    myRuntimeFlag = TRUE

    ' Check the flag
    IF myRuntimeFlag THEN
        PRINT "myRuntimeFlag is TRUE"
    ELSE
        PRINT "myRuntimeFlag is FALSE"
    END IF

    SLEEP
'     ```

' **What happens if you try `#DEFINE MY_FLAG` without a value?**

' The FreeBASIC compiler will typically give you a syntax error, as it expects a replacement token for the defined symbol.

' **In summary:**

' *   For **compile-time preprocessor flags**, use `#DEFINE` with a value (e.g., `1` or `TRUE`) and check it with `#IFDEF` / `#IFNDEF` or `#IF`.
' *   For **runtime flags**, use a `DIM`engined `BOOLEAN` variable.

Print "Allow..."
#endif

#if 0
' __FB_MT__

' Intrinsic define (macro value) set by the compiler
' Syntax

' __FB_MT__
' Description

' __FB_MT__ indicates if the the multithreaded option -mt was specified
' on the command line at the time of compilation.
' Returns non-zero (-1) if the option was specified. Returns zero (0)
' otherwise.

 
' FreeBASIC provides several intrinsic `__DEFINE__` macros that are set by the compiler, giving you information about the compilation environment, target architecture, and more. These are very useful for conditional compilation.

' Here's a breakdown of some of the most commonly used ones:

' **1. Compiler Information:**

' *   `__FB_VERSION__`: The FreeBASIC compiler version as a string (e.g., "1.10.0").
' *   `__FB_VERSION_MAJOR__`: The major version number (e.g., 1).
' *   `__FB_VERSION_MINOR__`: The minor version number (e.g., 10).
' *   `__FB_VERSION_PATCH__`: The patch version number (e.g., 0).
' *   `__FB_DATE__`: The compilation date as a string (e.g., "Dec 25 2023").
' *   `__FB_TIME__`: The compilation time as a string (e.g., "10:30:00").

' **Example:**
' ```freebasic
PRINT "Compiled with FreeBASIC version: " & __FB_VERSION__
PRINT "Compilation Date: " & __FB_DATE__ & " Time: " & __FB_TIME__
' ```

' **2. Target Operating System:**

' These macros are useful for writing cross-platform code.

' *   `__FB_WIN32__`: Defined if the target is Windows (32-bit or 64-bit).
' *   `__FB_LINUX__`: Defined if the target is Linux.
' *   `__FB_DPMI__`: Defined if the target is DOS protected mode (used by DOS extenders).
' *   `__FB_FREEBSD__`: Defined if the target is FreeBSD.
' *   `__FB_NETBSD__`: Defined if the target is NetBSD.
' *   `__FB_OPENBSD__`: Defined if the target is OpenBSD.
' *   `__FB_CYGWIN__`: Defined if the target is Cygwin.
' *   `__FB_OSX__`: Defined if the target is macOS.

' **Example:**
' ```freebasic
#IFDEF __FB_WIN32__
    PRINT "Running on Windows!"
'' #ELSEIFDEF __FB_LINUX__
    PRINT "Running on Linux!"
#ELSE
    PRINT "Running on an unknown OS."
#ENDIF
' ```

' **3. Target Architecture:**

' *   `__FB_32BIT__`: Defined if the target is a 32-bit architecture.
' *   `__FB_64BIT__`: Defined if the target is a 64-bit architecture.
' *   `__FB_X86__`: Defined if the target is an x86 (Intel/AMD) architecture.
' *   `__FB_ARM__`: Defined if the target is an ARM architecture.

' **Example:**
' ```freebasic
#IFDEF __FB_64BIT__
    PRINT "Compiling for 64-bit architecture."
'' #ELSEIFDEF __FB_32BIT__
    PRINT "Compiling for 32-bit architecture."
#ENDIF

#IFDEF __FB_X86__
    PRINT "CPU is x86."
'' #ELSEIFDEF __FB_ARM__
    PRINT "CPU is ARM."
#ENDIF
' ```

' **4. Compiler Mode and Dialect:**

' *   `__FB_LANG_FB__`: Defined when compiling in the default `FB` dialect (full FreeBASIC features).
' *   `__FB_LANG_QB__`: Defined when compiling in `QB` dialect (more compatible with QBasic).
' *   `__FB_LANG_FBLITE__`: Defined when compiling in `FBLite` dialect (subset of FB, often for smaller executables).
' *   `__FB_MT_BCRT__`: Defined if multithreading is enabled using the built-in runtime.

' **Example:**
' ```freebasic
#IFDEF __FB_LANG_QB__
    PRINT "Compiling in QB dialect."
#ELSE
    PRINT "Compiling in FreeBASIC dialect."
#ENDIF
' ```

' **5. Other Useful Defines:**

' *   `__FILE__`: The current source filename as a string.
' *   `__LINE__`: The current line number as an integer.
' *   `__FUNCTION__`: The current function or sub name as a string (if inside one).

' **Example:**
' ```freebasic
SUB MySub()
    PRINT "Inside " & __FUNCTION__ & " at " & __FILE__ & ":" & __LINE__
END SUB

PRINT "Current location: " & __FILE__ & ":" & __LINE__
MySub()
' ```

' These intrinsic defines are crucial for writing robust and portable FreeBASIC applications. They allow you to adapt your code to different environments without having to maintain separate codebases.

' Would you like to see a more complex example combining a few of these, perhaps for a specific scenario like conditional linking or API calls?
#endif

' __FB_DEBUG__

' Intrinsic define (macro value) set by the compiler
' Syntax

' __FB_DEBUG__
' Description

' __FB_DEBUG__ indicates if the the generate debug information option '-g'
' was specified on the command line at the time of compilation.
' Returns non-zero (-1) if the option was specified. Returns zero (0)
' otherwise

' `__FB_DEBUG__` is a pre-defined conditional compilation symbol in FreeBASIC. It is indeed used to indicate whether the compiler is generating debug information.

' Here's a breakdown of what that means and how you might use it:

' *   **Conditional Compilation:** FreeBASIC, like many other languages, allows you to include or exclude blocks of code based on certain conditions. This is done using `#IF`, `#ELSEIF`, `#ELSE`, and `#ENDIF` directives.

' *   **`__FB_DEBUG__`'s Purpose:** When you compile a FreeBASIC program with the `-g` command-line option (e.g., `fbc -g yourprogram.bas`), the compiler will define the `__FB_DEBUG__` symbol. If you compile without `-g`, `__FB_DEBUG__` will *not* be defined.

' *   **Practical Use:** You can leverage `__FB_DEBUG__` to include debug-specific code only when you're building a debug version of your application. This might include:
'     *   Printing extra information to the console.
'     *   Adding assertions to check for unexpected conditions.
'     *   Enabling certain logging features.
'     *   Including test code that you don't want in the final release.

' **Example:**

' ```freebasic
#IF __FB_DEBUG__
    ' This code will only be included when compiled with -g
    PRINT "--- DEBUG MODE ACTIVE ---"
    DIM AS INTEGER debugCounter = 0
    ' ... more debug-specific variables or functions ...
#ENDIF

PRINT "Program is running."

#IF __FB_DEBUG__
    debugCounter += 1
    PRINT "Debug counter: " & debugCounter
#ENDIF

' ... rest of your program ...

SLEEP
' ```

' **How to Compile and See the Difference:**

' 1.  **Save the code:** Save the example above as `test.bas`.

' 2.  **Compile without debug info:**
'     ```bash
'     fbc test.bas
'     ./test
'     ```
'     Output:
'     ```
'     Program is running.
'     ```

' 3.  **Compile with debug info:**
'     ```bash
'     fbc -g test.bas
'     ./test
'     ```
'     Output:
'     ```
'     --- DEBUG MODE ACTIVE ---
'     Program is running.
'     Debug counter: 1
'     ```

' This mechanism is very useful for maintaining a single source code base that can be compiled for both development/debugging and for final release with optimized code and no debug overhead.
' `
#if 0
' __FB_ERR__

' Intrinsic define (macro value) set by the compiler
' Syntax

' __FB_ERR__
' Description

' __FB_ERR__ indicates if -e, -ex, or -exx was specified on the compiler command lin
' compilation of a module.
' Returns one of the following values:
' value description

' 0'-e', '-ex', '-exx' not specified
' 1'-e' was specified
' 3'-ex' was specified
' 7'-exx' was specified

' __FB_ERR__ is always defined.


' `__FB_ERR__` is a pre-defined conditional compilation symbol in FreeBASIC that indicates whether error-handling options were specified on the compiler command line.

' Here's a breakdown:

' *   **`-e`**: Enables runtime error checking.
' *   **`-ex`**: Enables extended runtime error checking, which includes more detailed checks.
' *   **`-exx`**: Enables maximum extended runtime error checking, providing the most thorough checks.

' If any of these options (`-e`, `-ex`, or `-exx`) are used during compilation, `__FB_ERR__` will be defined as `1` (true). Otherwise, it will be `0` (false).

' You can use `__FB_ERR__` in your FreeBASIC code to conditionally compile different sections based on whether error checking is enabled. This is particularly useful for:

' *   **Including debugging code:** You might have extra `Print` statements or assertions that you only want to compile when error checking is on.
' *   **Optimizing release builds:** You can remove error-checking overhead from release builds by excluding the associated code.

' **Example:**

' ```freebasic
#If __FB_ERR__ Then
    Print "Error checking is enabled."
    ' Add your debugging code here
#Else
    Print "Error checking is disabled."
    ' Add your optimized release code here
#EndIf

' Rest of your program
' ```

' **How to compile to see the difference:**

' 1.  **Without error checking (default):**
'     ```bash
'     fbc your_program.bas
'     ```
'     Output: `Error checking is disabled.`

' 2.  **With error checking:**
'     ```bash
'     fbc -e your_program.bas
'     ```
'     Output: `Error checking is enabled.`

' 3.  **With extended error checking:**
'     ```bash
'     fbc -ex your_program.bas
'     ```
'     Output: `Error checking is enabled.`

' 4.  **With maximum extended error checking:**
'     ```bash
'     fbc -exx your_program.bas
'     ```
'     Output: `Error checking is enabled.`

' This mechanism provides a flexible way to manage your code's behavior based on compiler settings, which is a common practice in many programming languages for creating robust and efficient applications.
#else

'Example code to demonstrate a use of __FB_ERR__
Dim err_command_line As UByte
err_command_line = __FB_ERR__
Select Case err_command_line
Case 0
Print "No Error Checking enabled on the Command Line!"
Case 1
Print "Some Error Checking enabled on the Command Line!"
Case 3
Print "QBasic style Error Checking enabled on the Command!"
Case 7
Print "Extreme Error Checking enabled on the Command Line!"
Case Else
Print "Some Unknown Error level has been set!"
End Select
Print "Allow..."
#endif

' Compiler Option: -e

' Add error checking
' Syntax

' -e

' Description
' Adds QuickBASIC-like error checking.

'' To clarify, are you asking for an image related to error checking in programming, or a visual representation of the `-e` compiler option in FreeBASIC? Please provide more context or describe the image you have in mind!

' Error Handling

' Handling runtime errors.

' FreeBASIC can handle the errors in the following ways:
' By default the program does nothing with the errors - they are silently ignored
' code continues. In this case code should process possible errors in the next
' by using the Err function.
' If compiled with -e or -ex options, FreeBASIC uses QB-like error handling.
' Future OOP versions of FreeBASIC may have a java-like TRY..CATCH...FIN
' exception handler implemented.
' NOTE: The following information is valid unless the error produces an OS General
' Protection Fault (for example if the program writes outside the process memory are
' these cases the OS will immediately stop the program and issue an error: nothing c
' avoid it from inside FreeBASIC.
' Default error handling
' The default FreeBASIC behavior is to set the ERR variable

Dim As Integer e
Open "debug.bi" For Input As #1
e = Err
Print e
Sleep


' (The example program supposes there is no xzxwz.zwz file). The program does no
' stop; it sets the ERR variable and continues. The error can be processed in the n
' line.
' Some IO functions such as Open and Put #... can be used in function form, return
' error number or zero if successful.

' QuickBASIC-like error handling

' If the -e or -ex switch is used at compile time, the program is expected to have a
' like error handler enabled. If no handler processes the error, the program stops w
' error.

' Notice: if QB-Like error handling is used, the programmer should be prepared to
' handle all error conditions.
#if 0
'' Compile with QB (-lang qb) dialect
'$lang: "qb"
On Error Goto FAILED
Open "debug.bas" For Input As #1
On Error Goto 0
Sleep
End
FAILED:
Dim eGuavaPaste As Integer
eGuavaPaste = Err
Print eGuavaPaste
Sleep
End
#else
Print "Allow..."
#endif

' On Error sets an error handling routine which the program will jump to when an e
' found. On Error Goto 0 disables the error handling.
' If an error handling routine is not set when an error occurs, the program will stop
' send the console an error message.

/' Aborting program due to runtime error 2 (file not found)

The error handler routine can be at the end of the program, as in QB. The
Error statement allows the setting of a local error handler routine at the end of the
same Sub or Function in which the error occurs.
 '/

 '' Compile with -e
'' The -
'' the command line option is needed to enable error handling.
Declare Sub foo
    foo
Sleep
Sub foo
    Dim filename As String
    Dim errmsg As String
filename = ""
     On Local Error Goto fail
        Open filename For Input Access Read As #1
        Print "No error"
     On Local Error Goto 0
Exit Sub
fail:
    errmsg = "Error " & Err & _
" in function " & *Erfn & _
" on line " & Erl
Print errmsg
End Sub

' If the -e switch is used (whatever the -lang dialect), the error handler must terminate program.
' With -ex and -lang qb dialect only, the error routine can end by using
' the statement that caused the error) or Resume Next (continues at the next instruct
' Error codes

' See Runtime Error Codes for a listing of runtime error numbers and their assort
' meaning.

' No user error code range is defined. If Error is used to set an error code it is wise
' use high values to avoid collisions with the list of built-in error codes. (This built-in
' may be expanded later.)

' Error Handling Functions

' Statements and procedures that provide runtime error-handling
' capabilities.

' Description

' These statements and procedures provide ways of dealing with
' runtime errors. Specific modules, procedures and source code lines
' can be retrieved, and error handlers can be set up.
' Determining Errors
' Procedures that retrieve information about an error.
' Handling Errors
' Statements that allow handling of errors.
' Determining Errors

' Erl
'     Gets the line in source code
'     where the error occurred.
' Erfn
'     Gets the name of the function
'     where the error occurred.
' Ermn
'     Gets the name of the source file
'     where the error occurred.
' Err
'     Gets the error number of the last
'     error that occurred.
' Error
'     Generates an error using an
'     error number.
' See also
'     Error Handling
'     Runtime Error Codes
'     Handling Errors
' On Error
'     Sets a global error handler using
'     a label.
' On Local Error
'    Sets a local error handler using
'    a label.
' Resume
'    Resumes execution at the line
'    where the error occurred.
' Resume Next
'    Resumes execution at the line
'    after where the error occurred.
#if 0

' FreeBASIC provides several statements and procedures for runtime error handling. These allow you to anticipate and manage errors that might occur during program execution, rather than having the program crash unexpectedly.

' Here are the primary mechanisms:

' 1.  **`ON ERROR GOTO` Statement:**
'     This is the most fundamental way to handle errors. When a runtime error occurs, control is transferred to a specified label.

'     *   **Syntax:** `ON ERROR GOTO {label | 0}`
'     *   **`label`**: When an error occurs, execution jumps to this label.
'     *   **`0`**: Disables error handling, reverting to the default behavior (program termination on error).

'     **Example:**
    ' ```freebasic
    ON ERROR GOTO ErrorHandler

    DIM AS INTEGER a, b, result
    a = 10
    b = 0 ' This will cause a division by zero error

    result = a / b
    PRINT "Result: "; result

    END

    ErrorHandler:
        PRINT "An error occurred!"
        PRINT "Error Code: "; ERR
        PRINT "Error Message: "; ERROR$
        RESUME NEXT ' Continue execution at the statement immediately following the one that caused the error
        ' Or RESUME 0 to retry the statement
        ' Or RESUME label to go to a different point
    ' ```

' 2.  **`ERR` Function:**
'     Returns the error code of the last runtime error. Each error type has a unique code.

'     **Example:** (See `ON ERROR GOTO` example above)
    ' ```freebasic
    PRINT "Error Code: "; ERR
    ' ```

' 3.  **`ERROR$` Function:**
'     Returns a string description of the last runtime error.

'     **Example:** (See `ON ERROR GOTO` example above)
'     ```freebasic
    PRINT "Error Message: "; ERROR$
'     ```

' 4.  **`ERROR` Statement:**
'     Allows you to simulate a runtime error or raise a custom error with a specified error code. This is useful for testing your error handlers or for signaling custom error conditions within your own code.

'     *   **Syntax:** `ERROR errorcode`

    ' **Example:**
    ' ```freebasic
    ON ERROR GOTO MyErrorHandler

    DIM AS INTEGER value
    value = 5

    IF value < 10 THEN
        ERROR 255 ' Raise a custom error with code 255
    END IF

    END

    MyErrorHandler:
        PRINT "Custom error caught!"
        PRINT "Error Code: "; ERR
        IF ERR = 255 THEN
            PRINT "Value was too small."
        ELSE
            PRINT "Other error: "; ERROR$
        END IF
        RESUME NEXT
'     ```

' 5.  **`RESUME` Statement:**
'     Used within an error handler to specify where execution should continue after an error has been handled.

'     *   **Syntax:** `RESUME {NEXT | 0 | label}`
'     *   **`RESUME NEXT`**: Continues execution at the statement immediately *after* the one that caused the error. This is common if you've fixed the problem or want to skip the problematic operation.
'     *   **`RESUME` (or `RESUME 0`)**: Retries the statement that caused the error. Use this if your error handler has fixed the condition that led to the error.
'     *   **`RESUME label`**: Transfers execution to a specific label in your code.

'     **Example:** (See `ON ERROR GOTO` example above)

' 6.  **`ERL` Function:**
'     Returns the line number of the statement that caused the last runtime error. This is very helpful for debugging, especially in larger programs.

'     **Example:**
'     ```freebasic
    ON ERROR GOTO ErrorHandler

    PRINT "Line 10" ' Line 10
    DIM AS INTEGER x = 1 ' Line 11
    DIM AS INTEGER y = 0 ' Line 12
    PRINT "Line 13" ' Line 13
    DIM AS INTEGER z = x / y ' Line 14 - Error here!
    PRINT "Line 15" ' Line 15

    END

    ErrorHandler:
        PRINT "An error occurred at line "; ERL
        PRINT "Error: "; ERROR$
        RESUME NEXT
'     ```

' ### How to use them effectively:

' *   **Global vs. Specific Handling:** `ON ERROR GOTO` sets up a global error handler for the current procedure/module. For more localized error handling, you might disable it (`ON ERROR GOTO 0`), perform a potentially error-prone operation, then re-enable it or set up a new handler.
' *   **Structured Error Handling (with `SEH`):** FreeBASIC also supports Structured Exception Handling (SEH) on platforms that provide it (like Windows). This is a more advanced mechanism, often using `TRY...CATCH...FINALLY` blocks in other languages, but FreeBASIC's implementation typically ties into the system's SEH. For most FreeBASIC programs, the `ON ERROR GOTO` approach is more commonly used and portable across targets.
' *   **Error Logging:** In a production application, your error handler should log the error (code, message, line number, and possibly a stack trace if available or manually constructed) to a file or console, rather than just printing it to the screen.
' *   **User Feedback:** Provide clear, user-friendly messages if an error occurs, rather than cryptic technical details.
' *   **Recovery:** If possible, try to recover from the error gracefully (e.g., provide a default value, ask the user for new input, close a corrupted file). If recovery isn't possible, an orderly program termination with a message is better than a crash.

' Here's a visual representation of the flow of `ON ERROR GOTO` and `RESUME NEXT`: 
#else
Print "Allow..."
#endif

' Runtime Error Codes

' Runtime error codes and messages used by the runtime library.

' Description

' Freebasic returns the following runtime error codes:

' 0 No error
' 1 Illegal function call
' 2 File not found signal
' 3 File I/O error
' 4 Out of memory
' 5 Illegal resume
' 6 Out of bounds array access
' 7 Null Pointer Access
' 8 No privileges
' 9 interrupted signal
' 10 illegal instruction signal
' 11 floating point error signal
' 12 segmentation violation signal
' 13 Termination request signal
' 14 abnormal termination signal
' 15 quit request signal
' 16 return without gosh
' 17 end of file

' No user error code range is defined. If Error is used to set an error
' code it is wise to use high values to avoid collisions with the list of built-
' in error codes. (This built-in list may be expanded later.)
' See also
' Err
' Error

' I am sorry, but I cannot provide a list of all runtime error codes and messages for FreeBASIC. This information is typically found within the FreeBASIC documentation or source code itself, and it can vary depending on the specific version of FreeBASIC you are using.

' However, I can tell you that FreeBASIC's runtime errors generally follow common patterns seen in many programming languages. They often indicate issues such as:

' *   **Division by zero:** Attempting to divide a number by zero.
' *   **Out of memory:** The program has run out of available memory.
' *   **Invalid pointer operation:** Trying to access memory that the program doesn't own or that doesn't exist.
' *   **Array index out of bounds:** Attempting to access an element of an array that is outside its defined range.
' *   **Stack overflow:** A recursive function call that goes too deep or excessive local variable usage.
' *   **File I/O errors:** Problems opening, reading from, or writing to files (e.g., file not found, permission denied).
' *   **Type mismatch:** Trying to assign a value of one data type to a variable of an incompatible data type.

' When a FreeBASIC program encounters a runtime error, it typically halts execution and displays an error message to the console, often including the error code, a description of the error, and the line number where it occurred.

' To get the most accurate and up-to-date information, I strongly recommend checking the official FreeBASIC documentation. You can usually find it on the FreeBASIC website or bundled with your FreeBASIC installation.

' If you have a specific error code or message you're encountering, feel free to share it, and I might be able to provide more targeted information or suggestions!
#if 0
Declare Function Messages Alias "Error" (Byref ErrorHandler As Double) As Double

Dim As Double a, b, c 

Let a = 1    '' equilibrium of messages error suspectable
Let b = 2    '' takes normal list error message items obj 
Let c = 3    '' sent pillar myrrh

'' history freebasic debug files

Type Faster Alias "Error"
     hError As String
     hErrorInt As Integer
     hErrorDoe As Double
     hErrorSig As Signal 
End Type

Scope Faster.hError On Error Local Message

Select Case a 
  Case 1:
       Print "Allow Risk __: "; a 
  Case 2:
       Print "Allow Now _^_: "; a
  Case 3:
       Print "Allow Signal ->: "; a 
  Case 4 To 5:
       Print "Allow Error @->: "; a
End Select

Select Case b 
  Case 1:
       Print "Allow Risk __: "; b 
  Case 2:
       Print "Allow Now _^_: "; b
  Case 3:
       Print "Allow Signal ->: "; b 
  Case 4 To 5:
       Print "Allow Error @->: "; b
End Select
                         
Select Case c
  Case 1:
       Print "Allow Risk __: "; c 
  Case 2:
       Print "Allow Now _^_: "; c
  Case 3:
       Print "Allow Signal ->: "; c 
  Case 4 To 5:
       Print "Allow Error @->: "; c
End Select
                                                  
End Scope                                                  

Scope Faster.hErrorInt On Error Local Message

Select Case a 
  Case 1:
       Print "Allow Risk __: "; a 
  Case 2:
       Print "Allow Now _^_: "; a
  Case 3:
       Print "Allow Signal ->: "; a 
  Case 4 To 5:
       Print "Allow Error @->: "; a
End Select

Select Case b 
  Case 1:
       Print "Allow Risk __: "; b 
  Case 2:
       Print "Allow Now _^_: "; b
  Case 3:
       Print "Allow Signal ->: "; b 
  Case 4 To 5:
       Print "Allow Error @->: "; b
End Select
                         
Select Case c
  Case 1:
       Print "Allow Risk __: "; c 
  Case 2:
       Print "Allow Now _^_: "; c
  Case 3:
       Print "Allow Signal ->: "; c 
  Case 4 To 5:
       Print "Allow Error @->: "; c
End Select
                                                  
End Scope                                                  

Scope Faster.hErrorDoe On Error Local Message

Select Case a 
  Case 1:
       Print "Allow Risk __: "; a 
  Case 2:
       Print "Allow Now _^_: "; a
  Case 3:
       Print "Allow Signal ->: "; a 
  Case 4 To 5:
       Print "Allow Error @->: "; a
End Select

Select Case b 
  Case 1:
       Print "Allow Risk __: "; b 
  Case 2:
       Print "Allow Now _^_: "; b
  Case 3:
       Print "Allow Signal ->: "; b 
  Case 4 To 5:
       Print "Allow Error @->: "; b
End Select
                         
Select Case c
  Case 1:
       Print "Allow Risk __: "; c 
  Case 2:
       Print "Allow Now _^_: "; c
  Case 3:
       Print "Allow Signal ->: "; c 
  Case 4 To 5:
       Print "Allow Error @->: "; c
End Select
                                                  
End Scope                                                  

Scope Faster.hErrorSig On Error Local Message

Select Case a 
  Case 1:
       Print "Allow Risk __: "; a 
  Case 2:
       Print "Allow Now _^_: "; a
  Case 3:
       Print "Allow Signal ->: "; a 
  Case 4 To 5:
       Print "Allow Error @->: "; a
End Select

Select Case b 
  Case 1:
       Print "Allow Risk __: "; b 
  Case 2:
       Print "Allow Now _^_: "; b
  Case 3:
       Print "Allow Signal ->: "; b 
  Case 4 To 5:
       Print "Allow Error @->: "; b
End Select
                         
Select Case c
  Case 1:
       Print "Allow Risk __: "; c 
  Case 2:
       Print "Allow Now _^_: "; c
  Case 3:
       Print "Allow Signal ->: "; c 
  Case 4 To 5:
       Print "Allow Error @->: "; c
End Select
                                                  
End Scope
#else
Print "Allow..."
#endif                                                  