'' -*- coding: freebasic -*-

'FreeBASIC provides several ways to copy files, primarily using the `FILECOPY` command or by manually reading from one file and writing to another.
'
'Here's a breakdown of how to check if files were copied successfully, using different approaches:

'### 1. Using `FILECOPY`
'
'The `FILECOPY` command is the simplest way to copy a file in FreeBASIC. It returns a `LONG` value (0 for success, non-zero for error).
'
'```freebasic
#include "./fbgfx.bi" ' Often included for file operations, though not strictly necessary for FILECOPY alone

DIM AS STRING sourceFile = "source.txt"
DIM AS STRING destinationFile = "destination.txt"

' Create a dummy source file for testing
OPEN sourceFile FOR OUTPUT AS #1
PRINT #1, "This is the content of the source file."
CLOSE #1

' Attempt to copy the file
DIM AS LONG copyResult

IF copyResult = 0 THEN
    PRINT "File copied successfully from " & sourceFile & " to " & destinationFile
    ' You can add further checks here, like comparing file sizes or content
ELSE
    PRINT "Error copying file. Error code: " & copyResult
    ' You might want to get more specific error information, though FILECOPY's error codes are limited.
END IF

' Clean up (optional)
KILL sourceFile
KILL destinationFile

SLEEP
'```
'
'**How to check for success:**
'
'*   **Return Value:** The primary check is the `copyResult` variable. `0` indicates success.
'*   **File Existence (Post-Copy):** You can use `DIR(destinationFile)` to check if the destination file now exists. If `DIR` returns an empty string, the file doesn't exist.
'
'    ```freebasic
    IF copyResult = 0 THEN
        PRINT "File copied successfully."
        IF DIR(destinationFile) <> "" THEN
            PRINT "Destination file exists."
        ELSE
            PRINT "Destination file does not exist, despite reported success. (Unlikely)"
        END IF
    ELSE
        PRINT "Error copying file."
    END IF
''    ```

'*   **File Size Comparison:** After a successful copy, you can compare the sizes of the source and destination files using `FILELEN`. They should be identical.
'
'    ```freebasic
    IF copyResult = 0 THEN
        PRINT "File copied successfully."
        IF sourceFile = destinationFile THEN
            PRINT "Source and destination file sizes match."
        ELSE
            PRINT "Warning: File sizes do not match after copy."
        END IF
    ELSE
        PRINT "Error copying file."
    END IF
''    ```

'### 2. Manual File Copy (Read/Write)
'
'For more control (e.g., copying large files in chunks, adding progress indicators, or filtering content), you can manually read from the source and write to the destination.
'
'```freebasic
#include "./fbgfx.bi"

DIM AS STRING sourceFileCalled = "source.bin"
DIM AS STRING destinationFileAddress = "destination.bin"
DIM AS LONG bytesCopied = 0

' Create a dummy source file with some binary data
OPEN sourceFile FOR BINARY AS #1
    FOR iNewCalledFiles AS INTEGER = 0 TO 255
        PUT #1, , i
    NEXT iNewCalledFiles
CLOSE #1

DIM AS INTEGER sourceHandle, destHandle
DIM AS UBYTE buffer(1024) ' Buffer for reading chunks
DIM AS LONG numBytesRead

' Open source file for input (binary)
sourceHandle = FREEFILE
OPEN sourceFile FOR BINARY ACCESS READ AS #sourceHandle

' Open destination file for output (binary)
destHandle = FREEFILE
OPEN destinationFile FOR BINARY ACCESS WRITE AS #destHandle

IF sourceHandle = 0 OR destHandle = 0 THEN
    PRINT "Error opening one or both files."
ELSE
    DO
''        GET #sourceHandle, , buffer ' Read a chunk
        numBytesRead = LOC(sourceHandle) - (LOF(sourceHandle) - LEN(buffer)) ' Calculate actual bytes read
        IF numBytesRead > 0 THEN
''            PUT #destHandle, , buffer ' Write the chunk
            bytesCopied += numBytesRead
        END IF
    LOOP WHILE NOT EOF(sourceHandle)

    CLOSE #sourceHandle
    CLOSE #destHandle

    PRINT "Manual copy complete. " & bytesCopied & " bytes copied."

    ' Check for success
    'IF FILELEN(sourceFile) = FILELEN(destinationFile) AND FILELEN(sourceFile) = bytesCopied THEN
    '    PRINT "Manual copy successful and file sizes match."
    'ELSE
    '    PRINT "Warning: Manual copy may have issues or file sizes do not match."
    'END IF
END If 



' Clean up (optional)
KILL sourceFile
KILL destinationFile

SLEEP
'```
'
'**How to check for success (Manual Copy):**
'
'*   **Error Checking on `OPEN`:** Check if `FREEFILE` returns 0 after opening, indicating an error.
'*   **File Length Comparison:** This is crucial. Compare `FILELEN(sourceFile)` with `FILELEN(destinationFile)` after the operation. They should be identical.
'*   **Bytes Copied Count:** If you're tracking `bytesCopied` like in the example, ensure it matches `FILELEN(sourceFile)`.
'*   **Content Comparison (More Complex):** For absolute certainty, you could read both files byte-by-byte or in chunks and compare their content. This is generally overkill unless data integrity is paramount and you suspect corruption.
'
'### Summary of Checks:
'
'1.  **Return Value of `FILECOPY`:** (Most direct for `FILECOPY`) `0` means success.
'2.  **Existence of Destination File:** Use `DIR(destinationFile)`.
'3.  **File Size Comparison:** Use `FILELEN(sourceFile)` vs. `FILELEN(destinationFile)`. This is a strong indicator for both `FILECOPY` and manual methods.
'4.  **Bytes Copied Count:** (For manual copies) Compare the count of bytes written to the source file's size.
'5.  **Error Handling on `OPEN`:** (For manual copies) Check for `FREEFILE` returning 0.
'
'For most cases, using `FILECOPY` and checking its return value along with a file size comparison is sufficient. Here is an example: 

