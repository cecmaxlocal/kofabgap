'' -*- coding: freebsic -*-

'' Can you clarify what "jinjure" means in this context? If you're looking to create an image, please describe what you'd like to see.

'Can you please clarify what you mean by "clear files"? Are you trying to:
'
'1.  **Delete files?**
'2.  **Empty the contents of files?**
'3.  **Close files that are currently open in FreeBASIC?**
'4.  **Something else entirely?**
'
'Once I understand your intent, I can provide you with the correct FreeBASIC code and explanation.

'' In FreeBASIC, you can create and delete files using simple commands.

'' **Creating a File:**

'' To create a file, you typically open it in a mode that allows writing. If the file doesn't exist, FreeBASIC will create it. If it does exist, it will usually be truncated (emptied) if opened in `OUTPUT` mode, or appended to if opened in `APPEND` mode.

'' Here's an example of creating a text file and writing some content to it:

'' ```freebasic
' Open a file named "mydata.txt" for output (creates if it doesn't exist, overwrites if it does)
OPEN "mydata.txt" FOR OUTPUT AS #1

' Write some lines to the file
PRINT #1, "This is the first line."
PRINT #1, "This is the second line."
PRINT #1, "And this is the last line."

' Close the file
CLOSE #1

PRINT "File 'mydata.txt' created and written to."
'' ```

'' **Deleting a File:**

'' To delete a file, you use the `KILL` command.

'' ```freebasic
' Attempt to delete the file "mydata.txt"
KILL "mydata.txt"

PRINT "File 'mydata.txt' deleted (if it existed)."
'' ```

'' **Putting It Together (with error handling):**

'' It's good practice to include error handling when dealing with file operations, as files might not exist or you might not have the necessary permissions.

