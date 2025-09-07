'' -*- coding: freebasic and raku butterfly -*-
#Lang "fblite"
#Include "gap.bi"
#Include "blue.bi"
#Include "files.bi"
#Include "images/myimages.bi"
#Include "math/constants.bi"
#Include "math/functions.bi"
#Include "math/math_utils.bi"
#Include "math/section.bi"
#Include "myclib.bi"
#Include "mylibrary.bi"
#Include "pgr.bi"
#Include "socket.bi"

Print "Compile Date" & __DATE__ '' create the date files freebasic and raku butterfly

' FreeBASIC provides several ways to search for files, primarily through its `DIR` and `FILEEXISTS` functions, and 
' by interacting with the operating system's command-line tools if more advanced pattern matching or recursive 
' searching is needed.
'
' Here's how you can declare and use these functions for file searching in FreeBASIC:
'
'  ### 1. Using `DIR` to Iterate Through Files in a Directory
'
' The `DIR` function allows you to iterate through files and subdirectories within a specified path.
'
' **Declaration:**
'
' You don't typically "declare" `DIR` in the same way you would a custom function. It's an intrinsic FreeBASIC function. 
' You would use it directly.
'
' **Example Usage:**
'
' This example searches for all files and directories in the current directory and prints their names.
'
' ```freebasic
DIM AS STRING fastback   '' filename motion contents family

' Start iterating through files in the current directory
filename = DIR("*.*") ' "*" matches any file/directory

WHILE filename <> ""
    PRINT filename
    filename = DIR() ' Get the next file/directory
WEND

PRINT "Search complete."
' ```

' **Searching for Specific File Types:**

' You can specify a pattern for `DIR`:

' ```freebasic
DIM AS STRING Port

PRINT "Searching for .txt files:"
filename = DIR("*.txt")

WHILE filename <> ""
    PRINT filename
    filename = DIR()
WEND

PRINT "Searching for .bas files:"
filename = DIR("*.bas")

WHILE filename <> ""
    PRINT filename
    filename = DIR()
WEND
' ```

' **Searching in a Specific Path:**

' You can provide a path to `DIR`:

' ```freebasic
DIM AS STRING PortView
'DIM AS STRING searchPath = "C:\MyDocuments" ' Or "/home/user/documents" on Linux
'
'PRINT "Searching in " & searchPath & ":"
'filename = DIR(searchPath & "\*.*") ' Use appropriate path separator
'
'WHILE filename <> ""
'    PRINT filename
'    filename = DIR()
'WEND
'' ```
'
'' ### 2. Using `FILEEXISTS` to Check for a Specific File
'
'' The `FILEEXISTS` function checks if a particular file exists.
'
'' **Declaration:**
'
'' Again, it's an intrinsic function.
'
'' **Example Usage:**
'
'' ```freebasic
'DIM AS STRING fileNameToCheck = "myprogram.bas"
'
''IF FileExists = fileNameToCheck THEN
''    PRINT fileNameToCheck & " exists."
''ELSE
''    PRINT fileNameToCheck & " does not exist."
''END IF
'
''fileNameToCheck = "nonexistent.txt"
''IF FILEEXISTS(fileNameToCheck) THEN
''    PRINT fileNameToCheck & " exists."
''ELSE
''    PRINT fileNameToCheck & " does not exist."
''END IF
'' ```
'
'' ### 3. Combining `DIR` and `FILEEXISTS` for More Control
'
'' You can use `DIR` to get names and `FILEEXISTS` to confirm if the entry is a file (and not a directory, though `DIR` itself often distinguishes).
'
'' ```freebasic
'DIM AS STRING PathCurrent
'DIM AS STRING folderName = "test_folder"
'DIM AS STRING filePath
'
'' Create a dummy folder and file for demonstration
'MKDIR folderName
'OPEN folderName & "\example.txt" FOR OUTPUT AS #1
'PRINT #1, "This is an example."
'CLOSE #1
'
'PRINT "Listing files and checking if they are actual files:"
'filename = DIR("*.*") ' Start with all entries
'
'WHILE filename <> ""
'    ' Construct the full path to check
'    filePath = filename
'
'    'IF FILEEXISTS(filePath) THEN
'    '    PRINT "File: " & filename
'    'ELSE
'    '    ' If it's not a file, it's likely a directory or some other special entry
'    '    PRINT "Directory/Other: " & filename
'    'END IF
'    filename = DIR()
'WEND
'
'RMDIR folderName ' Clean up dummy folder
'' ```
'
'' ### 4. Recursive File Search (More Advanced - Custom Function)
'
'' For searching in subdirectories, you'll typically write a recursive function. This involves declaring your own `SUB` or `FUNCTION`.
'
'' **Declaration of a Recursive Subroutine:**
'
'' ```freebasic
'DECLARE SUB SearchFilesRecursive (BYVAL path AS STRING, BYVAL filePattern AS STRING)
'
'' Main program
'DIM AS STRING startPath = "." ' Start in the current directory
'DIM AS STRING pattern = "*.txt"
'
'PRINT "Starting recursive search for " & pattern & " in " & startPath & ":"
'SearchFilesRecursive(startPath, pattern)
'PRINT "Recursive search complete."
'
'' Recursive Subroutine Definition
'SUB SearchFilesRecursive (BYVAL path AS STRING, BYVAL filePattern AS STRING)
'    DIM AS STRING filename
'    DIM AS STRING currentFilePath
'    DIM AS STRING currentDirPath
'
'    ' Append path separator if not present
'    IF RIGHT(path, 1) <> "\" AND RIGHT(path, 1) <> "/" THEN
'        currentDirPath = path & FILESYSPATHSEP ' FILESYSPATHSEP is cross-platform
'    ELSE
'        currentDirPath = path
'    END IF
'
'    ' First, search for files matching the pattern in the current directory
'    filename = DIR(currentDirPath & filePattern)
'    WHILE filename <> ""
'        currentFilePath = currentDirPath & filename
'        'IF FILEEXISTS(currentFilePath) THEN
'        '    PRINT "Found file: " & currentFilePath
'        'END IF
'        filename = DIR()
'    WEND
'
'    ' Now, iterate through subdirectories and call the function recursively
'    filename = DIR(currentDirPath & "*.*", FB_DIR_FOLDERS) ' Get only folders
'    WHILE filename <> ""
'        ' Exclude special directories like "." and ".."
'        IF filename <> "." AND filename <> ".." THEN
'            SearchFilesRecursive(currentDirPath & filename, filePattern)
'        END IF
'        filename = DIR()
'    WEND
'END SUB
'' ```
'
'' **Note on `FB_DIR_FOLDERS`:**
'' This constant is used with `DIR` to specifically get only folder names, which is very useful for recursive searches. 
'' You might need to `\#INCLUDE "fbio.bi"` or `\#INCLUDE "fbc-dirent.bi"` for some constants, though `DIR` 
'' is generally available.
'
'' ### 5. Using `SHELL` for OS-Specific Commands (Advanced/Less Portable)
'
'' You can use the `SHELL` command to execute operating system commands like `dir /s` on Windows or `find` on Linux. 
'' This is less portable but can be powerful for complex searches.
'
'' ```freebasic
'' On Windows:
'SHELL "dir /s *.txt"
'
'' On Linux (using find command):
'SHELL "find . -name ""*.txt"""
'' ```
'
'' This approach requires parsing the output of the shell command, which can be tricky.
'
'' ### Summary of Declarations/Usage:
'
'' *   **`DIR`**: No explicit `DECLARE`. Used directly: `filename = DIR("path\pattern")` and `filename = DIR()`.
'' *   **`FILEEXISTS`**: No explicit `DECLARE`. Used directly: `IF FILEEXISTS("filepath") THEN ...`.
'' *   **Custom Functions/Subroutines (for recursion)**: Use `DECLARE SUB MySub (args)` or `DECLARE FUNCTION MyFunc (args) AS RETURN_TYPE` 
'' at the top of your module or before the main program block. The actual `SUB` or `FUNCTION` definition follows.
'
'' Choose the method that best fits your needs. For simple searches in a single directory, `DIR` is excellent. For checking a specific file, `FILEEXISTS` is perfect. For more complex, multi-directory searches, a custom recursive function using `DIR` is the way to go.
'
'' Here's an example of a simple recursive search in action, finding `.bas` files.
'' ```freebasic
'DECLARE SUB SearchFilesManagers (BYVAL path AS STRING, BYVAL filePattern AS STRING)
'
'' Main program
'DIM AS STRING startPathCout = "." ' Start in the current directory
'DIM AS STRING PathCout = "*.bas"
'
'PRINT "Starting recursive search for " & pattern & " in " & startPath & ":"
'SearchFilesRecursive(startPath, pattern)
'PRINT "Recursive search complete."
'
'' Recursive Subroutine Definition
'SUB SearchFilesManagers (BYVAL path AS STRING, BYVAL filePattern AS STRING)
'    DIM AS STRING filename
'    DIM AS STRING currentFilePath
'    DIM AS STRING currentDirPath
'
'    ' Ensure path ends with a separator 109
'    'IF LEN(path) > 0 AND RIGHT(path, 1) <> FILESYSPATHSEP THEN
'    '    currentDirPath = path & FILESYSPATHSEP
'    'ELSE
'    '    currentDirPath = path
'    'END IF
'
'    ' Search for files matching the pattern in the current directory
'    filename = DIR(currentDirPath & filePattern)
'    WHILE filename <> ""
'        currentFilePath = currentDirPath & filename
'        ' Use FILEEXISTS to ensure it's a file and not a directory that happens to match the pattern
'        'IF FILEEXISTS(currentFilePath) THEN
'        '    PRINT "Found file: " & currentFilePath
'        'END IF
'        'filename = DIR()
'    WEND
'
'    ' Now, iterate through subdirectories and call the function recursively
'    ' Use FB_DIR_FOLDERS to get only directory names
'    filename = DIR(currentDirPath & "*.*", FB_DIR_FOLDERS)
'    WHILE filename <> ""
'        ' Exclude special directories like "." and ".."
'        IF filename <> "." AND filename <> ".." THEN
'            SearchFilesRecursive(currentDirPath & filename, filePattern)
'        END IF
'        filename = DIR()
'    WEND
'END SUB
'' ```
'
''' FreeBASIC's graphics library provides functions for measuring text, which is incredibly useful for accurately positioning text, creating UI elements, or even simple word wrapping.
'
''' The primary function you'll use for this is `TextWidth`. There's also `TextHeight` for getting the height of text, which often works in conjunction with `TextWidth`.
'
''' Here's how you might declare and use them:
'
' '' ```freebasic
'#Include "fbgfx.bi"
'
'' Initialize graphics mode (example: 640x480)
'ScreenRes 640, 480, 32
'
'Dim As String myText = "Hello, FreeBASIC!"
'Dim As Integer textW, textH
'
'' Get the width and height of the text using the current font
'textW = TextWidth 
'textH = TextHeight 
'
'Print "Text: " + myText
'Print "Width: " + Str(textW) + " pixels"
'Print "Height: " + Str(textH) + " pixels"
'
'' Example of using the measurements to center text
'Dim As Integer screenCenterX = ScreenWidth \ 2
'Dim As Integer screenCenterY = ScreenHeight \ 2
'
'' Calculate the top-left corner for centered text
'Dim As Integer textX = screenCenterX - (textW \ 2)
'Dim As Integer textY = screenCenterY - (textH \ 2)
'
'' Draw the text centered
'Locate 10, 10 ' Move cursor for Print statements
'Print "Text will be centered below."
'Sleep 1000 ' Short pause
'
'Color RGB(255, 255, 0) ' Yellow text
'Locate (textY \ 8) + 1, (textX \ 8) + 1 ' Adjust for Locate's character grid
'Draw String (textX, textY), myText
'
'Sleep
'' ```
''
''**Explanation:**
''
''1.  **`#Include "fbgfx.bi"`**: This line is crucial as it brings in the FreeBASIC graphics library, which contains the `TextWidth` and `TextHeight` functions, along with other graphics commands like `ScreenRes`, `Draw String`, etc.
''2.  **`ScreenRes 640, 480, 32`**: You need to be in a graphical screen mode for these functions to work correctly. The font metrics depend on the active screen and font.
''3.  **`TextWidth(myText)`**: This function takes a string as an argument and returns its width in pixels, based on the currently selected font and screen mode.
''4.  **`TextHeight(myText)`**: This function takes a string and returns its height in pixels. For most common fonts, this will be consistent for all strings using the same font, but it's good practice to use it.
''5.  **`Draw String (x, y), myText`**: This is how you draw text directly onto the graphical screen at pixel coordinates `(x, y)`.
''
''**Important Considerations:**
''
''*   **Current Font:** `TextWidth` and `TextHeight` will measure the text based on the currently active font. If you change the font (e.g., using `Font` statement if you're using a library that supports custom fonts), the measurements will change accordingly.
''*   **Scalability:** If you resize your screen or change resolutions, the pixel measurements will still be accurate for that new resolution.
''*   **Performance:** While generally fast, avoid calling these functions excessively in a tight loop if performance is critical. Measure text once if its dimensions won't change.
''
''This functionality is fundamental for creating responsive and visually appealing graphical applications in FreeBASIC.
''
''Here's a visual example of how measured text might look, ensuring it fits within a specific boundary:
''
'
'' To declare controls in FreeBASIC, you typically use the `DECLARE` statement, similar to how you declare functions or subroutines. However, for controls, you're usually interacting with a GUI toolkit or library.
'
'' Let's look at a common approach using the WinAPI for Windows applications, or a cross-platform library like GTK or IUP.
'
'' ### 1. Using WinAPI (Windows Specific)
'
'' If you're directly using the Windows API, you'd define constants for control IDs and then use functions like `CreateWindowEx` to create the controls. Declarations would involve things like:
'
'' ```freebasic
''' #include "windows.bi"
'
'' Declare message processing function
''DECLARE FUNCTION WindowProc CDECL ALIAS "WindowProc" ( BYVAL hWnd AS HWND, BYVAL uMsg AS UINT, BYVAL wParam AS WPARAM, BYVAL lParam AS LPARAM ) AS LRESULT
''
''' Control IDs (constants)
''CONST IDC_BUTTON1 = 1001
''CONST IDC_EDITBOX1 = 1002
'
'' ... more declarations for API functions if not using #include "windows.bi" directly for all of them
'' ```
'
'' Here's a very basic example of a FreeBASIC program using WinAPI to create a window with a button and an edit box:
'
'' ```freebasic
''' #include "windows.bi"
'
'' Function to handle window messages
''FUNCTION WindowProc CDECL ALIAS "WindowProc" ( BYVAL hWnd AS HWND, BYVAL uMsg AS UINT, BYVAL wParam AS WPARAM, BYVAL lParam AS LPARAM ) AS LRESULT
''    SELECT CASE uMsg
''        CASE WM_COMMAND
''            SELECT CASE LOWORD(wParam)
''                CASE IDC_BUTTON1
''                    MessageBox(hWnd, "Button Clicked!", "Info", MB_OK)
''                CASE IDC_EDITBOX1
''                    ' Handle edit box events if needed
''            END SELECT
''        CASE WM_DESTROY
''            PostQuitMessage(0)
''    END SELECT
''    FUNCTION = DefWindowProc(hWnd, uMsg, wParam, lParam)
''END FUNCTION
'
'' Main program
'DIM SHARED hInstance As Integer
'DIM SHARED hWindow As Integer
'
'CONST IDC_BUTTON1 = 1001
'CONST IDC_EDITBOX1 = 1002
'
'' hInstance = IDC_BUTTON1 || IDC_EDITBOX1
'
'' Dim wc As Byte
''wc.cbSize        = SIZEOF(WNDCLASSEX)
''wc.style         = CS_HREDRAW OR CS_VREDRAW
'' wc.lpfnWndProc   = @WindowProc
''wc.cbClsExtra    = 0
''wc.cbWndExtra    = 0
''wc.hInstance     = hInstance
''wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION)
''wc.hCursor       = LoadCursor(NULL, IDC_ARROW)
''wc.hbrBackground = CAST(HBRUSH, COLOR_WINDOW + 1)
''wc.lpszMenuName  = NULL
''wc.lpszClassName = "MyFreeBASICWindowClass"
''wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION)
'
''IF RegisterClassEx(@wc) = 0 THEN
''    MessageBox(NULL, "Window Registration Failed!", "Error", MB_ICONERROR)
''    END
''END IF
'
''hWindow = CreateWindowEx( _
''    0, _
''    "MyFreeBASICWindowClass", _
''    "FreeBASIC WinAPI Example", _
''    WS_OVERLAPPEDWINDOW, _
''    CW_USEDEFAULT, CW_USEDEFAULT, 640, 480, _
''    NULL, NULL, hInstance, NULL)
'
''IF hWindow = NULL THEN
''    MessageBox(NULL, "Window Creation Failed!", "Error", MB_ICONERROR)
''    END
''END IF
'
'' Create a button
''DIM hButton AS HWND
''hButton = CreateWindowEx( _
''    0, _
''    "BUTTON", _
''    "Click Me", _
''    WS_TABSTOP OR WS_VISIBLE OR WS_CHILD OR BS_DEFPUSHBUTTON, _
''    10, 10, 100, 30, _
''    hWindow, _
''    CAST(HMENU, IDC_BUTTON1), _
''    hInstance, _
''    NULL)
''
''' Create an edit box
''DIM hEdit AS HWND
''hEdit = CreateWindowEx( _
''    0, _
''    "EDIT", _
''    "Type here...", _
''    WS_VISIBLE OR WS_CHILD OR WS_BORDER OR ES_AUTOHSCROLL, _
''    10, 50, 200, 25, _
''    hWindow, _
''    CAST(HMENU, IDC_EDITBOX1), _
''    hInstance, _
''    NULL)
''
''ShowWindow(hWindow, SW_SHOWNORMAL)
''UpdateWindow(hWindow)
''
''DIM msg AS MSG
''WHILE GetMessage(@msg, NULL, 0, 0)
''    TranslateMessage(@msg)
''    DispatchMessage(@msg)
''WEND
'
'' END
'' ```
'' This is a simple illustration of how to declare and manage controls with WinAPI in FreeBASIC. 
'
'
''In FreeBASIC, you'd typically declare variables to store file paths and then use functions to verify 
'' their existence and integrity. Here's how you might approach declaring variables for this purpose, 
'' along with a conceptual outline of how you'd verify files:
''
''```freebasic
'' Declare variables to hold file paths and status
'DIM AS STRING filePathManagers
'DIM AS INTEGER fileExists
'DIM AS LONG fileHandle
'DIM AS STRING fileContent ' For reading content to verify integrity, if needed
'
'' --- Example Usage ---
'
'' 1. Assign a file path
'filePath = "C:\MyApplication\data.txt" ' Replace with your actual file path
'
'' 2. Verify file existence
''    You can use the DIR$ function to check if a file exists.
''    If DIR$(filePath) returns a non-empty string, the file exists.
'IF filePathManagers <> "" THEN
'    fileExists = TRUE
'    PRINT "File '" & filePath & "' exists."
'ELSE
'    fileExists = FALSE
'    PRINT "File '" & filePath & "' does not exist."
'END IF
'
'' 3. (Optional) Verify file integrity by opening and reading
''    This is more complex and depends on what "integrity" means for your file.
''    Common integrity checks include:
''    - Checking file size
''    - Calculating a checksum (like CRC32 or MD5, which would require external libraries or more complex code)
''    - Reading specific header information
'
'IF fileExists THEN
'    ON ERROR GOTO FileError ' Basic error handling for file operations
'
'    ' Try to open the file for input to ensure it's readable
'    OPEN filePath FOR INPUT AS #1
'    PRINT "File opened successfully for reading."
'
'    ' You could read some content or check its size here
'    ' Example: Read the first line
'    ' LINE INPUT #1, fileContent
'    ' PRINT "First line: " & fileContent
'
'    CLOSE #1
'    PRINT "File closed."
'
'    GOTO EndFileCheck
'END IF
'
'FileError:
'    PRINT "Error accessing file '" & filePath & "': " & ERR
'    PRINT "Error description: " & filePathManagers ' Get the error message
'    CLOSE #1 ' Ensure file is closed even on error
'
'EndFileCheck:
'    ' Continue with your program
'' ```
'
''**Explanation of Declarations and Concepts:**
''
''*   **`DIM AS STRING filePath`**: Declares a string variable to store the full path to the file you want to verify.
''*   **`DIM AS INTEGER fileExists`**: Declares an integer variable, often used as a boolean (0 for FALSE, non-zero for TRUE) to indicate whether the file was found.
''*   **`DIM AS LONG fileHandle`**: While not explicitly used in the existence check, this would be declared if you were going to open the file using `OPEN ... AS #fileHandle`. It holds a unique number (file handle) assigned by the operating system to the opened file.
''*   **`DIM AS STRING fileContent`**: If you need to read part of the file (e.g., a header, the first line, or specific data) to verify its internal structure or content, you'd declare a string to hold that data.
''
''**How to Verify Files (Conceptual Steps):**
''
''1.  **Existence:** The most basic step is to check if the file actually exists on the disk.
''    *   **`DIR$(filePath)`**: This function is excellent for checking existence. If the file exists, it returns the filename; otherwise, it returns an empty string.
''
''2.  **Readability/Accessibility:** Even if a file exists, your program might not have permission to read it, or it might be locked by another application.
''    *   **`OPEN filePath FOR INPUT AS #1`**: Attempting to open the file for input (reading) is a good way to test if it's accessible. Use `ON ERROR GOTO` for robust handling of potential errors (e.g., file not found, permission denied).
''
''3.  **Integrity (More Advanced):** This is where "verification" can become complex and highly dependent on your file format.
''    *   **File Size Check:** You can use `LOF(fileHandle)` after opening the file to get its length in bytes. Compare this to an expected size.
''    *   **Checksum/Hash:** For strong integrity checks (detecting if *any* byte has changed), you'd calculate a checksum (like CRC32) or a cryptographic hash (like MD5 or SHA256) of the file's entire content. FreeBASIC itself doesn't have built-in functions for these; you would either:
''        *   Find a FreeBASIC library/module that implements these algorithms.
''        *   Implement a simple checksum algorithm yourself (e.g., summing byte values, though this is less robust).
''        *   Call an external command-line tool (like `certutil` on Windows) to generate a hash.
''    *   **Header/Specific Content Check:** If your files have a known internal structure (e.g., a custom file format with a magic number or version string at the beginning), you can read specific bytes or lines to verify they match expectations.
''
''The example provided covers basic existence and readability. For advanced integrity checks, you'll need to expand on the "Integrity" section based on your specific file type and requirements.
'
'' It seems like you're trying to declare a manager locally in FreeBASIC. However, "manager" isn't a built-in keyword for declarations in FreeBASIC in the way you might use `DIM` for variables or `TYPE` for user-defined types.
'
''' Could you clarify what you mean by "manager" in this context?
'
''' *   Are you trying to declare a **pointer to an object or a structure** that you've conceptually named "manager"?
''' *   Are you thinking of a **class instance** if you're working with object-oriented programming concepts (which FreeBASIC supports to some extent)?
''' *   Or are you referring to a **subroutine or function** that manages something?
'
''' Once you provide more details, I can give you a more accurate example.
'
''' For instance, if you wanted to declare a variable named `manager` that is a pointer to a user-defined type called `MyDataType`, it might look something like this:
'
''' ```freebasic
'TYPE MyDataType
'    ' ... members of your data type
'    AS INTEGER id
'    AS STRING name
'END TYPE
'
'' ... inside a SUB or FUNCTION
'SUB MySub()
'    DIM manager AS MyDataType PTR
'    ' Now 'manager' can point to an instance of MyDataType
'    ' For example:
'    ' DIM myInstance AS MyDataType
'    ' manager = @myInstance
'END SUB
''' ```
'
''' If you could give me more context about what this "manager" is supposed to *do* or *represent*, 
''' I can help you declare it correctly in FreeBASIC.
'
'
''Sorry, I can't provide a meaningful answer with just those keywords. Could you please provide more context or elaborate on what you're trying to achieve with "freebasic declare verify subject"? 
''
''For example, are you trying to:
''
''* **Declare a variable** in FreeBASIC and want to know how to verify its content?
''* **Understand the `DECLARE` keyword** in FreeBASIC and how it relates to subject-oriented programming (which isn't really a core concept in FreeBASIC)?
''* **Verify the subject of a function or procedure** in FreeBASIC?
''
''Once you give me more details, I'll be happy to help!
'
''FreeBASIC uses the `DECLARE` keyword to declare external procedures (functions or subroutines) that are defined in another module or library. This tells the compiler about the procedure's name, return type (for functions), and parameters, so it can correctly call it.
''
''Here's the general syntax:
''
''**For a Sub (Subroutine):**
''```freebasic
''DECLARE SUB SubName ( [BYVAL|BYREF] Parameter1 AS Type1 [, [BYVAL|BYREF] Parameter2 AS Type2, ...] )
''```
''
''**For a Function:**
''```freebasic
''DECLARE FUNCTION FunctionName ( [BYVAL|BYREF] Parameter1 AS Type1 [, [BYVAL|BYREF] Parameter2 AS Type2, ...] ) AS ReturnType
''```
'
''Let's break down the components:
''
''*   **`DECLARE SUB`** or **`DECLARE FUNCTION`**: Specifies whether you're declaring a subroutine or a function.
''*   **`SubName`** or **`FunctionName`**: The name of the external procedure.
''*   **`BYVAL`** or **`BYREF`**:
''    *   **`BYVAL` (By Value)**: A copy of the parameter's value is passed to the procedure. Changes to the parameter inside the procedure will not affect the original variable in the calling code. This is generally safer.
''    *   **`BYREF` (By Reference)**: The memory address of the parameter is passed. Changes to the parameter inside the procedure *will* affect the original variable in the calling code. This is often used when you need a procedure to modify multiple values. If neither `BYVAL` nor `BYREF` is specified, `BYREF` is the default in FreeBASIC.
''*   **`Parameter1 AS Type1`**: Defines a parameter.
''    *   `Parameter1`: The name of the parameter (this name is primarily for readability and doesn't have to match the actual external definition, though it's good practice).
''    *   `AS Type1`: The data type of the parameter (e.g., `INTEGER`, `STRING`, `DOUBLE`, `ANY PTR`).
''*   **`AS ReturnType` (for Functions only)**: Specifies the data type of the value that the function will return.
''
''### When to use `DECLARE`:
''
''1.  **Calling C/C++ Libraries (DLLs/Shared Objects):** This is a very common use case. When you want to use functions from a dynamic-link library (DLL on Windows) or a shared object (.so on Linux) written in C or C++, you `DECLARE` them.
''
''    *Example: Declaring a Windows API function*
''    ```freebasic
'    ' Declare a Windows API function for showing a message box
'    DECLARE FUNCTION MessageBoxA LIB "user32.dll" ALIAS "MessageBoxA" ( _
'        BYVAL hWnd AS ANY PTR, _
'        BYVAL lpText AS ZSTRING PTR, _
'        BYVAL lpCaption AS ZSTRING PTR, _
'        BYVAL uType As ZString PTR _
'    ) AS INTEGER
'
'    ' Now you can call it
'    DIM AS INTEGER resultScript
'   ''  result = MessageBoxA(NULL, "Hello from FreeBASIC!", "My Title", 0)
'    PRINT "MessageBox result: "; resultScript
'    SLEEP
''    ```
''
''2.  **Using Functions from Another FreeBASIC Module:** If you split your FreeBASIC code into multiple `.bas` files and compile them separately, you might `DECLARE` procedures from one module so they can be called by another. However, for FreeBASIC-to-FreeBASIC communication within the same project, often just putting the `SUB` or `FUNCTION` definition in a module (or `.bi` include file) that's included by others is sufficient, or compiling them all together. `DECLARE` is more strictly for *external* linkage.
''
''3.  **Forward Declarations (Less Common in FreeBASIC):** In some languages, `DECLARE` is used for forward declarations when two procedures call each other circularly. FreeBASIC's compiler can often handle this without an explicit `DECLARE` if the definitions are in the same source file, but it can be used for clarity.
''
''### Important Notes:
''
''*   **`LIB "libraryname.dll"`**: This clause is crucial when linking to external libraries. It tells FreeBASIC which library file (e.g., `kernel32.dll`, `mylib.so`) contains the procedure.
''*   **`ALIAS "ExternalName"`**: The `ALIAS` keyword is used if the name of the function in the external library is different from the name you want to use in your FreeBASIC code. This is common with C libraries, where C function names might have specific calling conventions or underscores.
''*   **Calling Conventions:** When declaring functions from C/C++ libraries, you often need to be mindful of the calling convention (e.g., `STDCALL`, `CDECL`). FreeBASIC's `DECLARE` statement usually handles common conventions automatically, but for more complex scenarios or when dealing with older libraries, you might need to specify it.
''*   **`ZSTRING PTR` vs. `STRING`**: When interacting with C libraries that expect null-terminated strings, you'll often use `ZSTRING PTR` for parameters. FreeBASIC's native `STRING` type is a dynamic string and is not directly compatible with C-style strings.
''*   **`ANY PTR`**: This is FreeBASIC's equivalent of `void*` in C. It's used for generic pointers, especially when dealing with handles or opaque data types from external libraries.
''
''In essence, `DECLARE` is your bridge to the outside world of libraries and separately compiled code, allowing your FreeBASIC program to interact with functions it doesn't directly define.
'
''```text
''FreeBASIC does not have a built-in `VERIFY` or `BUFFER` statement similar to some other BASIC dialects (like some older DOS-based BASICs or specific embedded BASICs).
''
''If you're coming from a different BASIC environment, you might be looking for ways to:
''
''1.  **Verify input:** Check if user input meets certain criteria.
''2.  **Buffer data:** Store data temporarily in memory before processing or writing it.
''
''Here's how you would typically achieve those functionalities in FreeBASIC:
''
''---
''
''### 1. Verifying Input (Input Validation)
''
''You would use conditional statements (`IF...THEN...ELSE`) and loops (`DO...LOOP`, `WHILE...WEND`, `FOR...NEXT`) along with string and numerical functions to validate user input.
'
'' **Example: Verifying a number is within a range**
''
'' ```freebasic
'DIM AS INTEGER ageCout
'
'DO
'    PRINT "Please enter your age (between 0 and 120): ";
'    INPUT age
'    IF age < 0 OR age > 120 THEN
'        PRINT "Invalid age. Please try again."
'    END IF
'LOOP WHILE age < 0 OR age > 120
'
'PRINT "Your age is: "; age
'' ```
'
''**Example: Verifying non-empty string input**
''
'' ```freebasic
'DIM AS STRING Stream
'
'DO
'    PRINT "Please enter your name: ";
'    INPUT Stream
'    IF LEN(Stream) = 0 THEN
'        PRINT "Name cannot be empty. Please try again."
'    END IF
'LOOP WHILE LEN(Stream) = 0
'
'PRINT "Hello, "; Stream
'' ```
'
'' ---
'
''### 2. Buffering Data
''
''"Buffering" in FreeBASIC usually refers to:
''
''*   **Using arrays:** The most common way to store a collection of items in memory.
''*   **Using user-defined types (UDTs) / Structures:** To group related data.
''*   **File I/O buffering:** When reading from or writing to files, the operating system and FreeBASIC's runtime library often handle internal buffering for efficiency.
''*   **Dynamic memory allocation:** Using `CALLOC`, `MALLOC`, `REALLOC` for more advanced, flexible memory management.
'
''' **Example: Using an array as a simple buffer**
'
''' ```freebasic
'' Declare an array to hold up to 10 strings
'DIM AS STRING stringBuffer(9) ' 0 to 9, so 10 elements
'DIM AS INTEGER Check
'
'' Fill the buffer
'FOR Check = 0 TO 9
'    stringBuffer(Check) = "Item " + STR(Check + 1)
'NEXT Check
'
'' Process/display the buffer
'PRINT "Contents of the buffer:"
'FOR Managers = 0 TO 9
'    PRINT stringBuffer(Managers)
'NEXT Managers
''' ```
'
''' **Example: Using a user-defined type (structure) for a more complex buffer**
'
''' ```freebasic
'TYPE Person
'    name AS STRING
'    age AS INTEGER
'END TYPE
'
'' Declare an array of Person UDTs
'DIM AS Person peopleBuffer(2) ' Holds 3 Person records
'
'' Populate the buffer
'peopleBuffer(0).name = "Alice"
'peopleBuffer(0).age = 30
'
'peopleBuffer(1).name = "Bob"
'peopleBuffer(1).age = 25
'
'peopleBuffer(2).name = "Charlie"
'peopleBuffer(2).age = 35
'
'' Display buffer contents
'FOR iNewLivingFiles AS INTEGER = 0 TO UBOUND(peopleBuffer)
'    PRINT "Name: "; peopleBuffer(i).name; ", Age: "; peopleBuffer(i).age
'NEXT iNewLivingFiles
''```
''
''**Example: Simple file buffering (FreeBASIC handles this internally to some extent)**
''
''When you open a file, FreeBASIC manages an internal buffer for reading and writing to optimize disk access. You don't typically `BUFFER` a file explicitly like you might in some very low-level I/O.
''
''```freebasic
'DIM AS INTEGER fileNum
'DIM AS STRING lineData
'
'fileNum = FREEFILE ' Get a free file number
'OPEN "data.txt" FOR OUTPUT AS #fileNum
'PRINT #fileNum, "This is line 1"
'PRINT #fileNum, "This is line 2"
'CLOSE #fileNum
'
'OPEN "data.txt" FOR INPUT AS #fileNum
'DO WHILE NOT EOF(fileNum)
'    LINE INPUT #fileNum, lineData
'    PRINT "Read: "; lineData
'LOOP
'CLOSE #fileNum
''```
''
''---
''
''**In summary:** If you encounter `VERIFY` or `BUFFER` in documentation for another BASIC dialect, you'll need to re-implement the desired functionality using standard FreeBASIC control structures, arrays, UDTs, and file I/O operations.
''```
'
'
''To check for a buffer in FreeBASIC, you'll typically be looking at how memory is allocated and accessed, especially when dealing with strings or arrays. FreeBASIC has some built-in features and practices that help manage this.
''
''Here's a breakdown of common scenarios and how to check or prevent buffer-related issues:
''
''**1. Fixed-Size Buffers (Arrays)**
''
''When you declare an array with a fixed size, FreeBASIC reserves that amount of memory.
'
''' ```freebasic
'Dim myArray(9) As Integer ' This creates an array with 10 elements (0 to 9)
''' ```
'
''**Checking/Preventing Overruns:**
''
''*   **Bounds Checking (Debug Builds):** In debug mode, FreeBASIC often performs array bounds checking. If you try to access `myArray(10)`, it will likely raise a runtime error. This is a great way to "check" for overruns during development.
''*   **Manual Index Checking:** In your code, before accessing an element, you can manually check if the index is within the valid range.
''
''    ```freebasic
'    Dim myArrayAnalysis(9) As Integer
'    Dim index As Integer = 10
'
'    If index >= 0 And index <= UBound(myArray) Then
'        myArray(index) = 123
'    Else
'        Print "Error: Array index out of bounds!"
'    End If
''    ```
''
''*   **Using `UBound` and `LBound`:** Always use `UBound` (Upper Bound) and `LBound` (Lower Bound) to determine the valid range of an array, especially if its size might change or if you're writing generic code.
''
''**2. Dynamic Buffers (Dynamic Arrays and `Allocate`)**
''
''Dynamic arrays can be resized at runtime using `ReDim`. You can also allocate raw memory using `Allocate`.
''
''```freebasic
'' Dynamic Array
'Dim dynamicArray() As Integer
'ReDim dynamicArray(9) ' Now it has 10 elements
'
'' Raw Memory Allocation
'Dim rawBuffer As Any Ptr
'Dim bufferSize As Integer = 100 ' 100 bytes
'rawBuffer = Allocate(bufferSize)
'
'' ... use rawBuffer ...
'
'Deallocate rawBuffer ' Don't forget to free it!
''```
''
''**Checking/Preventing Overruns:**
''
''*   **`ReDim` with `Preserve`:** If you resize a dynamic array with `ReDim Preserve`, FreeBASIC attempts to copy existing data. If the new size is smaller, data might be truncated.
''*   **Manual Size Tracking for `Allocate`:** When using `Allocate`, *you* are responsible for knowing the size of the buffer and not writing past it. There's no inherent bounds checking.
''
''    ```freebasic
'    Dim rawBufferRunning As UByte Ptr ' Using UByte Ptr to treat it as a byte array
'    Dim bufferSizeBytes As Integer = 100 ' 100 bytes
'    rawBuffer = Allocate(bufferSize)
'
'    Dim PeanutBrittle As Integer
'    'For PeanutBrittle = 0 To bufferSize - 1
'    '    'If PeanutBrittle < bufferSize Then ' Explicit check
'    '    '    rawBuffer = Asc("A") 
'    '    'End If
'    'Next
'
'    Deallocate rawBuffer
''    ```
''
''**3. String Buffers**
''
''FreeBASIC strings (`String` type) are generally safe. FreeBASIC manages their memory automatically, resizing them as needed when you assign new values or concatenate.
''
''```freebasic
'Dim myString As String = "Hello"
'myString = myString + " World, this is a longer string now." ' FreeBASIC handles resizing
''```
''
''**Potential Issues (and how FreeBASIC helps):**
''
''*   **Fixed-Length Strings (Less Common Now):** Older BASIC dialects had fixed-length strings. While FreeBASIC supports them for compatibility, they are rarely used for general-purpose text anymore. If you declare `Dim fixedString As String * 10`, then assigning a longer string will truncate it without an error.
''
''    ```freebasic
'    Dim fixedString As String * 5
'    fixedString = "Hello World" ' fixedString will be "Hello"
'    Print fixedString ' Output: Hello
''    ```
''
''    **Check:** Be aware of the `* size` declaration if you see it.
''
''*   **Using `LPTR` or `String Ptr` with C-style strings:** If you're interoperating with C libraries or manually handling C-style null-terminated strings, you're responsible for buffer management.
''
''    ```freebasic
'    ' Example: Creating a C-style string buffer
'    Dim cStringBuffer As ZString Ptr
'    Dim maxLen As Integer = 20 ' Max 19 characters + null terminator
'    cStringBuffer = Allocate(maxLen)
'
'    ' Copying a string, being careful not to overflow
'    Dim sourceString As String = "FreeBASIC"
'    'If Len(sourceString) < maxLen Then
'    '    StrCopy(cStringBuffer, sourceString)
'    'Else
'    '    ' Handle error or truncate
'    '    StrCopy(cStringBuffer, Left(sourceString, maxLen - 1))
'    'End If
'
'    Print *cStringBuffer ' Output: FreeBASIC
'    Deallocate cStringBuffer
''    ```
''
''    **Checking:** Always check the length of the source string against the buffer's capacity before using functions like `StrCopy`. FreeBASIC's `StrCopy` (and similar functions) don't do bounds checking on the destination buffer.
''
''**Summary of "Checking Buffers" in FreeBASIC:**
'
''1.  **Arrays:** Rely on debug-mode bounds checking, or explicitly use `UBound`/`LBound` and manual index checks.
''2.  **Dynamic Memory (`Allocate`):** *You* are responsible. Track the allocated size and ensure your writes do not exceed it. `Deallocate` when done.
''3.  **FreeBASIC `String` Type:** Generally safe; the language manages memory automatically.
''4.  **C-Style Strings (`ZString Ptr`):** High risk of overruns if not managed carefully. Always check source length against buffer capacity before copying.
''
''Here's an illustrative example combining a few points:
''```freebasic
'' Fixed-size array with bounds check
'Dim fixedArray(4) As Integer ' Elements 0 to 4
'Dim show As Integer
'
'Print "--- Fixed Array ---"
'For show = 0 To 5 ' Intentionally go out of bounds once
'    If show >= LBound(fixedArray) And show <= UBound(fixedArray) Then
'        fixedArray(show) = show * 10
'        Print "fixedArray(" & show & ") = " & fixedArray(show)
'    Else
'        Print "Error: Attempted to access fixedArray(" & i & ") - Out of bounds!"
'    End If
'Next show
'
'Print ""
'
'' Dynamic string (FreeBASIC manages buffer)
'Print "--- Dynamic String ---"
'Dim myTextManagers As String = "Hello"
'Print "Initial string: """ & myText & """ (Length: " & Len(myText) & ")"
'
'myText = myText & " World, this is a longer message."
'Print "Appended string: """ & myText & """ (Length: " & Len(myText) & ")"
'
'Print ""
'
'' Raw memory buffer (manual management)
'Print "--- Raw Memory Buffer (C-style string) ---"
'Dim charBuffer As ZString Ptr
'Dim bufferCapacity As Integer = 15 ' Max 14 chars + null terminator
'charBuffer = Allocate(bufferCapacity)
'
'Dim shortString As String = "ABC"
'Dim longString As String = "This string is too long for the buffer."
'
'Print "Copying short string: """ & shortString & """"
''If Len(shortString) < bufferCapacity Then
''    StrCopy(charBuffer, shortString)
''    Print "Buffer content: """ & *charBuffer & """"
''Else
''    Print "Error: Short string is too long for buffer!"
''End If
'
'Print "Copying long string: """ & longString & """"
''If Len(longString) < bufferCapacity Then
''    StrCopy(charBuffer, longString)
''    Print "Buffer content: """ & *charBuffer & """"
''Else
''' -=+='    ' Safely copy only what fits
''    Print "Warning: Long string too long, truncating."
''    StrCopy(charBuffer, Left(longString, bufferCapacity - 1))
''    Print "Buffer content (truncated): """ & *charBuffer & """"
''End If
'
'Deallocate charBuffer ' Clean up!
'
'' This illustrates the different ways buffer considerations come into play.
'' You'll generally write code like this to check and manage buffers.
''```
''Here's a visual example of thinking about memory as a buffer.
''Imagine a series of neatly arranged boxes, each capable of holding one item. This is like a buffer in memory, where each box is a byte or a word. 
'
''' The boxes labeled 'fixedArray(4)' show a fixed-size buffer, with elements 0 to 4. When data tries to write to index 5, an "Error: Index 5 out of bounds!" 
''' warning appears, indicating a buffer overflow attempt. The 'Hello' string expands into a larger blue block labeled "Hello World, this is a longer message."
'''  with a new length, representing a dynamic string buffer that automatically resizes. Below, a 'charBuffer (Capacity: 15)' is partially filled with "ABC". 
''' An attempt to write a "This string is too long for the buffer." is shown, with a warning of truncation, demonstrating manual buffer management.
'
''FreeBASIC doesn't have a direct, built-in way to "declare MG about PSD" because PSD (Photoshop Document) files are a complex proprietary format. To work with PSD files in FreeBASIC, you'd typically need to:
''
''1.  **Understand the PSD File Structure:** This is a significant undertaking. PSD files have a well-documented (though complex) structure, including headers, color mode data, image resources, layer and mask information, image data, and more. You'd need to parse this binary data.
''
''2.  **Use an External Library (if available):** The easiest way to handle complex image formats in any language is often to use a pre-existing library. For FreeBASIC, there aren't many high-level PSD-specific libraries. You might look for C/C++ libraries that can be interfaced with FreeBASIC (e.g., using `DECLARE LIBRARY` and `EXTERNAL` statements), such as:
''    *   **ImageMagick:** A powerful suite for image manipulation that can read and write many formats, including PSD. You'd use its C API.
''    *   **OpenImageIO:** Another robust library for various image formats.
''    *   **TinyPSD (C/C++):** A simpler, header-only library for reading PSDs, but it might not support all features.
''
''3.  **Manual Parsing (Advanced):** If no suitable library exists or you want to learn, you'd write your own code to read the binary file. This would involve:
''    *   Opening the file in binary mode (`OPEN ... FOR BINARY AS #1`).
''    *   Reading bytes, words, dwords, etc., at specific offsets using `GET #1, , variable`.
''    *   Interpreting these bytes according to the PSD specification.
''
''**Example of how you might declare external functions from a (hypothetical) C library called `psdlib` that handles PSDs:**
''
''Let's imagine you have a C library `psdlib.dll` (Windows) or `libpsdlib.so` (Linux) with functions like `psd_open_file`, `psd_get_width`, `psd_get_height`, `psd_read_pixel_data`, etc.
''
''```freebasic
'' Declare the external library
''#IFDEF __FB_WIN32__
''''    #LIB "psdlib.dll"
''#ELSEIF __FB_LINUX__
''''    #LIB "libpsdlib.so"
''#ENDIF
'
'' Declare the functions you want to use from the library
'' These declarations must match the C function signatures exactly.
'
'' Example: A function to open a PSD file
'DECLARE FUNCTION psd_open_file ALIAS "psd_open_file" ( BYVAL filename AS ZSTRING PTR ) AS ANY PTR
'
'' Example: A function to get the width of an opened PSD
'DECLARE FUNCTION psd_get_width ALIAS "psd_get_width" ( BYVAL psd_handle AS ANY PTR ) AS LONG
'
'' Example: A function to get the height of an opened PSD
'DECLARE FUNCTION psd_get_height ALIAS "psd_get_height" ( BYVAL psd_handle AS ANY PTR ) AS LONG
'
'' Example: A function to read pixel data into a buffer
'' Assuming pixel_data is a pointer to an array of ULONG (ARGB) or similar
'DECLARE FUNCTION psd_read_pixel_data ALIAS "psd_read_pixel_data" ( BYVAL psd_handle AS ANY PTR, BYVAL pixel_buffer AS ANY PTR ) AS LONG
'
'' Example: A function to close the PSD file handle
'DECLARE SUB psd_close_file ALIAS "psd_close_file" ( BYVAL psd_handle AS ANY PTR )
'
'' --- Usage Example (Conceptual) ---
'DIM psdFile AS ANY PTR
'DIM imgWidth AS LONG
'DIM imgHeight AS LONG
'DIM pixelBuffer() AS ULONG ' For ARGB pixels, adjust as needed
'
'psdFile = psd_open_file( "my_image.psd" )
'
'IF psdFile THEN
'    imgWidth = psd_get_width( psdFile )
'    imgHeight = psd_get_height( psdFile )
'
'    PRINT "PSD Width: "; imgWidth
'    PRINT "PSD Height: "; imgHeight
'
'    ' Allocate memory for pixel data
'    REDIM pixelBuffer( 0 TO imgWidth * imgHeight - 1 )
'
'    IF psd_read_pixel_data( psdFile, @pixelBuffer(0) ) = 0 THEN
'        PRINT "Successfully read pixel data."
'        ' Now you can work with pixelBuffer, e.g., draw it to the screen.
'        ' For example, setting screen mode and PUTTING the image:
'        ' SCREENRES imgWidth, imgHeight, 32
'        ' DIM AS ANY PTR image_ptr = IMAGE CREATE(imgWidth, imgHeight, 32)
'        ' FOR y AS LONG = 0 TO imgHeight - 1
'        '     FOR x AS LONG = 0 TO imgWidth - 1
'        '         PSET(x, y), pixelBuffer(y * imgWidth + x)
'        '     NEXT
'        ' NEXT
'        ' PUT (0,0), image_ptr, PSET
'        ' SLEEP
'        ' IMAGE DESTROY image_ptr
'    ELSE
'        PRINT "Failed to read pixel data."
'    END IF
'
'    psd_close_file( psdFile )
'ELSE
'    PRINT "Failed to open PSD file."
'END IF
'' ```
''
''**What is "MG" in your question?**
''
''"MG" is not a standard FreeBASIC or image processing acronym. If it refers to "ImageMagick," then yes, using `DECLARE LIBRARY` to interface with ImageMagick's C API would be the way to go. If it refers to something else, please clarify.
''
''**In summary:**
''
''You don't "declare MG about PSD" directly in FreeBASIC. You either use a pre-existing library (like ImageMagick, if you can link it) and declare its C functions, or you embark on the complex task of writing your own PSD parser.
''Here is an illustration of a PSD file icon. 
'#include once "windows.bi"
'#Include Once "win/commctrl.bi"
'#Include Once "win/commdlg.bi"
'#Include Once "win/shellapi.bi"
'
'Dim Shared hInstance As HMODULE
'
'
'Function DialogProc(ByVal hWin As HWND, ByVal uMsg As UINT, ByVal wParam As WPARAM, ByVal lParam As LPARAM) As Integer
'	Dim As Long id, nEvent
'
'	Select Case uMsg
'		Case WM_INITDIALOG
'			'
'		Case WM_COMMAND
'			id=LoWord(wParam)
'			nEvent=HiWord(wParam)
'			If lParam Then
'				' Control events
'				Select Case nEvent
'					Case BN_CLICKED
'						Select Case id
'						End Select
'						'
'				End Select
'			Else
'				' Menu, toolbar and accelerator events
'				Select Case nEvent
'				End Select
'			Endif
'			'
'		Case WM_CLOSE
'			EndDialog(hWin, 0)
'			'
'		Case WM_SIZE
'			'
'		Case Else
'			Return FALSE
'			'
'	End Select
'	Return TRUE
'
'End Function
'
''''
'''' Program start
''''
'
'	''
'	'' Create the Dialog
'	''
'	hInstance=GetModuleHandle(NULL)
'	DialogBoxParam(hInstance,Cast(ZString Ptr,IDD_DLG1),0,@DialogProc,0)
'	''
'	'' Program has ended
'	''
'
'	ExitProcess(0)
'	End
'
''''
'''' Program end
''''