'Certainly! When creating "tailor messages" in FreeBASIC, you're likely referring to custom messages or prompts that guide a user, display information, or solicit input. FreeBASIC offers several ways to do this, ranging from simple `PRINT` statements to more interactive input functions.
'
'Here's a breakdown of common methods to create and display messages, along with examples:
'
'### 1. Simple Output: `PRINT`
'
'The most basic way to display a message.
'
' ```freebasic
'' Display a simple message
PRINT "Welcome to the FreeBASIC message system!"
PRINT "Please enter your details below."
'' ```


'' ### 2. Getting User Input: `INPUT`

'' This function displays a message (a "prompt") and then waits for the user to type something and press Enter.

'' ```freebasic
DIM userNameFiles AS STRING
DIM userAge AS INTEGER

' Prompt for user's name
INPUT "Enter your name: ", userName

' Prompt for user's age
INPUT "Enter your age: ", userAge

PRINT "Hello, "; userName; "! You are "; userAge; " years old."
'' ```

'' ### 3. Combining `PRINT` and `INPUT` for Multi-line Prompts

'' Sometimes you want to give more instructions before asking for input.

'' ```freebasic
PRINT "This program will ask for your favorite color and animal."
PRINT "Please type your answers carefully."

DIM favColor AS STRING
DIM favAnimal AS STRING

INPUT "What is your favorite color? ", favColor
INPUT "What is your favorite animal? ", favAnimal

PRINT "So, your favorite color is "; favColor; " and your favorite animal is "; favAnimal; "."
'' ```

'### 4. Customizing Message Appearance (Console Mode)
'
'You can change the color of text and background in the console for more impactful messages.
'
' ```freebasic
COLOR 10, 1 ' Green text on blue background
PRINT "This is an important message!"

COLOR 12, 0 ' Red text on black background
PRINT "WARNING: Something went wrong!"

COLOR 7, 0 ' Reset to default (white text on black background)
PRINT "Normal message again."
' ```
'
'### 5. Using `LOCATE` for Precise Positioning
'
'You can control where your messages appear on the console screen.
'
' ```freebasic
' Clear the screen
CLS

' Position a welcome message in the middle
LOCATE 5, 20
PRINT "Welcome to the Center!"

' Position an input prompt
LOCATE 7, 10
INPUT "What's your name? ", userName

