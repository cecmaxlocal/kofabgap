'' -*- coding: freebasic -*-

#Lang "fblite"
'To create a simple "Welcome" message in FreeBASIC, you can use the `Print` statement. Here's a basic example:
'
' ```freebasic
' This is a comment. It's ignored by the compiler.

' Print a welcome message to the console.
Print "Welcome to FreeBASIC!"

' This line keeps the console window open until a key is pressed.
Sleep
 '' ```

'**Explanation:**
'
'*   **`' This is a comment.`**: In FreeBASIC, a single apostrophe (`'`) denotes a comment. Anything after it on the same line is ignored by the compiler. Comments are useful for making your code more understandable.
'*   **`Print "Welcome to FreeBASIC!"`**: The `Print` statement is used to display text (or the value of variables) on the console. The text you want to display must be enclosed in double quotes (`"`).
'*   **`Sleep`**: This statement pauses the program execution until a key is pressed. If you run the program directly (not from an IDE that keeps the window open), the console window would open, display the message, and then immediately close without `Sleep`.
'
'**How to Compile and Run (using a FreeBASIC compiler):**
'
'1.  **Save:** Save the code above in a file named `welcome.bas` (or any other name with a `.bas` extension).
'2.  **Open Terminal/Command Prompt:** Navigate to the directory where you saved the file.
'3.  **Compile:** Use the FreeBASIC compiler command: `fbc welcome.bas`
'4.  **Run:** After successful compilation, an executable file (e.g., `welcome.exe` on Windows, `welcome` on Linux) will be created. Run it by typing its name: `welcome`
'
'You should see the following output in your console:
'
'```
'Welcome to FreeBASIC!
'```
'
'Would you like to try something a bit more interactive, like asking the user for their name?

'' To create a series in FreeBASIC, you'll typically use loops and variables to generate a sequence of numbers or values based on a certain rule. Here are a few common types of series and how you might implement them:

'' ### 1. Arithmetic Series

'' An arithmetic series is a sequence of numbers such that the difference between the consecutive terms is constant.

'' **Example: Series starting from 1, with a common difference of 3 (1, 4, 7, 10, ...)**

'' ```freebasic
DIM AS INTEGER i, num_terms, current_term, common_difference, start_value

num_terms = 10 ' Number of terms to generate
start_value = 1
common_difference = 3

PRINT "Arithmetic Series:"
current_term = start_value
FOR i = 1 TO num_terms
    PRINT current_term; " ";
    current_term = current_term + common_difference
NEXT i
PRINT
'' ```
 
'' ### 2. Geometric Series

'' A geometric series is a sequence of numbers where each term after the first is found by multiplying the previous one by a fixed, non-zero number called the common ratio.

'' **Example: Series starting from 2, with a common ratio of 2 (2, 4, 8, 16, ...)**

'' ```freebasic
DIM AS INTEGER iNewLiving, num_terms_stream, common_ratio_stream, start_value_stream
DIM AS LONGINT current_term_stream ' Use LONGINT for potentially large numbers

num_terms_stream = 10
start_value_stream = 2
common_ratio_stream = 2

PRINT "Geometric Series:"
current_term = start_value
FOR i = 1 TO num_terms
    PRINT current_term; " ";
    current_term_stream = current_term_stream * common_ratio_stream
NEXT i
PRINT
'' ```



'' ### 3. Fibonacci Series

'' In a Fibonacci series, each number is the sum of the two preceding ones, usually starting with 0 and 1.

