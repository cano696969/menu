# menu#!/bin/bash

# Función para clonar el repositorio
clone_repository() {
    echo "LinuxEuphony/linux-desktop-environment-tool-clia"
    git clone https://github.com/LinuxEuphony/linux-desktop-environment-tool-cli.git
    echo "Repositorio clonado exitosamente."
}

# Función para la opción 1
option_one() { 
    echo "Clonando el repositorio..."
    git clone https://github.com/foo2rama/Kali-Debian-Update-Scripts-and-more.git
    cho "Repositorio clonado exitosamente."
}
}

# Función para la opción 2
option_two() {
    echo "Kali-Debian-Update-Scripts-and-mor."
    git clone https://github.com/foo2rama/Kali-Debian-Update-Scripts-and-more.git
    cho "Repositorio clonado exitosamente."
}
}

# Función para la opción 3
option_three() {
     echo "zshpowerlevel10k"
    git clone https://github.com/romkatv/powerlevel10k.git
    cho "Repositorio clonado exitosamente."
}
}

# Función para la opción 4
option_four() {
     echo "sudorook/debian"
    git clone https://github.com/sudorook/debian.git
    cho "Repositorio clonado exitosamente."
}
}

# Función para la opción 5
option_five() {
    echo "Opción 5 seleccionada."
    # Agrega aquí la lógica para la opción 5
}

# Función para mostrar el menú
show_menu() {
    clear
    echo "***** Menú *****"
    echo "1. Clonar el repositorio"
    echo "2. Opción 2"
    echo "3. Opción 3"
    echo "4. Opción 4"
    echo "5. Opción 5"
    echo "6. Salir"
    echo "****************"
}

# Ciclo principal
while true; do
    show_menu
    read -p "Ingrese su elección [1-6]: " choice
    case $choice in
        1) option_one ;;
        2) option_two ;;
        3) option_three ;;
        4) option_four ;;
        5) option_five ;;
        6) echo "Saliendo..."; exit ;;
        *) echo "Por favor, ingrese una opción válida." ;;
    esac
    read -p "Presione Enter para continuar..."
done