' Position a response
LOCATE 9, 10
PRINT "Nice to meet you, "; userName; "!"
'```
'
'### 6. Message Boxes (GUI - using a library like WinBGI or custom GUI code)
'
'For graphical applications, you might want actual message boxes, similar to those in Windows. FreeBASIC itself is primarily console-oriented, but you can achieve this with external libraries or by writing your own GUI wrappers.
'
'Here's a conceptual example using a hypothetical `MessageBox` function (which you'd need to define or include from a library):
'
' ```freebasic
' This is conceptual for a GUI environment, not standard console FreeBASIC
' Assuming a function like this exists or is imported from a library

' FUNCTION MessageBox(message AS STRING, title AS STRING, type AS INTEGER) AS INTEGER

' MessageBox("Operation completed successfully!", "Success", MB_OK)
' MessageBox("Are you sure you want to quit?", "Confirm Exit", MB_YESNO)
'' ```

'### Example: A Simple "Tailor Message" Program
'
'Let's put some of these together into a small program that "tailors" a greeting based on user input.
'
' ```freebasic
' Define constants for colors for better readability
CONST COLOR_GREEN = 10
CONST COLOR_RED = 12
CONST COLOR_YELLOW = 14
CONST COLOR_WHITE = 7
CONST COLOR_BLACK = 0

CLS ' Clear the screen

DIM userNameMessages AS STRING
DIM userMood AS STRING

' Welcome message
COLOR COLOR_YELLOW, COLOR_BLACK
LOCATE 3, 15
PRINT "--- Welcome to the Mood Tailor! ---"

' Get user's name
COLOR COLOR_WHITE, COLOR_BLACK
LOCATE 6, 10
INPUT "Please enter your name: ", userName

' Get user's mood
LOCATE 8, 10
INPUT "How are you feeling today (e.g., happy, sad, neutral)? ", userMood

' Tailor the message based on mood
COLOR COLOR_GREEN, COLOR_BLACK
LOCATE 11, 5
PRINT "Hello, "; userName; "!"

SELECT CASE LCASE(userMood) ' Convert to lowercase for case-insensitive comparison
    CASE "happy"
        PRINT "It's wonderful to hear you're feeling happy! Keep smiling! :D"
    CASE "sad"
        PRINT "I'm sorry to hear you're feeling sad. Hope your day gets better soon! :("
    CASE "neutral", "okay", "fine"
        PRINT "Feeling neutral is perfectly fine. Have a good day!"
    CASE ELSE
        PRINT "That's an interesting mood! Hope you have a fantastic day!"
END SELECT

COLOR COLOR_WHITE, COLOR_BLACK ' Reset colors
LOCATE 15, 1
PRINT "Press any key to exit."
SLEEP
' ```
'
'This example demonstrates how you can use different FreeBASIC features to create dynamic and responsive messages for your users. The key is to think about what information you need to convey and what interaction you want from the user.

'Are you looking for information on how to check for messages within files using FreeBASIC, or are you referring to a different context for "check messages files"? If you could provide more details, I can give you a more accurate answer.
'
'In the meantime, if you're working with text files and want to check for specific strings or "messages" within them, you would typically:
'
'1.  **Open the file:** Use `OPEN` to open the file for input.
'2.  **Read line by line:** Use `LINE INPUT` or `INPUT #` to read the file's contents.
'3.  **Check for content:** Use string functions like `INSTR` to see if a line contains your desired "message."
'4.  **Close the file:** Use `CLOSE` when you're done.

'' Here's a very basic example of how you might check if a file contains the word "error":

'' ```freebasic
' Example: Checking a file for a specific message

DIM fileNameFreebasic AS STRING
DIM fileNameQBasic AS STRING
DIM searchMessage AS STRING
DIM fileLine AS STRING
DIM found AS INTEGER

fileName = "log.txt" ' The file you want to check
searchMessage = "error" ' The message you are looking for

found = 0 ' Flag to indicate if the message was found

OPEN fileName FOR INPUT AS #1

IF ERR THEN
    PRINT "Error opening file: " & fileName
ELSE
    WHILE NOT EOF(1)
        LINE INPUT #1, fileLine
        IF INSTR(LCASE(fileLine), LCASE(searchMessage)) > 0 THEN
            PRINT "Message '" & searchMessage & "' found in line: " & fileLine
            found = 1
            ' You could exit here if you only need to find it once
            ' EXIT WHILE
        END IF
    WEND

    IF found = 0 THEN
        PRINT "Message '" & searchMessage & "' not found in " & fileName
    END IF

    CLOSE #1
END IF
' ```
'
'If you have a different type of "message file" in mind (e.g., a specific log format, a binary file, or something related to inter-process communication), please let me know!

'' I am sorry, I cannot generate an image with that prompt. Can I help with anything else?

'' Could you please clarify what you mean by "freebasic prompt files"? Are you looking for:

'' 1.  **Example FreeBASIC code files** that demonstrate how to use `INPUT`, `LINE INPUT`, or `PRINT` statements to create interactive prompts within a console application?
'' 2.  **Files that contain text prompts** to be used *by* a FreeBASIC program?
'' 3.  **Something else entirely** related to FreeBASIC and prompts?

'' Once I understand what you're looking for, I can try to help you better!

'' I am sorry, I cannot generate an image based on that prompt. Can I help with something else?

'' Sorry, I can't provide content on that topic.

'What do you mean by "topic files" in the context of FreeBASIC? Are you referring to:
'
'1.  **Header files (.bi)?** These contain declarations for functions, subroutines, types, and constants that can be used in your FreeBASIC programs.
'2.  **Documentation files?** Perhaps you're looking for help files or tutorials on specific FreeBASIC topics.
'3.  **Example files?** Code examples demonstrating various features.
'4.  **Source code files (.bas)?** Regular FreeBASIC program files.
'
'Could you please clarify what kind of "topic files" you're interested in? If you have a specific topic in mind, I might be able to help you find relevant information or examples.
'
'

'To create a header file in FreeBASIC, you typically define your functions, subroutines, and types in a separate `.bi` file. Here's a basic example:
'
'Let's say you want to create a header file for some common mathematical operations.
'
'**1. Create the Header File (e.g., `math_utils.bi`):**
'
' ```freebasic
' math_utils.bi

#ifndef MATH_UTILS_BI
#define MATH_UTILS_BI

' Declare a function to add two integers
DECLARE FUNCTION Add (BYVAL a AS INTEGER, BYVAL b AS INTEGER) AS INTEGER

' Declare a subroutine to print a message
DECLARE SUB PrintMessage (BYVAL msg AS STRING)

' Define a custom type
TYPE Point
    x AS INTEGER
    y AS INTEGER
END TYPE

#endif ' MATH_UTILS_BI
'' ```

'**Explanation of `math_utils.bi`:**
'
'*   `#ifndef MATH_UTILS_BI` and `#define MATH_UTILS_BI`: These are preprocessor directives that prevent the header file from being included multiple times in the same compilation unit. This is a common practice to avoid redefinition errors.
'*   `DECLARE FUNCTION Add (BYVAL a AS INTEGER, BYVAL b AS INTEGER) AS INTEGER`: This declares a function named `Add` that takes two `INTEGER` arguments (`a` and `b`) and returns an `INTEGER`.
'*   `DECLARE SUB PrintMessage (BYVAL msg AS STRING)`: This declares a subroutine named `PrintMessage` that takes one `STRING` argument (`msg`).
'*   `TYPE Point ... END TYPE`: This defines a custom user-defined type named `Point` with two integer members, `x` and `y`.
'
'**2. Create the Implementation File (e.g., `math_utils.bas`):**
'
'This file will contain the actual code for the functions and subroutines declared in the header.
'
' ```freebasic
' math_utils.bas

#include "math/math_utils.bi"

' Implement the Add function
FUNCTION Add (BYVAL a AS INTEGER, BYVAL b AS INTEGER) AS INTEGER
    RETURN a + b
END FUNCTION

' Implement the PrintMessage subroutine
SUB PrintMessage (BYVAL msg AS STRING)
    PRINT msg
END SUB
'```
'
'**Explanation of `math_utils.bas`:**
'
'*   `#include "math_utils.bi"`: This line tells the compiler to include the contents of `math_utils.bi` at this point. This makes the declarations from the header file available to this implementation file.
'
'**3. Create Your Main Program File (e.g., `main.bas`):**
'
'This is where you'll use the functions and types defined in your header and implementation files.
'
'```freebasic
' main.bas

#include "math/math_utils.bi"

DIM result AS INTEGER
DIM myPoint AS Point

' Use the Add function
result = Add(10, 5)
PRINT "Result of Add: "; result

' Use the PrintMessage subroutine
PrintMessage("Hello from main.bas!")

' Use the custom type
myPoint.x = 100
myPoint.y = 200
PRINT "Point coordinates: ("; myPoint.x; ", "; myPoint.y; ")"

SLEEP
'```
'
'**Explanation of `main.bas`:**
'
'*   `#include "math_utils.bi"`: Again, this includes the declarations, allowing your main program to know about `Add`, `PrintMessage`, and `Point`.
'
'**4. How to Compile:**
'
'To compile this in FreeBASIC, you typically compile all the `.bas` files together.
'
'```bash
'fbc main.bas math_utils.bas
'```
'
'This will create an executable file (e.g., `main.exe` on Windows, `main` on Linux) that you can then run.
'
'**Key Benefits of Using Header Files:**
'
'*   **Modularity:** Separates interface (declarations) from implementation (definitions), making your code more organized.
'*   **Reusability:** You can easily reuse your functions and types in different programs by just including the header file.
'*   **Faster Compilation:** When a `.bas` file changes, only that file and its direct dependencies might need to be recompiled, not every file that uses its declarations.
'*   **Easier Maintenance:** Changes to implementation don't require changes to every file that uses the declarations, as long as the interface remains the same.
'
'This structure is very similar to how header files (`.h` or `.hpp`) are used in C and C++.
'Here's a visual representation of how these files interact:
'
'```mermaid
'graph TD
'    A[main.bas] --> B{Includes math_utils.bi};
'    B --> C[math_utils.bi];
'    D[math_utils.bas] --> E{Includes math_utils.bi};
'    E --> F[math_utils.bi];
'    C -- Declares --> G[Functions, Subs, Types];
'    F -- Declares --> H[Functions, Subs, Types];
'    D -- Implements --> I[Functions, Subs definitions];
'    A -- Uses --> G;
'    linkStyle 0 stroke-width:2px,fill:none,stroke:blue;
'    linkStyle 3 stroke-width:2px,fill:none,stroke:blue;
'    linkStyle 6 stroke-width:2px,fill:none,stroke:green;
'    linkStyle 7 stroke-width:2px,fill:none,stroke:purple;
'```

'' I'm not entirely sure what you mean by "freebasic servers client." Could you please elaborate?

' Are you looking for:
'
'*   **Information on how to create a server and client using FreeBASIC?** If so, what kind of server/client are you interested in (e.g., a simple chat application, a game, a file transfer)?
'*   **Existing FreeBASIC server/client examples or libraries?**
'*   **A discussion about the capabilities of FreeBASIC for network programming?**
'*   **Something else entirely?**
'
'Once I have a better understanding of what you're looking for, I can provide a more helpful response.
'
'In the meantime, if you're looking for a visual representation related to networking, perhaps something like this would be interesting: 

'FreeBASIC is a free and open-source compiler for the BASIC programming language. It's designed to be compatible with QuickBASIC while also offering modern features and targeting various platforms.
'
'Here's some information about FreeBASIC:

'**Key Features and Characteristics:**
'
'*   **Syntax Compatibility:** Aims for high compatibility with Microsoft QuickBASIC (QB), making it easier for developers familiar with QB to transition.
'*   **Modern Features:** Includes modern programming constructs like pointers, user-defined types, objects (though not full object-oriented programming in the traditional sense, it has some capabilities), and more.
'*   **Multi-Platform:** Compiles for Windows, Linux, and DOS.
'*   **Various Output Formats:** Can create console applications, GUI applications, and dynamic link libraries (DLLs) or shared objects.
'*   **Graphics Capabilities:** Has built-in 2D graphics libraries, allowing for game development and graphical applications.
'*   **External Library Support:** Can interface with external C libraries, opening up a vast ecosystem of existing tools and functionalities.
'*   **Inline Assembly:** Supports inline assembly for performance-critical sections of code.
'*   **Open Source:** Being open source means its source code is freely available, allowing for community contributions and transparency.
'
'**Why use FreeBASIC?**
'
'*   **Learning:** It's an excellent choice for beginners to learn programming due to BASIC's relatively straightforward syntax.
'*   **Nostalgia/Porting:** For those who grew up with QuickBASIC, it offers a way to relive that experience or port older QB programs to modern systems.
'*   **Game Development:** Its graphics capabilities make it suitable for developing 2D games, especially for those who prefer a simpler language than C++ or Java.
'*   **Utility Programs:** Can be used to create small to medium-sized utility programs for various tasks.
'*   **Community:** While not as large as some other language communities, it has a dedicated group of users and developers.
'
'**Example of FreeBASIC Code (Simple "Hello, World!"):**
'
'```freebasic
' This is a comment

PRINT "Hello, World!"

' Wait for a key press before closing the console (optional)
SLEEP
' ```
'
'**Where to find more information and downloads:**
'
'*   **Official Website:** The primary source for downloads, documentation, and news.
'*   **Community Forums:** A good place to ask questions and interact with other users.
'*   **Wiki/Documentation:** Detailed information on the language syntax, functions, and libraries.
'
'If you're interested in a compiler that combines the simplicity of BASIC with modern features and multi-platform support, FreeBASIC is definitely worth exploring.
'
'Here's a retro-style image that might evoke the feeling of early BASIC programming environments:
'

'To check if a port is open in FreeBASIC, you'll typically use the Winsock API on Windows or equivalent socket libraries on other operating systems. FreeBASIC itself doesn't have a built-in function for this, so you'll need to interact with the underlying system's networking capabilities.
'
'Here's a conceptual outline of how you might approach this for a specific port on a given IP address or hostname, using the Winsock API as an example (common for Windows users of FreeBASIC):
'
'**Conceptual Steps:**
'
'1.  **Initialize Winsock:** Before you can use any Winsock functions, you need to initialize the library.
'2.  **Create a Socket:** You'll create a socket, which is an endpoint for communication.
'3.  **Set a Timeout (Optional but Recommended):** When trying to connect, you don't want your program to hang indefinitely if the port isn't open or the host is unreachable. You can set a timeout for the connection attempt.
'4.  **Connect to the Port:** Attempt to establish a connection to the target IP address and port.
'5.  **Check Connection Status:**
'    *   If the connection is successful, the port is likely open.
'    *   If the connection fails (and you've set a timeout), the port is likely closed or filtered.
'6.  **Close the Socket:** Always close the socket when you're done with it.
'7.  **Cleanup Winsock:** Deinitialize the Winsock library.
'
'**Simplified Example (Illustrative, not a complete ready-to-run FreeBASIC program):**
'
' ```freebasic
' This is a conceptual example and requires proper DECLARE LIBRARY and API definitions.
' You would need to include the necessary WinAPI headers/modules for Winsock.

' DECLARE LIBRARY "ws2_32.lib"
'     DECLARE FUNCTION WSAStartup ALIAS "WSAStartup" (BYVAL wVersionRequested AS WORD, lpWSAData AS WSADATA PTR) AS INTEGER
'     DECLARE FUNCTION WSACleanup ALIAS "WSACleanup" () AS INTEGER
'     DECLARE FUNCTION socket ALIAS "socket" (BYVAL af AS INTEGER, BYVAL typ AS INTEGER, BYVAL protocol AS INTEGER) AS INTEGER
'     DECLARE FUNCTION connect ALIAS "connect" (BYVAL s AS INTEGER, name AS SOCKADDR PTR, BYVAL namelen AS INTEGER) AS INTEGER
'     DECLARE FUNCTION closesocket ALIAS "closesocket" (BYVAL s AS INTEGER) AS INTEGER
'     DECLARE FUNCTION inet_addr ALIAS "inet_addr" (cp AS ZSTRING PTR) AS ULONG
'     DECLARE FUNCTION htons ALIAS "htons" (BYVAL hostshort AS USHORT) AS USHORT
' END DECLARE

' TYPE WSADATA
'     wVersion AS WORD
'     wHighVersion AS WORD
'     szDescription(0 TO 255) AS BYTE
'     szSystemStatus(0 TO 128) AS BYTE
'     iMaxSockets AS USHORT
'     iMaxUdpDg AS USHORT
'     lpVendorInfo AS ZSTRING PTR
' END TYPE

' TYPE SOCKADDR_IN
'     sin_family AS USHORT
'     sin_port AS USHORT
'     sin_addr AS ULONG
'     sin_zero(0 TO 7) AS BYTE
' END TYPE

' CONST AF_INET = 2
' CONST SOCK_STREAM = 1
' CONST IPPROTO_TCP = 6
' CONST INVALID_SOCKET = -1
' CONST SOCKET_ERROR = -1

' FUNCTION CheckPortOpen (BYVAL host AS ZSTRING, BYVAL port AS USHORT) AS BOOLEAN
'     DIM wsaData AS WSADATA
'     DIM sock AS INTEGER
'     DIM sin AS SOCKADDR_IN
'     DIM bResult AS BOOLEAN = FALSE

'     ' 1. Initialize Winsock
'     IF WSAStartup(&h0202, @wsaData) <> 0 THEN
'         PRINT "WSAStartup failed."
'         RETURN FALSE
'     END IF

'     ' 2. Create a Socket
'     sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
'     IF sock = INVALID_SOCKET THEN
'         PRINT "Error creating socket."
'         WSACleanup()
'         RETURN FALSE
'     END IF

'     ' (Optional) Set a timeout - this is more complex and involves ioctlsocket or setsockopt
'     ' For simplicity, this example omits the explicit timeout, meaning connect might block.

'     ' Set up the sockaddr_in structure
'     sin.sin_family = AF_INET
'     sin.sin_port = htons(port)
'     sin.sin_addr = inet_addr(STR PTR @host) ' Convert IP string to ULONG