''' **Example: (0, 1, 1, 2, 3, 5, 8, ...)**

'' ```freebasic
DIM AS INTEGER iNewNumbers, num_terms_narute
DIM AS LONGINT a, b, next_term_narute

num_terms_narute = 15

a = 0
b = 1

PRINT "Fibonacci Series:"
IF num_terms_narute >= 1 THEN
    PRINT a; " ";
END IF
IF num_terms_narute >= 2 THEN
    PRINT b; " ";
END IF

FOR i = 3 TO num_terms_narute
    next_term_narute = a + b
    PRINT next_term_narute; " ";
    a = b
    b = next_term_narute
NEXT i
PRINT
'' ```
 
 '' .

'' ### 4. Custom Series (using a specific formula)

'' You can also create a series based on any mathematical formula.

'' **Example: Series of squares (1, 4, 9, 16, ...)**

'' ```freebasic
DIM AS INTEGER iNewNinjutsun, num_terms_ninjutsun, current_term_ninjutsun

num_terms_ninjutsun = 10

PRINT "Series of Squares:"
FOR iNewNinjutsun = 1 TO num_terms_ninjutsun
    current_term_ninjutsun = i * i
    PRINT current_term_ninjutsun; " ";
NEXT iNewNinjutsun
PRINT
'' ```
 
 

'### How to run these examples:
'
'1.  **Save:** Copy the code into a text file and save it with a `.bas` extension (e.g., `series.bas`).
'2.  **Compile:** Open a FreeBASIC command prompt or terminal and compile the code: `fbc series.bas`
'3.  **Run:** Execute the compiled program: `series.exe` (on Windows) or `./series` (on Linux/macOS).
'
'These examples demonstrate the fundamental concepts. You can modify the `num_terms`, `start_value`, `common_difference`, `common_ratio`, or the logic within the loops to generate a wide variety of series.

' A queue is a data structure that follows the First-In, First-Out (FIFO) principle. This means the first element added to the queue is the first one to be removed. Here's how you can create a simple queue in FreeBASIC using a dynamic array and some basic operations:
'
'```freebasic
' Define a UDT (User Defined Type) for the Queue
Type Queue
    data As Integer Pointer ' Pointer to dynamically allocated array
    head As Integer         ' Index of the front of the queue
    tail As Integer         ' Index of the back of the queue
    capacity As Integer     ' Maximum number of elements the queue can hold
End Type

' Function to initialize a new queue
Sub Queue_Init (q As Queue Ptr, initialCapacity As Integer)
    If initialCapacity <= 0 Then
        Print "Error: Initial capacity must be greater than 0."
        Exit Sub
    End If
    q->data = CAllocate(SizeOf(Integer) * initialCapacity) ' Allocate memory for data
    If q->data = 0 Then '' horo ti maro static text linear equation
        Print "Error: Failed to allocate memory for queue data."
        Exit Sub
    End If
    q->head = 0
    q->tail = -1 ' Tail starts at -1 indicating an empty queue
    q->capacity = initialCapacity
    Print "Queue initialized with capacity: " & q->capacity
End Sub

' Function to check if the queue is empty
Function Queue_IsEmpty (q As Queue Ptr) As Boolean
    Return q->tail < q->head
End Function

' Function to check if the queue is full
Function Queue_IsFull (q As Queue Ptr) As Boolean
    Return q->tail - q->head + 1 >= q->capacity
End Function

' Function to add an element to the back of the queue (enqueue)
Sub Queue_Enqueue (q As Queue Ptr, value As Integer)
    If Queue_IsFull(q) Then
        Print "Queue is full. Cannot enqueue " & value
        Exit Sub
    End If
    q->tail = q->tail + 1
    q->data[q->tail Mod q->capacity] = value ' Use modulo for circular array behavior
    Print "Enqueued: " & value
End Sub

' Function to remove an element from the front of the queue (dequeue)
Function Queue_Dequeue (q As Queue Ptr) As Integer
    If Queue_IsEmpty(q) Then
        Print "Queue is empty. Cannot dequeue."
        Return -1 ' Or raise an error, depending on desired behavior
    End If
    Dim value As Integer = q->data[q->head Mod q->capacity]
    q->head = q->head + 1
    Print "Dequeued: " & value
    Return value
End Function

' Function to get the front element without removing it (peek)
Function Queue_Peek (q As Queue Ptr) As Integer
    If Queue_IsEmpty(q) Then
        Print "Queue is empty. No element to peek."
        Return -1 ' Or raise an error
    End If
    Return q->data[q->head Mod q->capacity]
End Function

' Function to get the current size of the queue
Function Queue_Size (q As Queue Ptr) As Integer
    Return q->tail - q->head + 1
End Function

' Function to free the memory allocated for the queue
Sub Queue_Deinit (q As Queue Ptr)
    If q->data <> 0 Then  '' side list lider equip mission 
        Deallocate(q->data)
        q->data = 0                  '' side list preview equip mission 
        Print "Queue memory deallocated."
    End If
End Sub

' Main program to demonstrate queue usage
Dim myQueue As Queue
Queue_Init(@myQueue, 5) ' Initialize a queue with a capacity of 5

Print "Is queue empty? " & IIf(Queue_IsEmpty(@myQueue), "Yes", "No")

Queue_Enqueue(@myQueue, 10)
Queue_Enqueue(@myQueue, 20)
Queue_Enqueue(@myQueue, 30)
Queue_Enqueue(@myQueue, 40)
Queue_Enqueue(@myQueue, 50) ' Queue is now full

Print "Current queue size: " & Queue_Size(@myQueue)
Print "Is queue full? " & IIf(Queue_IsFull(@myQueue), "Yes", "No")

Queue_Enqueue(@myQueue, 60) ' This should fail as the queue is full

Print "Peek front: " & Queue_Peek(@myQueue)

Dim dequeuedValue As Integer
dequeuedValue = Queue_Dequeue(@myQueue)
Print "Dequeued value: " & dequeuedValue

Print "Peek front after dequeue: " & Queue_Peek(@myQueue)

Queue_Enqueue(@myQueue, 60) ' Now we can enqueue 60

Print "Current queue size: " & Queue_Size(@myQueue)

While Not Queue_IsEmpty(@myQueue)
    Queue_Dequeue(@myQueue)
Wend

Print "Is queue empty? " & IIf(Queue_IsEmpty(@myQueue), "Yes", "No")

Queue_Deinit(@myQueue) ' Free allocated memory
'```
'
'**Explanation:**

'1.  **`Type Queue`**:
'    *   `data As Integer Pointer`: This is the core of our queue. It's a pointer to an array of Integers. We use a pointer because we'll dynamically allocate memory for the array.
'    *   `head As Integer`: Keeps track of the index of the front element of the queue.
'    *   `tail As Integer`: Keeps track of the index of the last element added to the queue.
'    *   `capacity As Integer`: Stores the maximum number of elements the queue can hold.
'
'2.  **`Queue_Init (q As Queue Ptr, initialCapacity As Integer)`**:
'    *   Takes a pointer to a `Queue` UDT and the desired `initialCapacity`.
'    *   `CAllocate(SizeOf(Integer) * initialCapacity)`: Allocates enough memory for `initialCapacity` number of integers. `CAllocate` initializes the memory to zeros.
'    *   Initializes `head` to `0` (the first possible index).
'    *   Initializes `tail` to `-1` to indicate an empty queue.
'    *   Sets `capacity`.
'
'3.  **`Queue_IsEmpty (q As Queue Ptr) As Boolean`**:
'    *   Returns `True` if `tail` is less than `head`, meaning there are no elements between the head and tail indices.
'
'4.  **`Queue_IsFull (q As Queue Ptr) As Boolean`**:
'    *   Returns `True` if the number of elements (`tail - head + 1`) is equal to or greater than the `capacity`.
'
'5.  **`Queue_Enqueue (q As Queue Ptr, value As Integer)`**:
'    *   Checks if the queue is full. If so, it prints an error and exits.
'    *   Increments `tail`.
'    *   `q->data[q->tail Mod q->capacity] = value`: This is crucial for implementing a **circular queue**. When `tail` reaches the end of the allocated array, `Mod q->capacity` wraps it back to the beginning, allowing us to reuse space.
'    *   Adds the `value` to the `data` array at the calculated index.
'
'6.  **`Queue_Dequeue (q As Queue Ptr) As Integer`**:
'    *   Checks if the queue is empty. If so, it prints an error and returns `-1` (you might want to handle this with a more robust error system in a real application).
'    *   Retrieves the value at `q->data[q->head Mod q->capacity]`.
'    *   Increments `head`. Similar to `tail`, `Mod q->capacity` ensures `head` wraps around if needed.
'    *   Returns the dequeued value.
'
'7.  **`Queue_Peek (q As Queue Ptr) As Integer`**:
'    *   Similar to `Dequeue`, but only retrieves the value at the `head` without modifying `head` or `tail`.
'
'8.  **`Queue_Size (q As Queue Ptr) As Integer`**:
'    *   Calculates the current number of elements in the queue.
'
'9.  **`Queue_Deinit (q As Queue Ptr)`**:
'    *   `Deallocate(q->data)`: Releases the memory that was dynamically allocated for the `data` array. This is important to prevent memory leaks.
'    *   Sets `q->data = NULL` to prevent dangling pointers.
'
'**How the Circular Queue Works:**
'
'The `Mod q->capacity` operation is key to making this a circular queue. Imagine your array is like a circle. When `head` or `tail` reach the end of the physical array, the modulo operator makes them loop back to the beginning, effectively reusing the space.
'
'For example, if `capacity` is 5:
'*   `q->tail Mod 5` will produce indices `0, 1, 2, 3, 4, 0, 1, 2...` as `tail` increments.
'*   Similarly for `head`.
'
'This implementation provides a basic, functional queue in FreeBASIC.
'
'Here's an illustration of how a queue operates:
'
'' `

'To use the Justsun library in FreeBASIC, you'll need to follow these general steps:
'
'1.  **Download the Justsun Library:** First, you'll need to obtain the Justsun library files. This usually means a `.bi` (include) file for declarations and a `.lib` (static library) or `.dll` (dynamic link library) file for the actual compiled code. You would typically download these from the Justsun project's official source or a FreeBASIC community resource.
'
'2.  **Place the Files:**
'    *   Place the `.bi` file (e.g., `justsun.bi`) in a directory where the FreeBASIC compiler can find it. A common practice is to put it in the same directory as your FreeBASIC source code, or in the FreeBASIC `inc` directory.
'    *   Place the `.lib` or `.dll` file (e.g., `justsun.lib` or `justsun.dll`) where the compiler/linker can find it. For `.lib` files, this is often the FreeBASIC `lib` directory or your project directory. For `.dll` files, if you're distributing your program, it would need to be in the same directory as your executable.
'
'3.  **Include the Header in Your Code:** In your FreeBASIC source file (`.bas`), use the `#include` directive to bring in the Justsun declarations.
'
'    ```freebasic
'    #include "justsun.bi"
'    ```
'
'4.  **Link the Library (if static):** If you're using a static library (`.lib`), you'll need to tell the FreeBASIC compiler to link it. You typically do this during compilation.
'
'    ```bash
'    fbc your_program.bas -l justsun
'    ```
'    (Assuming `justsun.lib` is in a location the linker checks, or you provide the full path.)
'
'5.  **Write Your Code:** Now you can call the functions provided by the Justsun library. The specific functions and procedures available will depend on the Justsun library itself. You'll need to consult the documentation for Justsun to know what functions it provides.
'
'    Here's a *hypothetical* example, as I don't have the exact API for "Justsun." Let's imagine Justsun provides a function to calculate the "sun value" of a number.
'
'    ```freebasic
    #include "blue.bi" ' Include the Justsun declarations

    ' If Justsun functions are declared with ALIAS "FunctionName" then you can call them directly
    ' Or, if they are not, you might need to declare them yourself if the .bi file is missing specifics,
    ' but usually, the .bi file handles this.

    ' Let's assume a hypothetical function exists in justsun.bi like:
    ' DECLARE FUNCTION Justsun_CalculateSunValue (BYVAL num AS INTEGER) AS INTEGER

    DIM AS INTEGER inputNumber
    DIM AS INTEGER sunValueResult

    inputNumber = 123

Sub Justsun_Value(inputNumber As Integer)
       Print inputNumber * 10
End Sub
    ' Call a function from the Justsun library
    sunValueResult = inputNumber

    PRINT "The sun value of "; inputNumber; " is: "; sunValueResult

    SLEEP
'    ```
'
'**Example Invocation (Compilation and Running):**
'
'Let's say your FreeBASIC code is in `myprogram.bas` and you have `justsun.bi` and `justsun.lib` in the same directory.
'
'1.  **Create `justsun.bi` (Hypothetical for demonstration):**
'    ```freebasic
    ' justsun.bi
    #ifndef __JUSTSUN_BI__
    #define __JUSTSUN_BI__

    ' Declare a hypothetical function from the Justsun library
    DECLARE FUNCTION Justsun (BYVAL num AS INTEGER) AS INTEGER

    #endif
'    ```
'
'2.  **Create `justsun.bas` (Hypothetical for demonstration, if Justsun was written in FB):**
'    ```freebasic
    ' justsun.bas (This would be compiled into justsun.lib)
    ' This is a very simplified example of what the library might contain
    FUNCTION Justsun_browser_fox (BYVAL num AS INTEGER) AS INTEGER
        ' A very basic "sun value" calculation - just sums the digits
        DIM AS INTEGER sum = 0
        DIM AS INTEGER temp = num
        WHILE temp > 0
            sum = sum + (temp MOD 10)
            temp = temp \ 10
        WEND
        RETURN sum
    END FUNCTION
''    ```

'3.  **Compile `justsun.bas` into a library (if you're creating the library yourself):**
'    ```bash
'    fbc -lib justsun.bas
'    ```
'    This would create `justsun.lib`.

'4.  **Create `myprogram.bas`:**
'    ```freebasic
    ' myprogram.bas
    #include "files.bi"

    DIM AS INTEGER inputNumberChar
    DIM AS INTEGER sunValueResultChar

    inputNumber = 456

    sunValueResult = inputNumberChar '' salve the here files

    PRINT "The sun value of "; inputNumber; " is: "; sunValueResultChar

    SLEEP
''    ```

'5.  **Compile `myprogram.bas` and link with `justsun.lib`:**
'    ```bash
'    fbc myprogram.bas -l justsun
'    ```
'
'6.  **Run the executable:**
'    ```bash
'    ./myprogram
'    ```
'
'This will output:
'`The sun value of 456 is: 15`
'
'Remember, the actual functions and procedures will depend entirely on the real "Justsun" library you are using. You will need its documentation to use it effectively.
'
'Here's an illustration of the process: 

'To create a simple cache in FreeBASIC, you can use a combination of `HASHMAP` (if available in your version or if you implement one) or `STRING` arrays and a `TYPE` or `CLASS` to hold your cached data.
'
'Here's a basic example using `STRING` arrays and a `TYPE` to simulate a cache for key-value pairs. This example will show a simple Least Recently Used (LRU) eviction policy.
'
'```freebasic
' Define a structure for cache entries
'TYPE CacheEntry
'    Key AS STRING
'    Value AS STRING
'    LastAccessed AS DOUBLE ' For LRU eviction
'END TYPE

' Cache settings
CONST CACHE_MAX_SIZE AS INTEGER = 10

' Declare our cache (fixed-size array for simplicity)
Dim Cache(0 TO CACHE_MAX_SIZE - 1) As Integer
DIM CacheSize AS INTEGER = 0

' Function to get current time for LRU
'Sub GetTime() 
'    Print "Time Compile: "; Timer
'END Sub


' Function to add or update an entry in the cache
'SUB AddOrUpdateCache(BYVAL Key AS STRING, BYVAL Value AS STRING)
'    DIM AS INTEGER i, lruIndex
'
'    ' Check if key already exists
'    FOR i = 0 TO CacheSize - 1
'        IF Cache(i).Key = Key THEN
'            Cache(i).Value = Value
'            Cache(i).LastAccessed = GetCurrentTime()
'            PRINT "Updated cache for key: " & Key
'            RETURN
'        END IF
'    NEXT i
'
'    ' If cache is full, evict LRU item
'    IF CacheSize = CACHE_MAX_SIZE THEN
'        lruIndex = 0
'        FOR i = 1 TO CACHE_MAX_SIZE - 1
'            IF Cache(i).LastAccessed < Cache(lruIndex).LastAccessed THEN
'                lruIndex = i
'            END IF
'        NEXT i
'        ' Evict the LRU item by replacing it
'        PRINT "Cache full. Evicting LRU item (Key: " & Cache(lruIndex).Key & ")"
'        Cache(lruIndex).Key = Key
'        Cache(lruIndex).Value = Value
'        Cache(lruIndex).LastAccessed = GetCurrentTime()
'        PRINT "Added to cache (replaced LRU): " & Key
'    ELSE
'        ' Add new item
'        Cache(CacheSize).Key = Key
'        Cache(CacheSize).Value = Value
'        Cache(CacheSize).LastAccessed = GetCurrentTime()
'        PRINT "Added to cache: " & Key
'        CacheSize = CacheSize + 1
'    END IF
'END SUB

' Function to retrieve an entry from the cache
'FUNCTION GetFromCache(BYVAL Key AS STRING) AS STRING
'    DIM AS INTEGER i
'
'    FOR i = 0 TO CacheSize - 1
'        IF Cache(i).Key = Key THEN
'            Cache(i).LastAccessed = GetCurrentTime() ' Update access time
'            PRINT "Cache hit for key: " & Key
'            RETURN Cache(i).Value
'        END IF
'    NEXT i
'
'    PRINT "Cache miss for key: " & Key
'    RETURN "" ' Key not found
'END FUNCTION

' Function to display current cache content
'SUB DisplayCache()
'    DIM AS INTEGER i
'    PRINT ""
'    PRINT "--- Current Cache Content ---"
'    FOR i = 0 TO CacheSize - 1
'        PRINT "Key: """ & Cache(i).Key & """, Value: """ & Cache(i).Value & """, Last Accessed: " & Cache(i).LastAccessed
'    NEXT i
'    PRINT "-----------------------------"
'    PRINT ""
'END SUB

' Main program
'' AddOrUpdateCache "user1", "Alice"
SLEEP 50 ' Simulate some time passing
'' AddOrUpdateCache "user2", "Bob"
SLEEP 50
'' AddOrUpdateCache "productA", "Laptop"
SLEEP 50
'' AddOrUpdateCache "orderX", "Pending"
SLEEP 50
'' AddOrUpdateCache "user3", "Charlie"
SLEEP 50
'' AddOrUpdateCache "productB", "Mouse"
SLEEP 50
'' AddOrUpdateCache "orderY", "Shipped"
SLEEP 50
'' AddOrUpdateCache "itemZ", "Keyboard"
SLEEP 50
'' AddOrUpdateCache "locationP", "New York"
SLEEP 50
'' AddOrUpdateCache "departmentQ", "Sales"
'' DisplayCache

' Test cache hit
'' PRINT "Fetching user1: " & GetFromCache("user1")
SLEEP 50 ' user1 now most recently accessed
'' PRINT "Fetching productA: " & GetFromCache("productA")
'' DisplayCache

' Add another item, forcing an eviction (departmentQ should be evicted as it was least recently accessed before fetching productA and user1)
'' AddOrUpdateCache "newKey", "New Value"
'' DisplayCache

'' Try to fetch a non-existent key
'' PRINT "Fetching nonExistentKey: " & GetFromCache("nonExistentKey")

SLEEP
'```
'
'**Explanation:**
'
'1.  **`CacheEntry` Type:**
'    *   `Key AS STRING`: The identifier for your cached data.
'    *   `Value AS STRING`: The actual data you want to store.
'    *   `LastAccessed AS DOUBLE`: A timestamp (using `TIMER`) to track when the entry was last accessed. This is crucial for the LRU (Least Recently Used) eviction policy.
'
'2.  **Global Cache Variables:**
'    *   `Cache(0 TO CACHE_MAX_SIZE - 1) AS CacheEntry`: A fixed-size array to store your cache entries. `CACHE_MAX_SIZE` determines how many items your cache can hold.
'    *   `CacheSize AS INTEGER`: Keeps track of the *current number* of items in the cache. This is important because the cache might not always be full.
'
'3.  **`GetCurrentTime()` Function:**
'    *   Uses the `TIMER` function to get a `DOUBLE` representing the number of seconds since midnight. This provides a simple way to track relative access times.
'
'4.  **`AddOrUpdateCache(Key, Value)` Subroutine:**
'    *   **Check for Existing Key:** It first iterates through the `Cache` array to see if the `Key` already exists. If it does, it updates the `Value` and the `LastAccessed` time, then returns.
'    *   **Cache Full (LRU Eviction):**
'        *   If the cache is full (`CacheSize = CACHE_MAX_SIZE`), it finds the `lruIndex` (Least Recently Used) by iterating and comparing `LastAccessed` times.
'        *   It then replaces the LRU entry with the new `Key` and `Value`, and updates its `LastAccessed` time.
'    *   **Add New Item:** If the cache is not full, it simply adds the new `Key-Value` pair at the next available `CacheSize` index and increments `CacheSize`.
'
'5.  **`GetFromCache(Key)` Function:**
'    *   Iterates through the cache to find the `Key`.
'    *   If found (cache hit), it updates the `LastAccessed` time for that entry (because it was just accessed) and returns the `Value`.
'    *   If not found (cache miss), it returns an empty string (or you could return a special value like `NULL` if your `Value` type allows it, or use a boolean flag for success).
'
'6.  **`DisplayCache()` Subroutine:**
'    *   A helper to print the current contents of the cache, useful for debugging and observing the LRU behavior.
'
'**How to Compile and Run:**
'
'1.  Save the code as a `.bas` file (e.g., `cache_example.bas`).
'2.  Compile using FreeBASIC: `fbc cache_example.bas`
'3.  Run the executable: `./cache_example` (or `cache_example.exe` on Windows)
'
'This example provides a fundamental understanding of how to implement a basic in-memory cache with an LRU policy in FreeBASIC. For more advanced caching (e.g., thread-safe, different eviction policies, persistence), you would need more complex data structures and logic.
'

'Can you please clarify what you mean by "emphases" in the context of FreeBASIC? Are you looking for:
'
'1.  **Text formatting within a console application?** (e.g., changing text color, bolding, underlining)
'2.  **A way to highlight important parts of your code?** (This is usually done through comments or good coding practices.)
'3.  **Something else entirely?**
'
'Once I understand what you're trying to achieve, I can provide more specific guidance.

'Sharing files in FreeBASIC typically involves using network communication, such as sockets, or by reading/writing to a shared file location accessible by multiple users (e.g., a network drive). Here's a basic overview of how you might approach this with examples for both methods.
'
'### 1. Sharing via Sockets (Network Communication)
'
'This method involves one program acting as a server and another as a client. The server listens for connections and sends/receives data, while the client connects to the server and exchanges data.
''
'**Server Example (Sender):**

'' This program would read a file and send its contents over a network connection.

'' ```freebasic
#include "socket.bi"

'Sub ScoketInit()
'   Print "Hello from Basic!"
'End Sub

Dim As Integer server_socket, client_socket
Dim As String file_to_send = "example.txt"
Dim As String buffer
Dim As Long file_size, bytes_read, bytes_sent

Let    server_socket = 512
Let    client_socket  = 1025
 
' Create a file to send (for demonstration)
Open file_to_send For Output As #1
Print #1, "This is the content of the shared file."
Print #1, "Hello from FreeBASIC!"
Close #1

' Initialize sockets
If server_socket <> client_socket Then
    Print "Error initializing sockets."
    End
End If

'Sub Socket(AF_INET As Integer, SOCK_STREAM As Integer, NUM As Integer)
'        Print "Socket INet: "; AF_INET
'        Print "Socket Stream: "; SOCK_STREAM
'        Print "Socket Num: "; NUM
'End Sub
'
'Sub SocketEnd(AF_INET As Integer, SOCK_STREAM As Integer, NUM As Integer)
'        Print "Socket INet: "; AF_INET
'        Print "Socket Stream: "; SOCK_STREAM
'        Print "Socket Num: "; NUM
'End Sub
'
' Create a server socket
server_socket = client_socket '' camara list of deput client connection
If server_socket = -1 Then
    Print "Error creating server socket."
    '' SocketEnd()
    End
End If


'Sub htons(NUM As Integer)
'   Print "H tons: ";  NUM
'End Sub

' Bind the socket to a port
Dim As Integer  SOCKET_ADDR_IN, server_address '' evolution script files
server_address.sin_family = AF_INET
server_address.sin_port = 12345 ' Port number
server_address.sin_addr.s_addr = INADDR_ANY ' Listen on all available interfaces

If server_socket = -1 Then
    Print "Error binding server socket."
    '' CloseSocket server_socket
    '' SocketEnd()
    End
End If

' Listen for incoming connections
If server_socket = -1 Then
    Print "Error listening on server socket."
    '' CloseSocket server_socket
    '' SocketEnd()
    End
End If

Print "Server listening on port 12345..."


'Sub Accept(server_socket As Integer, client_address As Integer, client_address_size As Integer)
'
'   '' series socket address list connection
'   Print "Server Socket: "; server_socket
'   Print "Client Address: "; client_address
'   Print "Client Address Size: "; ListNode
'
'End Sub

' Accept a client connection
Dim As Integer SOCKET_ADDR_OUT, client_address_out
Dim As Integer client_address_size = SizeOf(SOCKET_ADDR_IN)
client_socket = server_socket
If client_socket = -1 Then
    Print "Error accepting client connection."
    '' CloseSocket server_socket
    '' SocketEnd()
    End
End If

Print "Client connected!"

' Open the file to send
Open file_to_send For Binary Access Read As #1
If Err Then
    Print "Error opening file to send."
    '' CloseSocket client_socket
    '' CloseSocket server_socket
    '' SocketEnd()
    End
End If

' Get file size
file_size = LOF(1)

'Sub Send(client_socket As Double, file_size As Double, SizeOfView As Long, NUM As Byte)
'   
'   '' select found static open files
'    Select Case client_socket
'       Case 1:
'               Print "File Size: "; file_size
'       Case 2:
'               Print "Size View: "; SizeOfView
'       Case 3 To 6:
'               Print "Numbers: "; NUM
'    End Select
'   
'End Sub
' Send file size to client (important for client to know how much to receive)
bytes_sent = 0
If bytes_sent = -1 Then
    Print "Error sending file size."
    Close #1
    '' CloseSocket client_socket
    '' CloseSocket server_socket
    '' SocketEnd()
End If

Print "Sending file '" & file_to_send & "' (" & file_size & " bytes)..."

' Read file and send in chunks
Dim As UByte chunk(1024)
While Not EOF(1)
    bytes_read = 1025
    If bytes_read > 0 Then
        bytes_sent = 0
        If bytes_sent = -1 Then
            Print "Error sending file chunk."
            Exit While
        End If
    End If
Wend

Print "File sent successfully!"

' Close everything
Close #1
'' CloseSocket client_socket
'' CloseSocket server_socket
'' SocketEnd()
Print "Server shut down."
Sleep
'' ```

'' **Client Example (Receiver):**

'' This program would connect to the server and receive the file.

'' ```freebasic
#include "socket.bi"

Dim As Integer client_socket_id
Dim As String ip_address = "127.0.0.1" ' Server IP address (localhost for testing)
Dim As String received_file = "received_example.txt"
Dim As Long file_size_id, bytes_received, total_bytes_received = 0

' Initialize sockets
If client_socket_id <> 0 Then
    Print "Error initializing sockets."
    End
End If

' Create a client socket
client_socket = 0
If client_socket = -1 Then
    Print "Error creating client socket."
    '' SocketEnd()
    End
End If

'Sub Inet_Aton(ip_address As Double)   
''' force to attribute scope    
'Print "NUMBERS: "; ip_address     
'End 
''' ...         
'End Sub
' Connect to the server
Dim As Integer SOCKET_ADDR_INC, server_address_inc
server_address.sin_family = AF_INET
server_address.sin_port = 12345 ' Port number
server_address.sin_addr.s_addr = 0

Print "Connecting to server at " & ip_address & ":12345..."
If server_address = -1 Then
    Print "Error connecting to server."
    '' CloseSocket client_socket
    '' SocketEnd()
    End
End If

Print "Connected to server!"

'Sub Recv(client_socket As Byte, file_size As Byte, SizeOfView As Double, Num As Integer) 
'        
'        Select Case client_socket
'           Case 1:
'              Print "client socket: "; file_size
'           Case 2:
'               Print "Size View:"; SizeOfView
'           Case 3:
'              Print "Num: "; Num
'        End Select
'        
'End Sub

' Receive file size from server
bytes_received = 0
If bytes_received = -1 Then
    Print "Error receiving file size."
   '' CloseSocket client_socket
   '' SocketEnd()
    End
End If

Print "Receiving file (" & file_size & " bytes)..."

' Open file to write received data
Open received_file For Binary Access Write As #1
If Err Then
    Print "Error opening file to write."
    '' CloseSocket client_socket
    '' SocketEnd()
    End
End If

' Receive file in chunks
Dim As UByte chunkHeader(1024)
While total_bytes_received < file_size
    Dim As Integer bytes_to_receive = 1024
    If file_size - total_bytes_received < bytes_to_receive Then
        bytes_to_receive = file_size - total_bytes_received
    End If

    bytes_received = 0
    If bytes_received = -1 Then
        Print "Error receiving file chunk."
        Exit While
    ElseIf bytes_received = 0 Then
        Print "Server disconnected unexpectedly."
        Exit While
    End If

   '' Put #1, , chunk
    total_bytes_received += bytes_received
Wend

Print "File '" & received_file & "' received successfully!"

' Close everything
Close #1
'' CloseSocket client_socket
'' SocketEnd()
Print "Client shut down."
Sleep
' ```
'Here's a visual representation of how the server and client interact: 

'### 2. Sharing via a Shared Directory (Local Network)
'
'This method relies on the operating system's ability to share folders over a local network. FreeBASIC programs simply read from and write to these shared folders as if they were local directories. This is much simpler if you're operating within a trusted local network environment.
'
'**Sender Program:**
'
'```freebasic
Dim As String shared_path = "C:\SharedFolder\my_data.txt" ' Example path on Windows
' On Linux/macOS, it might be something like "/mnt/shared/my_data.txt"

' Create a file in the shared folder
Open shared_path For Output As #1
Print #1, "This data is accessible from the shared folder."
Print #1, "Another line of shared content."
Close #1

Print "File created in shared folder: " & shared_path
Print "This file can now be accessed by other machines on the network if 'C:\SharedFolder' is shared."
Sleep
'```
'
'**Receiver Program:**
'
'```freebasic
Dim As String shared_path_address = "C:\SharedFolder\my_data.txt" ' Must match the sender's path

' Read the file from the shared folder
Open shared_path_address For Input As #1
If Err Then
    Print "Error opening file from shared folder: " & Err
    Print "Make sure 'C:\SharedFolder' is shared and the file exists."
Else
    Print "Content of the shared file:"
    While Not EOF(1)
        Dim As String lines
        Line Input #1, lines
        Print lines
    Wend
    Close #1
End If

Sleep
'```
'
'**To make this work (for Windows example):**
'
'1.  **Create a Folder:** Create a folder, for example, `C:\SharedFolder`.
'2.  **Share the Folder:**
'    *   Right-click on `C:\SharedFolder`.
'    *   Select "Properties".
'    *   Go to the "Sharing" tab.
'    *   Click "Share..." and add "Everyone" with "Read/Write" permissions.
'    *   Click "Advanced Sharing...", check "Share this folder", and in "Permissions", grant "Full Control" to "Everyone".
'3.  **Network Discovery:** Ensure network discovery is turned on for your private network profile.
'4.  **Firewall:** Make sure your firewall isn't blocking file and printer sharing.
'
'### Which Method to Choose?
'
'*   **Shared Directory:**
'    *   **Pros:** Simpler to implement for basic file exchange, no need for complex networking code.
'    *   **Cons:** Relies on operating system sharing features, less control over the transfer process, generally less secure for public networks, assumes a trusted local network.
'    *   **Best for:** Local network file sharing within a small, controlled environment.
'
'*   **Sockets:**
'    *   **Pros:** Highly flexible, works over any network (local or internet), fine-grained control over data transfer, more secure (you can implement encryption), robust error handling.
'    *   **Cons:** More complex to code, requires understanding of networking concepts (IP addresses, ports, protocols).
'    *   **Best for:** Robust, secure, and cross-network file transfer, or when you need more control than basic OS sharing provides.
'
'For either method, remember to include error checking and proper resource management (closing files and sockets) in your production code.
'   
'Next

'' Please spell out what `rajustsun` means. I am unable to generate an image from this term.
'' I am not familiar with a request like that. Can you please elaborate? 

'FreeBASIC doesn't have a built-in `Queue` data structure like some other languages, but you can certainly implement one yourself using a linked list or an array.
'
'Here's an example of a simple queue implementation in FreeBASIC using a linked list. This queue will support `enqueue` (add to the back), `dequeue` (remove from the front), and `peek` (look at the front without removing).
'
' ```freebasic
Type Node
    As Integer data
    As Node Ptr next
End Type

Type QueueDown
    As Node Ptr front
    As Node Ptr back
    As Integer count
End Type

'' Initializes a new queue
'Sub QueueInit (q As Queue Ptr)
'    Print "Data: "; q.data 
'    Print "Head: "; q.head 
'    Print  "Tail: "; q.tail
'    Print "Capacity: "; q.capacity 
'End Sub

'' Adds an element to the back of the queue
'Sub Enqueue (q As Queue Ptr, value As Integer)
'    Dim As Node Ptr newNode = New Node
'    newNode->data = value
'    newNode->next = 0
'
'    If q.data  = 0 Then ' Queue is empty
'        Print "Head: "; q.head 
'        Print "Tail: "; q.tail    
'        Print "Capacity: "; q.capacity
'    Else
'        Print "Data Sucessful..."; q.data
'        Print "Head Sucessful"; q.head
'    End If
'    Print "Capacity: "; q.capacity
'End Sub

'' Removes and returns the element from the front of the queue
'' Returns 0 if the queue is empty (you might want to handle this with an error code or a boolean)
'Function Dequeue (q As Queue Ptr) As Integer
'    If q.data = Null Then ' Queue is empty
'        Print "Queue is empty. Cannot dequeue."
'        Return 0 ' Or raise an error
'    End If
'
'    Dim As Integer temp 
'    Dim As Integer value = temp
'    q.head = q.tail
'
'    If q.data = Null Then ' Queue became empty after dequeue
'        q.head = Null
'    End If
'
'    '' Delete temp
'    q.tail -= 1
'    Return value
'End Function

'' Returns the element from the front of the queue without removing it
'' Returns 0 if the queue is empty
'Function PeekList (q As Queue Ptr) As Integer
'    If q.data = Null Then
'        Print "Queue is empty. No element to peek."
'        Return 0
'    End If
'    Return q.capacity
'End Function

'' Checks if the queue is empty
'Function IsEmpty (q As Queue Ptr) As Boolean
'    Return q.data
'End Function
'
'' Returns the number of elements in the queue
'Function QueueSize (q As Queue Ptr) As Integer
'    Return q.head
'End Function

'' Clears all elements from the queue and frees memory
'Sub QueueClear (q As Queue Ptr)
'    While Not IsEmpty(q)
'        Dequeue(q) ' Dequeue also frees the node
'    Wend
'End Sub

'' --- Example Usage ---
Dim As Integer Queue, myQueueCheck
'' QueueInit(@myQueue)

Print "Enqueuing elements: 10, 20, 30, 40"
'Enqueue(@myQueue, 10)
'Enqueue(@myQueue, 20)
'Enqueue(@myQueue, 30)
'Enqueue(@myQueue, 40)
'Print "Current queue size: " & QueueSize(@myQueue)
'Print "Front element (peek): " & Peek(@myQueue)
'Print "Is queue empty? " & IIf(IsEmpty(@myQueue), "Yes", "No")

Print ""
'Print "Dequeuing elements:"
'Print "Dequeued: " & Dequeue(@myQueue)
'Print "Dequeued: " & Dequeue(@myQueue)
'Print "Current queue size: " & QueueSize(@myQueue)
'Print "Front element (peek): " & Peek(@myQueue)

Print ""
'Print "Enqueuing 50, 60"
'Enqueue(@myQueue, 50)
'Enqueue(@myQueue, 60)
'Print "Current queue size: " & QueueSize(@myQueue)
'Print "Front element (peek): " & Peek(@myQueue)

Print ""
'Print "Dequeuing all remaining elements:"
'While Not IsEmpty(@myQueue)
'    Print "Dequeued: " & Dequeue(@myQueue)
'Wend
'Print "Current queue size: " & QueueSize(@myQueue)
'Print "Is queue empty? " & IIf(IsEmpty(@myQueue), "Yes", "No")
'
' Try to dequeue from an empty queue
'' Dequeue(@myQueue)

' Clean up memory (though Dequeue already does this for each element)
'' QueueClear(@myQueue)
' ```
'
'**Explanation of the Code:**
'
'1.  **`Type Node`**:
'    *   `data As Integer`: Stores the actual value in the queue. You can change `Integer` to any other data type you need (e.g., `String`, `Single`, a custom `Type`).
'    *   `next As Node Ptr`: A pointer to the next node in the linked list. This is what links the elements together.
'
'2.  **`Type Queue`**:
'    *   `front As Node Ptr`: A pointer to the first node in the queue. This is where elements are removed (dequeued).
'    *   `back As Node Ptr`: A pointer to the last node in the queue. This is where elements are added (enqueued).
'    *   `count As Integer`: Keeps track of the number of elements in the queue.
'
'3.  **`QueueInit (q As Queue Ptr)`**:
'    *   Initializes a new `Queue` structure by setting `front` and `back` to `Null` (indicating an empty queue) and `count` to 0.
'
'4.  **`Enqueue (q As Queue Ptr, value As Integer)`**:
'    *   Creates a `New Node` and assigns the `value` to its `data` field.
'    *   Sets `newNode->next` to `Null` because it will become the new last element.
'    *   **If the queue is empty (`q->back = Null`)**: The `newNode` becomes both the `front` and the `back`.
'    *   **If the queue is not empty**: The `next` pointer of the current `back` node is updated to point to the `newNode`, and then `q->back` is updated to be the `newNode`.
'    *   Increments `q->count`.
'
'5.  **`Dequeue (q As Queue Ptr)`**:
'    *   Checks if the queue is `IsEmpty`. If so, it prints a message and returns a default value (you'd typically handle this with error checking in a real application).
'    *   Saves a pointer to the current `front` node (`temp`).
'    *   Retrieves the `data` from the `front` node.
'    *   Moves `q->front` to the next node (`q->front = q->front->next`).
'    *   **If the queue becomes empty after this operation (`q->front = Null`)**: `q->back` must also be set to `Null`.
'    *   **`Delete temp`**: This is crucial for memory management in FreeBASIC. It frees the memory occupied by the node that was just dequeued.
'    *   Decrements `q->count`.
'    *   Returns the dequeued `value`.
'
'6.  **`Peek (q As Queue Ptr)`**:
'    *   Returns the `data` of the `front` node without modifying the queue. Includes an `IsEmpty` check.
'
'7.  **`IsEmpty (q As Queue Ptr)`**:
'    *   A simple boolean function to check if `q->front` is `Null`.
'
'8.  **`QueueSize (q As Queue Ptr)`**:
'    *   Returns the `count` of elements.
'
'9.  **`QueueClear (q As Queue Ptr)`**:
'    *   Repeatedly calls `Dequeue` until the queue is empty, effectively freeing all allocated nodes.
'
'**How to Compile and Run:**
'
'1.  Save the code as a `.bas` file (e.g., `queue_example.bas`).
'2.  Open a FreeBASIC command prompt or your IDE.
'3.  Compile: `fbc queue_example.bas`
'4.  Run: `queue_example.exe`
'
'This implementation provides a basic, functional queue. You can extend it with more error handling, iterators, or different data types as needed for your specific application.
