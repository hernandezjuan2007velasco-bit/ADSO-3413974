# Manual Básico de Commits en Git

## 1. ¿Qué es un commit?

Un **commit** es un registro de los cambios realizados en un proyecto dentro de un sistema de control de versiones.

En Git, un commit funciona como una **fotografía del estado del proyecto en un momento específico**, permitiendo guardar el historial de modificaciones que se hacen en los archivos.

Cada commit guarda información importante como:
- Los cambios realizados
- El autor del cambio
- La fecha y hora
- Un mensaje que describe lo que se modificó

Esto permite llevar un control organizado del desarrollo de un proyecto.

---

## 2. ¿Para qué sirven los commits?

Los commits son importantes porque permiten:

- Guardar los cambios realizados en un proyecto.
- Mantener un historial de todas las modificaciones.
- Recuperar versiones anteriores del proyecto.
- Facilitar el trabajo en equipo.
- Identificar errores o cambios fácilmente.

Gracias a los commits, es posible saber **qué cambió, cuándo cambió y quién lo cambió**.

---

## 3. Requisitos para crear commits

Antes de crear commits es necesario tener:

- Git instalado en el computador
- Un proyecto o carpeta de trabajo
- Inicializar un repositorio Git

---

## 4. Cómo crear un commit paso a paso

### Paso 1: Inicializar el repositorio

Primero se debe inicializar Git en la carpeta del proyecto.

```bash
git init
```

Este comando crea un repositorio Git en el proyecto.

---

### Paso 2: Verificar el estado de los archivos

Para ver los archivos modificados se usa:

```bash
git status
```

Este comando muestra los archivos que han sido modificados o que aún no han sido agregados al commit.

---

### Paso 3: Agregar archivos al área de preparación

Antes de hacer el commit, se deben agregar los archivos que se quieren guardar.

Para agregar todos los archivos:

```bash
git add .
```

Para agregar un archivo específico:

```bash
git add archivo.txt
```

---

### Paso 4: Crear el commit

Una vez agregados los archivos, se crea el commit con el siguiente comando:

```bash
git commit -m "Mensaje descriptivo del cambio"
```

Ejemplo:

```bash
git commit -m "Se agregó el sistema de registro de usuarios"
```

El mensaje debe explicar claramente qué cambios se realizaron.

---

## 5. Buenas prácticas al hacer commits

Para mantener un historial organizado es recomendable:

- Escribir mensajes claros.
- Explicar qué cambio se realizó.
- Hacer commits pequeños y frecuentes.
- Evitar mensajes poco claros como "cambios" o "arreglo".

Ejemplos de buenos mensajes de commit:

```
Agrega formulario de inicio de sesión
Corrige error en cálculo de salario
Actualiza diseño del menú principal
```

---

## 6. Ver historial de commits

Para ver todos los commits realizados se utiliza el comando:

```bash
git log
```

Este comando muestra:

- Identificador del commit
- Autor
- Fecha
- Mensaje del commit

---

## 7. Conclusión

Los commits son una parte fundamental del uso de Git, ya que permiten guardar los cambios realizados en un proyecto y mantener un historial organizado del desarrollo. Utilizar commits correctamente facilita el trabajo individual y en equipo, además de permitir recuperar versiones anteriores del proyecto cuando sea necesario.