'     ' 4. Connect to the Port
'     IF connect(sock, CTYPE(SOCKADDR PTR, @sin), SIZEOF(SOCKADDR_IN)) <> SOCKET_ERROR THEN
'         ' 5. Check Connection Status - Success!
'         bResult = TRUE
'     ELSE
'         ' 5. Check Connection Status - Failure
'         PRINT "Connection to " & host & ":" & port & " failed."
'     END IF

'     ' 6. Close the Socket
'     closesocket(sock)

'     ' 7. Cleanup Winsock
'     WSACleanup()

'     RETURN bResult
' END FUNCTION

' Main program logic
' DIM targetHost AS ZSTRING = "127.0.0.1" ' Or "google.com"
' DIM targetPort AS USHORT = 80

' IF CheckPortOpen(targetHost, targetPort) THEN
'     PRINT "Port " & targetPort & " on " & targetHost & " is open."
' ELSE
'     PRINT "Port " & targetPort & " on " & targetHost & " is closed or unreachable."
' END IF

' SLEEP
' ```
'
'**Key Considerations for a Real FreeBASIC Program:**
'
'1.  **Winsock Header/Module:** You'll need to properly `DECLARE LIBRARY` and `TYPE` definitions for the Winsock API functions and structures. Many FreeBASIC examples and forum posts provide these. You might find a `win/winsock.bi` or similar include file in some FreeBASIC distributions or user libraries.
'2.  **Error Handling:** The example is minimal. Real-world code needs robust error handling for every API call (e.g., checking `WSAGetLastError()` for specific error codes).
'3.  **Blocking vs. Non-Blocking:** The `connect` function is often blocking by default, meaning your program will pause until it connects or times out (which can be long). For better responsiveness, you'd typically set the socket to non-blocking mode (`ioctlsocket` with `FIONBIO`) and use `select` to wait for connection completion with a specific timeout. This is more advanced.
'4.  **Platform Specificity:** The `Winsock` API is for Windows. On Linux/Unix-like systems, you'd use standard POSIX sockets (`sys/socket.h`, `netinet/in.h`, etc.), which have similar concepts but different function names and definitions.
'5.  **DNS Resolution:** If you're providing a hostname (like "google.com") instead of an IP address, you'll first need to perform a DNS lookup (e.g., using `gethostbyname` or `getaddrinfo`) to resolve the hostname to an IP address.
'
'**To create a working example, you would need to:**
'
'1.  Find or create the FreeBASIC definitions for Winsock.
'2.  Implement the full error handling.
'3.  Consider adding non-blocking connect with a timeout for a better user experience.
'
'Would you like to see a visual representation of how a network connection attempt works conceptually?


'' ```freebasic
' Define a module-level variable
DIM shared moduleLevelVariable AS INTEGER

SUB MySub()
    ' Define a local variable within MySub
    DIM localVariable AS INTEGER
    localVariable = 10
    moduleLevelVariable = 20 ' Accessing and modifying the module-level variable

    PRINT "Inside MySub:"
    PRINT "Local Variable: "; localVariable
    PRINT "Module Level Variable: "; moduleLevelVariable

    ' Call another sub-routine
    ''    AnotherSub
END SUB

SUB AnotherSub()
    ' Define a local variable within AnotherSub
    DIM anotherLocalVariable AS INTEGER
    anotherLocalVariable = 30

    PRINT ""
    PRINT "Inside AnotherSub:"
    PRINT "Another Local Variable: "; anotherLocalVariable
    PRINT "Module Level Variable: "; moduleLevelVariable ' Accessing the module-level variable
    ' PRINT "Local Variable: "; localVariable ' This would cause an error as localVariable is not visible here
END SUB

' Main program
MySub

PRINT ""
PRINT "Back in main program scope:"
PRINT "Module Level Variable: "; moduleLevelVariable ' Accessing the module-level variable

SLEEP
'' ```

'**Explanation of Variable Levels in FreeBASIC:**
'
'FreeBASIC, like many programming languages, uses different "levels" or "scopes" for variables, which determine where and when a variable can be accessed.
'
'1.  **Module-Level (Global) Variables:**
'    *   Declared using `DIM shared` outside of any `SUB` or `FUNCTION`.
'    *   These variables are accessible from anywhere within the same module (file).
'    *   Their lifetime is for the entire duration of the program.
'    *   In the example, `moduleLevelVariable` is a module-level variable. Both `MySub` and `AnotherSub` can access and modify it.
'
'2.  **Local Variables:**
'    *   Declared using `DIM` inside a `SUB` or `FUNCTION`.
'    *   These variables are only accessible within the specific `SUB` or `FUNCTION` where they are declared.
'    *   Their lifetime is limited to the execution of that `SUB` or `FUNCTION`. Once the sub/function exits, the local variables are destroyed.
'    *   In the example:
'        *   `localVariable` is local to `MySub`.
'        *   `anotherLocalVariable` is local to `AnotherSub`.
'    *   You'll notice that `AnotherSub` cannot access `localVariable` and vice-versa, because they are in different scopes.
'
'**How the Code Demonstrates This:**
'
'*   `moduleLevelVariable` is declared at the top, making it accessible to both `MySub` and `AnotherSub`. You can see its value being set in `MySub` and then printed in both `MySub`, `AnotherSub`, and after `MySub` has finished executing in the main program flow.
'*   `localVariable` is declared inside `MySub` and can only be used there.
'*   `anotherLocalVariable` is declared inside `AnotherSub` and can only be used there.
'*   The commented-out line `PRINT "Local Variable: "; localVariable` inside `AnotherSub` would cause a compile-time error if uncommented, explicitly showing that local variables are not visible outside their scope.
'
'Understanding variable scope is crucial for writing organized and bug-free code, as it helps prevent unintended modifications of variables in different parts of your program.