'' ```freebasic
' --- Creating a file ---

DIM AS INTEGER fileNumber = FREEFILE ' Get an unused file number

' Open a file named "example.txt" for output
' If the file doesn't exist, it will be created.
' If it exists, its content will be cleared.
OPEN "example.txt" FOR OUTPUT AS #fileNumber

IF ERR THEN
    PRINT "Error creating file: "; ERR
ELSE
    PRINT "File 'example.txt' created successfully."

    ' Write some data to the file
    PRINT #fileNumber, "Hello from FreeBASIC!"
    PRINT #fileNumber, "This is a test file."

    CLOSE #fileNumber ' Close the file
END IF

' --- Deleting a file ---

' Check if the file exists before attempting to delete (optional but good practice)
IF fileNumber = 0 THEN
    ' Delete the file
    KILL "example.txt"

    IF ERR THEN
        PRINT "Error deleting file: "; ERR
    ELSE
        PRINT "File 'example.txt' deleted successfully."
    END IF
ELSE
    PRINT "File 'example.txt' does not exist, so cannot be deleted."
END IF

' Helper function to check if a file exists (requires -lang fb or -lang qb)
FUNCTION FQ_ISFILE(filename AS STRING) AS BOOLEAN
    DIM AS INTEGER f
    OPEN filename FOR INPUT AS #1
    IF ERR = 0 THEN
        CLOSE #1
        RETURN TRUE
    ELSE
        RETURN FALSE
    END IF
END FUNCTION
' ```
'
'**Explanation of Key Commands:**
'
'*   `OPEN filename FOR mode AS #fileNumber`: This command opens a file.
'    *   `filename`: The name of the file (e.g., "mydata.txt").
'    *   `mode`: Specifies how the file will be used:
'        *   `OUTPUT`: Creates a new file or overwrites an existing one.
'        *   `INPUT`: Opens an existing file for reading.
'        *   `APPEND`: Opens an existing file for writing at the end, or creates a new file.
'        *   `RANDOM`: Opens a file for random access (more advanced).
'        *   `BINARY`: Opens a file for binary access (more advanced).
'    *   `#fileNumber`: A unique number (1-255) that identifies the opened file in your program. `FREEFILE` is useful to get the next available file number.
'*   `PRINT #fileNumber, data`: Writes `data` to the file associated with `fileNumber`.
'*   `CLOSE #fileNumber`: Closes the file associated with `fileNumber`. It's crucial to close files after you're done with them to ensure data is saved and resources are released.
'*   `KILL filename`: Deletes the specified file.
'*   `ERR`: A system variable that holds the error code of the last file operation. `0` means no error.
'*   `FQ_ISFILE`: A user-defined function (like the one shown above) or a similar method is often used to check for file existence before attempting operations that might fail if the file isn't there. (FreeBASIC doesn't have a built-in `FILEEXISTS` function like some other languages, so you often implement your own using `OPEN ... FOR INPUT` and checking `ERR`).
'
'Remember to compile and run your FreeBASIC code to see these operations in action!

'What exactly do you mean by "empty content files" in the context of FreeBASIC? Are you looking for:
'
'1.  **Empty source code files:** Just a `.bas` file with no code in it?
'2.  **Empty data files:** Files that your FreeBASIC program can create or read, but which contain no data?
'3.  **A program that creates empty files?**
'
'Could you please clarify your request?

'' FreeBASIC source files typically have a `.bas` extension. Do you want to know more about the FreeBASIC language, or are you looking for some example source files?

'' I am sorry, I cannot generate an image without a specific request. If you can describe what you would like to see, I will do my best to create it for you.

'' FreeBASIC is a powerful, open-source compiler for the BASIC programming language. It's often used for creating games, utilities, and even system-level programming.

'To create program files in FreeBASIC, you'll generally follow these steps:
'
'1.  **Write your source code:** This is the human-readable set of instructions that tells your program what to do. You'll typically save this with a `.bas` extension.
'
'    Here's a simple "Hello, World!" example:
'
'    ```freebasic
    ' hello.bas
    PRINT "Hello, World!"
    SLEEP
    END
'    ```
'
'    *   `PRINT "Hello, World!"` displays the text on the console.
'    *   `SLEEP` pauses the program until a key is pressed, so you can see the output.
'    *   `END` terminates the program.
'
'2.  **Compile your source code:** You use the FreeBASIC compiler (`fbc`) to convert your `.bas` file into an executable program (like `.exe` on Windows).
'
'    If you have FreeBASIC installed and in your system's PATH, you'd open a command prompt or terminal and type:
'
'    ```bash
'    fbc hello.bas
'    ```
'
'    This command will create an executable file named `hello.exe` (on Windows) or `hello` (on Linux/macOS) in the same directory as your source file.
'
'3.  **Run your program:** Once compiled, you can run the executable directly.
'
'    From the command prompt:
'
'    ```bash
'    hello
'    ```
'
'    Or simply double-click the executable file in your file explorer.
'
'Here's a visual representation of this process:
'
'
'
'

' **More Complex Programs:**
'
'As your programs get more complex, you might:
'
'*   **Use multiple `.bas` files:** You can organize your code into different modules. The compiler can link them together.
'*   **Include external libraries:** FreeBASIC can interact with C libraries, allowing you to use a vast array of existing functionalities.
'*   **Create GUI applications:** While FreeBASIC is console-friendly, it can also be used with libraries like GTK, GDK, or even custom wrappers for Windows API to create graphical user interfaces.
'*   **Work with graphics:** FreeBASIC has built-in capabilities for 2D graphics, making it popular for game development.
'
'Do you have a specific type of program in mind that you'd like to create?
'   
'Loop


'' To create multiple files in FreeBASIC, you'll typically use the `OPEN` statement to specify the filename and the mode in which you want to open it (e.g., for output, input, or append). Here's a basic example of how to create and write to two different files:

'' ```freebasic
' --- File 1: MyFirstFile.txt ---
OPEN "MyFirstFile.txt" FOR OUTPUT AS #1
PRINT #1, "This is the content for the first file."
PRINT #1, "It contains multiple lines."
CLOSE #1

' --- File 2: AnotherFile.txt ---
OPEN "AnotherFile.txt" FOR OUTPUT AS #2
PRINT #2, "Hello from the second file!"
PRINT #2, "More text for the second file."
CLOSE #2

PRINT "Two files have been created and written to."
END
'' ```

'**Explanation:**
'
'1.  **`OPEN "Filename.txt" FOR OUTPUT AS #FileNumber`**:
'    *   `"Filename.txt"`: This is the name of the file you want to create. If it doesn't exist, FreeBASIC will create it. If it does exist, `FOR OUTPUT` will overwrite its contents.
'    *   `FOR OUTPUT`: This mode indicates that you intend to write data to the file.
'    *   `AS #FileNumber`: This assigns a unique number (e.g., `#1`, `#2`) to the opened file. You'll use this number to refer to the file in subsequent operations.
'
'2.  **`PRINT #FileNumber, "Your content"`**:
'    *   This statement writes the specified string (or variable) to the file associated with `#FileNumber`. Each `PRINT #` statement typically writes a new line to the file.
'
'3.  **`CLOSE #FileNumber`**:
'    *   It's crucial to `CLOSE` a file after you're done with it. This flushes any buffered data to the disk and releases the file handle. Failing to close files can lead to data loss or file corruption.
'
'**How to extend this:**

''*   **Different Modes:**
'    *   `FOR INPUT`: To read from an existing file.
'    *   `FOR APPEND`: To add content to the end of an existing file without overwriting it.
'    *   `FOR BINARY`: For low-level binary data operations.

'' *   **Looping to Create Many Files:** If you need to create many files with a similar naming convention, you can use a loop:

 ''   ```freebasic
    DIM iNewFiles AS INTEGER
    FOR i = 1 TO 5
        DIM filenameTabs AS STRING
        filename = "File" & STR(i) & ".txt"
        OPEN filename FOR OUTPUT AS #1
        PRINT #1, "This is content for " & filename
        CLOSE #1
    NEXT i
    PRINT "Five files created."
    END
''    ```

'' *   **Error Handling:** In real-world applications, you should always include error handling to check if a file was opened successfully.

''    ```freebasic
    OPEN "NonExistentFolder/MyFile.txt" FOR OUTPUT AS #1
    IF ERR THEN
        PRINT "Error opening file: "; ERR
        PRINT "Error description: "; ERR
    ELSE
        PRINT #1, "Content."
        CLOSE #1
    END IF
'    ```
'
'This structure gives you the fundamental tools to manage multiple files in your FreeBASIC programs.

'In FreeBASIC, you can include external libraries, often in the form of `.lib` (static) or `.dll` (dynamic) files on Windows, or `.a` (static) and `.so` (dynamic) files on Linux. Here's a breakdown of how to do it:
'
'### 1. Understanding Library Types
'
'*   **Static Libraries (.lib or .a):** The code from the library is directly embedded into your executable during compilation. This makes your executable self-contained but larger.
'*   **Dynamic Libraries (.dll or .so):** The code from the library is loaded at runtime. This keeps your executable smaller, but the `.dll` or `.so` file must be present alongside your executable when you run it.
'
'### 2. Including Header Files
'
'Before you can use functions from an external library, you usually need to tell FreeBASIC about the functions and data structures provided by that library. This is done using header files.

'' Many libraries come with `.bi` (FreeBASIC include) files. If you're using a C library, you might need to convert the `.h` (C header) file to a `.bi` file, or find a pre-existing FreeBASIC binding.

'' You include a header file using the `#include` directive:

'' ```freebasic
'' #include "mylibrary.bi"
'' ```

'' If the header file is in a different directory, you might need to specify the path:

'' ```freebasic
'' #include "C:\MyLibraries\Headers\mylibrary.bi"
' ```
'
'Or, you can use the `-i` compiler option to add include paths.
'
'### 3. Linking the Library
'
'After including the header, you need to link the actual library file so the compiler knows where to find the implementation of the functions you're calling.
'
'#### a. Linking Static Libraries (.lib or .a)
'
'You can link static libraries using the `#inclib` directive or by passing the library to the `fbc` compiler.
'
'**Using `#inclib` (within your source code):**
'
'This is often the most convenient way.
'
'```freebasic
#include "mylibrary.bi" ' Or whatever the library's header is

' Declare functions from the library if not already in the .bi
' Declare Function MyLibraryFunction CDECL Alias "MyLibraryFunction" (ByVal arg As Integer) As Integer

#inclib "mylibrary" ' Links mylibrary.lib on Windows, libmylibrary.a on Linux
' Note: You typically omit "lib" and the file extension here.
' The compiler adds them based on your OS.

' Your code using library functions
Dim resultFiles As Integer
' result = MyLibraryFunction(10)
'```
'
'**Using the `fbc` compiler (command line):**
'
'```bash
'fbc your_program.bas -l mylibrary
'```
'
'#### b. Linking Dynamic Libraries (.dll or .so)
'
'For dynamic libraries, you don't typically link them directly in the same way you do static libraries during compilation (unless you're creating an "import library" for Windows DLLs, which is a more advanced topic). Instead, you usually declare the functions and ensure the DLL/SO is available at runtime.
'
'**Directly Declaring Functions and Loading at Runtime:**
'
'This method doesn't require a `.lib` file for the DLL, but you must ensure the DLL is in your program's directory or a system-wide path.
'
'```freebasic
' Declare the function from the DLL/SO
' Make sure the function name matches the exported name from the DLL/SO
' Use Alias if the internal name is different from what you want to call it.
' On Windows, names are often not mangled. On Linux, it's usually the direct name.

'#If Def( __FB_WIN32__ ) Then
'    Declare Function GetCurrentProcessId Lib "kernel32.dll" () As DWord
'#ElseIf Def( __FB_LINUX__ ) Then
'    ' For a Linux .so, you might declare a function like:
'    ' Declare Function my_so_function Lib "libmyso.so" (ByVal arg As Integer) As Integer
'#EndIf

'' Use the function
Dim pid As Integer
pid = 0
Print "Current Process ID: " & pid
'```
'
'**Using Import Libraries for DLLs (Windows specific):**
'
'Sometimes, a DLL might come with a corresponding `.lib` file (an "import library"). This `.lib` file is very small and doesn't contain the actual code, but it tells the linker where to find the functions in the DLL at runtime. If you have this, you can link it like a static library:
'
'```freebasic
#include "mylibrary.bi"
#inclib "mylibrary" ' This would link mylibrary.lib (the import library)
' Your code
'```
'
'### Example: Using a Simple C Library
'
'Let's say you have a simple C library named `myclib` with the following files:
'
'**myclib.h:**
'
'```c
'// myclib.h
'#ifndef MYCLIB_H
'#define MYCLIB_H
'
'int add_numbers(int a, int b);
'
'#endif
'```
'
'**myclib.c:**
'
'```c
'// myclib.c
'#include "myclib.h"
'
'int add_numbers(int a, int b) {
'    return a + b;
'}'
'' ```'

'#### Steps to use it in FreeBASIC:
'
'1.  **Compile the C library:**
'    ```bash
'    ' On Linux (to create libmyclib.a)
'    gcc -c myclib.c
'    ar rcs libmyclib.a myclib.o

    ' On Windows (to create myclib.lib) - using MinGW
'    gcc -c myclib.c
'    ar rcs myclib.lib myclib.o
'    ```
'    (Place `myclib.lib` or `libmyclib.a` in the same directory as your FreeBASIC source or in a known library path.)
'
'2.  **Create a FreeBASIC header (.bi) for `myclib.h`:**
'
'    **myclib.bi:**
'
'    ```freebasic
    ' myclib.bi
    ' Declare the function from the C library
    ' CDECL is important for C calling convention
    Declare Function add_numbers CDECL Alias "add_numbers" (ByVal a As Integer, ByVal b As Integer) As Integer
'    ```
'    (Place `myclib.bi` in the same directory as your FreeBASIC source or in a known include path.)
'
'3.  **Write your FreeBASIC program:**
'
'    **main.bas:**
'
'    ```freebasic
    #include "myclib.bi" ' Include our FreeBASIC header

    #inclib "myclib"     ' Link the compiled C library

    Dim num1 As Integer = 10
    Dim num2 As Integer = 20
    Dim sum As Integer

    sum = add_numbers(num1, num2)

    Print "The sum is: " & sum

    Sleep
'    ```
'
'4.  **Compile your FreeBASIC program:**
'    ```bash
'    fbc main.bas
'    ```
'
'    Now, when you run `main.exe` (or `main` on Linux), it will use the `add_numbers` function from your C library.
'
'### Common Issues and Tips:
'
'*   **Calling Convention:** C libraries typically use the `CDECL` calling convention. Always specify `CDECL` in your `Declare Function` statements for C library functions.
'*   **Name Mangling:** C++ libraries often use name mangling. To use them from FreeBASIC, you usually need to declare functions in the C++ code as `extern "C"` to prevent mangling.
'*   **Paths:** If your library files (`.lib`, `.dll`, `.a`, `.so`) or header files (`.bi`) are not in the same directory as your source code, you'll need to specify their paths using compiler options:
'    *   `-i <include_path>` for header files.
'    *   `-L <library_path>` for library files.
'*   **DLL/SO Placement:** For dynamic libraries, make sure the `.dll` (Windows) or `.so` (Linux) file is in the same directory as your executable, or in a system-wide path where the OS can find it.
'*   **Data Types:** Be careful with data type conversions between FreeBASIC and the library's language (e.g., C). `Integer` in FreeBASIC is usually 32-bit, but `int` in C can vary.
'*   **Pointers:** When dealing with pointers, FreeBASIC's `Any Ptr` or specific `Type Ptr` are used.
'
'This should give you a good foundation for including external libraries in your FreeBASIC projects!
End

'' To create a GUI application in FreeBASIC, you typically use a library that handles the graphical elements. One common and relatively straightforward option is to use the **Windows API** directly, or a library that wraps it for easier use, like **FBGUI**.

'' Here's a basic example using the Windows API directly to create a simple window with a button. This will only work on Windows.

'' ```freebasic
#include "windows.bi"

' Window Procedure - this function handles messages sent to our window
Function WindowProc(hWnd As HWND, uMsg As UINT, wParam As WPARAM, lParam As LPARAM) As LRESULT
    Select Case uMsg
        Case WM_DESTROY ' When the window is closed
            PostQuitMessage(0) ' Tell the application to exit
            Return 0
        Case WM_COMMAND ' When a control (like a button) is clicked
            If HIWORD(wParam) = BN_CLICKED Then ' If it's a button click
                Select Case LOWORD(wParam) ' Check the control's ID
                    Case 1001 ' Our button's ID
                        MessageBox(hWnd, "Button was clicked!", "Message", MB_OK Or MB_ICONINFORMATION)
                End Select
            End If
            Return 0
    End Select
    Return DefWindowProc(hWnd, uMsg, wParam, lParam) ' Let Windows handle other messages
End Function

' Main application entry point
Dim Shared hInst As HINSTANCE
Dim Shared hWindow As HWND
Dim Shared hButton As HWND

hInst = GetModuleHandle(NULL)

' 1. Register the Window Class
Dim wc As WNDCLASSEX
wc.cbSize        = SizeOf(WNDCLASSEX)
wc.style         = CS_HREDRAW Or CS_VREDRAW
'' wc.lpfnWndProc   = @WindowProc
wc.cbClsExtra    = 0
wc.cbWndExtra    = 0
wc.hInstance     = hInst
wc.hIcon         = LoadIcon(NULL, IDI_APPLICATION)
wc.hCursor       = LoadCursor(NULL, IDC_ARROW)
wc.hbrBackground = Cast(HBRUSH, COLOR_WINDOW + 1)
wc.lpszMenuName  = NULL
'' wc.lpszClassName = "FreeBasicGUIClass"
wc.hIconSm       = LoadIcon(NULL, IDI_APPLICATION)

If RegisterClassEx(@wc) = 0 Then
    MessageBox(NULL, "Window Registration Failed!", "Error", MB_OK Or MB_ICONERROR)
    End
End If

' 2. Create the Window
hWindow = CreateWindowEx( _
    0, _
    "FreeBasicGUIClass", _
    "FreeBASIC GUI Example", _
    WS_OVERLAPPEDWINDOW, _
    CW_USEDEFAULT, CW_USEDEFAULT, _
    640, 480, _
    NULL, _
    NULL, _
    hInst, _
    NULL _
)

If hWindow = NULL Then
    MessageBox(NULL, "Window Creation Failed!", "Error", MB_OK Or MB_ICONERROR)
    End
End If

' 3. Create a Button
'hButton = CreateWindowEx( _
'    0, _
'    "BUTTON", _
'    "Click Me!", _
'    WS_TABSTOP Or WS_VISIBLE Or WS_CHILD, _
'    250, 200, _
'    120, 30, _
'    hWindow, _
'    Cast(HMENU, 1001), ' Unique ID for our button
'    hInst, _
'    NULL _
')

If hButton = NULL Then
    MessageBox(NULL, "Button Creation Failed!", "Error", MB_OK Or MB_ICONERROR)
    End
End If

' 4. Show the Window
ShowWindow(hWindow, SW_SHOWNORMAL)
UpdateWindow(hWindow)

' 5. Message Loop - processes all events
Dim msg As MSG
While GetMessage(@msg, NULL, 0, 0)
    TranslateMessage(@msg)
    DispatchMessage(@msg)
Wend

' Application exit
End
'```
'
'**How to Compile and Run:**
'
'1.  **Save:** Save the code above as `gui_example.bas`.
'2.  **Compile:** Open a command prompt or terminal and navigate to where you saved the file. Then compile it using FreeBASIC:
'    ```bash
'    fbc gui_example.bas
'    ```
'3.  **Run:** Execute the compiled program:
'    ```bash
'    gui_example.exe
'    ```
'
'You should see a simple window appear with a "Click Me!" button. When you click it, a message box will pop up.
'
'Here's what the application looks like: 

'**Explanation of Key Parts:**
'
'*   **`#include "windows.bi"`**: This line includes the FreeBASIC bindings for the Windows API, giving you access to all the necessary functions and data types.
'*   **`WindowProc` Function**: This is the heart of any Windows GUI application. It's a callback function that the operating system calls whenever an event (like a mouse click, key press, or window resize) occurs for your window.
'    *   `WM_DESTROY`: This message is received when the user tries to close the window. `PostQuitMessage(0)` tells the application's message loop to terminate.
'    *   `WM_COMMAND`: This message is sent when a control (like a button) is activated. We check `BN_CLICKED` (Button Notification Clicked) and the control's ID to identify which button was pressed.
'*   **`WNDCLASSEX` Structure**: Before you can create a window, you need to register a "window class" with the operating system. This structure describes the characteristics of your window (e.g., its icon, cursor, background color, and, most importantly, the `WindowProc` function that will handle its messages).
'*   **`RegisterClassEx`**: Registers the window class.
'*   **`CreateWindowEx`**: Creates the actual window on the screen based on the registered class. You specify its style, title, position, size, parent window (NULL for a top-level window), menu handle (NULL for no menu), and instance handle.
'*   **Creating Controls (e.g., Button)**: You use `CreateWindowEx` again, but this time you specify "BUTTON" as the window class name, and set the parent window to your main window (`hWindow`) and provide a unique ID (e.g., `1001`). The `WS_CHILD` style is crucial for controls.
'*   **`ShowWindow` and `UpdateWindow`**: Make the window visible and ensure it's redrawn.
'*   **Message Loop**: This `While GetMessage(...)` loop continuously retrieves messages from the operating system's message queue for your application.
'    *   `TranslateMessage`: Translates virtual-key messages into character messages.
'    *   `DispatchMessage`: Sends the message to the appropriate window's `WindowProc` function.
'
'**For a more object-oriented and potentially easier approach, consider libraries like FBGUI or GTK/Qt bindings (if available and maintained for FreeBASIC).** However, understanding the basic Windows API method is fundamental to GUI programming on Windows.
'   
'Next

'' Yes, FreeBASIC can work with graphic files! It provides several ways to do so, primarily through its built-in graphics library and by allowing you to interact with external libraries.

'Here's a breakdown of how it generally works:
'
'**1. Built-in Graphics Library:**
'
'FreeBASIC has a fairly robust built-in graphics library that allows you to:
'
'*   **Load Images:** You can load various image formats (like BMP, and often PNG, JPEG, GIF through included extensions or specific libraries) into memory.
'*   **Display Images:** Once loaded, you can display these images on a graphics screen created with FreeBASIC's `SCREEN` command.
'*   **Manipulate Images:** You can draw parts of images, scale them, rotate them (though rotation might be more involved for simple built-in functions), and even get/put individual pixels to create your own image processing effects.
'*   **Save Images:** You can also save the contents of your graphics screen or a loaded image back to a file.
'
'**Example (Conceptual - actual code would be more detailed):**
'
'```freebasic
#include "./fbgfx.bi" ' Include the graphics library

ScreenRes 640, 480, 32 ' Set up a screen resolution

Dim As Integer myImage ' Declare a pointer for the image

Sub ImageLoad(StrImage As String )
         #Include "images/myimages.bi"
End Sub

' Load an image (assuming "myimage.bmp" exists in the same directory)
myImage = 512

If myImage <> 0 Then
   ''  Put (0, 0), myImage ' Display the image at coordinates (0,0)
   '' ImageDestroy myImage ' Free the image memory when done
Else
    Print "Could not load image!"
End If

Sleep ' Keep the window open until a key is pressed
' ```
'
'**2. External Libraries:**
'
'For more advanced features, wider format support, or specific graphics tasks, FreeBASIC can link with external libraries. Popular choices include:
'
'*   **SDL (Simple DirectMedia Layer):** A very popular cross-platform development library designed to provide low-level access to audio, keyboard, mouse, joystick, and graphics hardware via OpenGL and Direct3D. FreeBASIC has excellent bindings for SDL, making it a common choice for games and multimedia applications.
'*   **OpenGL:** For 3D graphics, FreeBASIC can interface with OpenGL, allowing you to create complex 3D scenes.
'*   **Allegro:** Another game programming library that FreeBASIC can use.
'*   **Windows API (for Windows users):** On Windows, you can directly use GDI+ functions for extensive image manipulation, drawing, and format support.
'
'**Using External Libraries (Conceptual):**
'
'When using external libraries, you'd typically include their respective `.bi` (binding interface) files and link against their `.lib` or `.dll` files during compilation.
'
'**In summary:**
'
'FreeBASIC is quite capable when it comes to working with graphic files, especially for 2D graphics. Its built-in functions are great for getting started, and the ability to use powerful external libraries like SDL or OpenGL expands its capabilities immensely.
'
'Would you like to see a simple example of loading and displaying an image using FreeBASIC's built-in functions?
'

''  In FreeBASIC, you can create a form dialog using the `GTK` library, which provides a rich set of widgets for building graphical user interfaces. Here's a simple example of how to create a basic form dialog with a couple of input fields and a button:

'' ```freebasic
#include "gtk/gtk.bi"

' Callback function for the button click
sub on_button_clicked(cptrView as GtkWidget, user_data as gpointer)
    dim as GtkWidget ptr  entry1
    dim as GtkWidget ptr  entry2 

    dim as zstring ptr text1 
    dim as zstring ptr text2

    print "Name: " & *text1
    print "Email: " & *text2
end sub


' Main function
Sub mainScript(argc as long, argv as long) 
    ' Initialize GTK
    '' gtk_init(@argc, @argv)

    ' Create the main window
    dim as GtkWidget ptr  windows = gtk_window_new(GTK_WINDOW_TOPLEVEL)
    gtk_window_set_title(GTK_WINDOW(windows), "FreeBASIC Form Dialog")
    gtk_container_set_border_width(GTK_CONTAINER(windows), 10)
    gtk_window_set_default_size(GTK_WINDOW(windows), 300, 200)

    ' Connect the "destroy" signal to quit the application
    g_signal_connect(G_OBJECT(windows), "destroy", G_CALLBACK(@gtk_main_quit), NULL)

    ' Create a vertical box to arrange widgets
    dim as GtkWidget ptr  vbox
    gtk_container_add(GTK_CONTAINER(windows), vbox)

    ' Create a grid for input fields and labels
    dim as GtkWidget ptr  grid
    '' gtk_grid_set_row_spacing(GTK_GRID(grid), 5)
    '' gtk_grid_set_column_spacing(GTK_GRID(grid), 5)
    '' gtk_box_pack_start(GTK_BOX(vbox), grid, TRUE, TRUE, 0)

    ' Label and Entry for Name
    dim as GtkWidget ptr  label1 = gtk_label_new("Name:")
    '' gtk_grid_attach(GTK_GRID(grid), label1, 0, 0, 1, 1)
    dim as GtkWidget ptr  entry1 = gtk_entry_new()
    '' gtk_grid_attach(GTK_GRID(grid), entry1, 1, 0, 1, 1)

    ' Label and Entry for Email
    dim as GtkWidget ptr  label2 = gtk_label_new("Email:")
    '' gtk_grid_attach(GTK_GRID(grid), label2, 0, 1, 1, 1)
    dim as GtkWidget ptr  entry2 = gtk_entry_new()
    '' gtk_grid_attach(GTK_GRID(grid), entry2, 1, 1, 1, 1)

    ' Create a button
    dim as GtkWidget ptr  button = gtk_button_new_with_label("Submit")
    '' gtk_box_pack_start(GTK_BOX(vbox), button, FALSE, FALSE, 0)

    ' Store entry pointers in an array for the callback
    dim as GtkWidget ptr user_data_array(1)
    user_data_array(0) = entry1
    user_data_array(1) = entry2

    ' Connect the "clicked" signal of the button to the callback function
    '' g_signal_connect(G_OBJECT(button), "clicked", G_CALLBACK(@on_button_clicked), @user_data_array)

    ' Show all widgets
    gtk_widget_show_all(windows)

    ' Start the GTK main loop
    gtk_main()

   '' return 0
end 

'' mainScript(FB_ARGC, FB_ARGV)
' ```
'
'**To compile and run this code:**
'
'1.  **Install GTK Development Libraries:** You'll need the GTK development libraries installed on your system.
'    *   **On Debian/Ubuntu:** `sudo apt-get install libgtk-3-dev`
'    *   **On Fedora:** `sudo dnf install gtk3-devel`
'    *   **On Windows:** You'll typically download a GTK+ development bundle (e.g., from MSYS2 or directly from GTK's website) and configure your FreeBASIC environment to find its headers and libraries.
'
'2.  **Compile with FreeBASIC:** Use the following command in your terminal:
'    ```bash
'    fbc your_program_name.bas -lib "gtk-3" -lib "gdk-3" -lib "gobject-2.0" -lib "glib-2.0"
'    ```
'    (You might need to adjust the library names depending on your GTK installation.)
'
'3.  **Run:**
'    ```bash
'    ./your_program_name
'    ```
'
'This will produce a simple window with "Name" and "Email" input fields, and a "Submit" button. When you click "Submit", the values from the input fields will be printed to the console where you ran the program.
'
'' Here's what the form dialog might look like:
