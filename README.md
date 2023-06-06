# myscanf
 Programas para 16 y 32 bits en ensamblador del x86 que leen una cadena del teclado y la despliegan en patalla
 * **ReadConsole_16bits.asm** -- Código ensamblador en modo real que usa la llamada al sistema ``0Ah`` para permitir al usuario ingresar una cadena. La captura termina cuando el usuario presiona <kbd>Enter</kbd>. Hace uso de una estructura, definida con el nombre ``KEYBOARD`` para almacenar en un buffer lo que el usuario teclea.
 ```console
 C:\BIN\>ReadConsole_16bits.exe
 qwerty
 Leido del teclado: qwerty
 ```
* **ReadConsole_32bits.asm** -- Código ensamblador en modo protegido que usa las funciones ``GetStdHandle``, ``WriteConsoleA``, y ``ReadConsoleA``, para obtener el manejador de consola, escribir a consola, y leer de consola, respectivamente. Dichas funciones son parte de las [funciones de entrada-salida estándar de Windows](https://learn.microsoft.com/en-us/windows/console/).