'' Sorry, I can't generate images that are directly based on copyrighted or trademarked material, like specific programming languages or software interfaces, as that could infringe on intellectual property rights. Would you like me to create an image related to programming concepts in general, or something else entirely?

'While FreeBASIC can interact with hardware, directly "opening" a port in the sense of a network port (like TCP/IP) for general internet communication is not a built-in feature of the language itself.
'
'For network communication in FreeBASIC, you would typically need to use external libraries or the Windows API (if on Windows) to handle the socket programming.
'
'However, if you're talking about **serial ports** (like COM ports), FreeBASIC can interact with these using its file I/O functions, as serial ports are often treated like files by the operating system.
'
'Could you clarify what kind of "port" you're looking to open?
'*   **Network Port (TCP/IP, UDP)?** For internet communication.
'*   **Serial Port (COM Port)?** For communicating with devices like microcontrollers.
'*   **Parallel Port?** Less common now, but used for older printers and some custom hardware.
'
'Once I know what you're trying to achieve, I can give you more specific guidance!

'' Can you please provide more context on what you mean by "freebasic check contents"? Are you referring to checking the contents of a variable, a file, or something else within the FreeBASIC programming language?

'' I'm not familiar with a "check property" in FreeBASIC. It's possible you might be thinking of a different programming language, or perhaps a different concept within FreeBASIC that you're recalling by a different name.

'Could you provide more context or clarify what you're trying to achieve? For example:
'
'*   **What are you trying to "check"?** Are you referring to a specific attribute of an object, a variable's state, or something else entirely?
'*   **Where did you encounter the term "check property"?** (e.g., a tutorial, a different language's documentation).
'*   **What is the desired outcome?** What do you want to happen after you "check" this property?
'
'Once I have a better understanding of what you're looking for, I can provide a more accurate answer.
'
'In general, FreeBASIC, like many other programming languages, allows you to:
'
'*   **Access members of user-defined types (UDTs) or classes:** You can access the individual variables (often called "members" or "fields") within a UDT or class instance using the `.` operator (e.g., `myObject.myMember`).
'*   **Use conditional statements:** You can check the value of a variable or the result of an expression using `IF...THEN...ELSE` or `SELECT CASE` statements.
'*   **Use functions to return status:** You might write a function that "checks" a condition and returns a `TRUE` (or -1) or `FALSE` (or 0) value.
'
'' For example, if you had a UDT like this:

' ```freebasic
TYPE MyObject
    IsActive AS INTEGER
    Name AS STRING
END TYPE

DIM myInstance AS MyObject
myInstance.IsActive = TRUE
myInstance.Name = "Test Object"

' To "check" the IsActive property:
IF myInstance.IsActive THEN
    PRINT "Object is active!"
ELSE
    PRINT "Object is inactive."
END IF
' ```
'
'Perhaps you could give an example of what you're trying to do, and I can show you how to accomplish it in FreeBASIC.


'What exactly would you like to know about FreeBASIC development files? Are you looking for:
'
'1.  **Where to download FreeBASIC:** The compiler and its associated development files (headers, libraries).
'2.  **How to structure your FreeBASIC project:** Information on organizing your source code, modules, and includes.
'3.  **Specific types of development files:** Like `.bi` (include files), `.lib` or `.a` (library files), `.bas` (source files).
'4.  **How to create or use your own libraries in FreeBASIC?**
'
'Once I understand what you're looking for, I can provide a more specific and helpful answer! 


'In FreeBASIC, understanding scope is crucial for managing variables and procedures effectively within your code. Let's break down how it works, including the use of include files.
'
'### Understanding Scope in FreeBASIC
'
'Scope refers to the region of your program where a declared name (like a variable or function) is valid and can be accessed. FreeBASIC primarily has three levels of scope:
'
'1.  **Module Scope (Global Scope):**
'    *   Variables and procedures declared directly within a `.bas` file, but outside of any specific function or sub, have module scope.
'    *   They are accessible from anywhere within that specific module.
'    *   By default, module-scope entities are `PUBLIC`, meaning other modules can potentially access them if properly `DECLARE`d. You can explicitly make them `PRIVATE` to restrict access to only their own module.
'
''    *Example:*
''    ```freebasic
    ' Module Scope Variable
    Dim Shared globalVar As Integer = 10

    Declare Sub MySubCode() ' Forward declaration for a sub

    Sub MySubCodeFiles()
        Print "Inside MySub, globalVar is: "; globalVar
    End Sub

    ' Main part of the module
    Print "In main module, globalVar is: "; globalVar
    MySub
''    ```
    

'2.  **Procedure Scope (Local Scope):**
'    *   Variables declared inside a `Function` or `Sub` have procedure scope.
'    *   They are only accessible within that specific function or sub.
'    *   Once the procedure exits, these variables are typically destroyed (unless declared `STATIC`).
'
'    *Example:*
''    ```freebasic
    Sub AnotherSubCode()
        Dim localVar As String = "Hello from local" ' Procedure scope variable
        Print localVar
    End Sub

    ' Print localVar here would cause an error
    ' Print localVar
    AnotherSub
''    ```
    

'3.  **Block Scope (Less common but exists):**
'    *   While not as prominent as in languages like C++, FreeBASIC can have block-like scopes within loops or `If...Then` blocks, especially with `Dim` statements *inside* those blocks. However, for most practical purposes, variables declared within procedures are considered local to the entire procedure.
'
'### Include Files (`#Include`)
'
'`#Include` is a preprocessor directive that essentially copies the content of the specified file directly into your source code at the point where the `#Include` statement appears, *before* compilation. This has significant implications for scope:

'*   **Treat as one file:** When you include a file, think of it as if all the code from the included file was physically pasted into your main `.bas` file.
'*   **Scope Inheritance:** Any declarations in an included file will take on the scope of the location where the `#Include` directive is placed.
'    *   If `#Include` is at module level in your main `.bas` file, declarations from the included file will have module scope.
'    *   If `#Include` is inside a `Sub` or `Function`, declarations from the included file would theoretically have procedure scope (though this is less common and often not recommended for declaring variables directly).

'#### Common Uses for `#Include` Files:
'
'1.  **Constants and Type Definitions:**
'    *   Define frequently used constants (`Const`) or custom data types (`Type`) in an `.bi` (include) file.
'    *   Include this `.bi` file in any module that needs those definitions.

''    *Example (`constants.bi`):*
''    ```freebasic
    ' constants.bi
    Const PI As Double = 3.1415926535
    Const MAX_USERS As Integer = 100
''    ```
''    *Example (`main.bas`):*
''    ```freebasic
    ' main.bas
    #Include "math/constants.bi"

    Dim radius As Double = 5.0
    Dim circumference As Double = 2 * PI * radius
    Print "Circumference: "; circumference

    Dim users(MAX_USERS - 1) As String
    Print "Array can hold "; UBound(users) + 1; " users."
'    ```
'    
'
'2.  **External Procedure Declarations (Headers):**
'    *   When linking against external libraries (like Windows API, custom DLLs), you'll often have `.bi` files that contain `DECLARE` statements for the functions and subs in those libraries. This tells the FreeBASIC compiler about the existence and signature of these external routines.

''    *Example (`my_library.bi`):*
''    ```freebasic
    ' my_library.bi
    ' Assuming these subs are defined in a separate .bas file or a compiled library
    Declare Sub GreetUser(ByVal name As String)
    Declare Function AddNumbers(ByVal a As Integer, ByVal b As Integer) As Integer
''    ```
''    *Example (`main.bas`):*
''    ```freebasic
    ' main.bas
    #Include "mylibrary.bi"

    ' ... later in main.bas or another module ...
    GreetUser("Alice")
    Dim resultCheck As Integer
    Print "5 + 7 = "; result
'    ```
'    
'
'3.  **Sharing Code Between Modules:**
'    *   If you have functions or subs that you want to be available in multiple `.bas` files without copying and pasting, you can put their definitions in an `.bas` or `.bi` file and include it.
'    *   However, for more complex multi-module projects, it's often better to compile modules separately and link them, rather than relying heavily on including full `.bas` files.
'
'#### Example of Module and Include File Interaction:

'' Let's create a simple project with two files: `math_functions.bi` and `main.bas`.

'' **File: `math_functions.bi`**
'' ```freebasic
' math_functions.bi - Contains declarations and definitions for math operations
' This is included at module level in main.bas, so its contents will have module scope there.

' Function to calculate the square of a number
Function Square(ByVal num As Double) As Double
    Return num * num
End Function

' Function to calculate the cube of a number
Function Cube(ByVal num As Double) As Double
    Return num * num * num
End Function

' A constant
Const Epsilon As Double = 0.000001
'' ```

'' **File: `main.bas`**
'' ```freebasic
' main.bas - Main program file

' Include our math functions and constants.
' These will effectively be part of main.bas's module scope.
#Include "math/functions.bi"

' A module-scope variable specific to main.bas
Dim Shared programName As String

Sub ShowCalculation(ByVal value As Double)
    ' This sub has its own procedure scope
    Dim localMessage As String = "Calculations for: " & value

    Print localMessage
    Print "  Square: "; Square(value) ' Calls function from math_functions.bi
    Print "  Cube: "; Cube(value)     ' Calls function from math_functions.bi
    Print "  Epsilon used: "; Epsilon ' Uses constant from math_functions.bi
    Print
End Sub

' Main entry point of the program
Print "--- "; programName; " ---"
Print

ShowCalculation(4)
ShowCalculation(7.5)

' We can also call Square/Cube directly here because they are in module scope
Dim resultSquare10 As Double = Square(10)
Print "Square of 10: "; resultSquare10

' Trying to access localMessage here would be an error
' Print localMessage

End
' ```
'
'When you compile `main.bas`, the FreeBASIC preprocessor first inserts the content of `math_functions.bi` into `main.bas`. The compiler then sees a single, combined source file, where `Square`, `Cube`, and `Epsilon` are all available at the module level, and `programName` is also at the module level. `localMessage` remains confined to `ShowCalculation`.
'
'This setup allows you to organize your code into logical units and reuse common declarations or functions across different parts of your project.
'
'If you'd like an image demonstrating the conceptual flow of `#Include`, just let me know!