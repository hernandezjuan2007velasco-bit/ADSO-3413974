# Rediseño del Sistema de Gestión de Horarios SENA

**Equipo:** Aprendices Tecnólogo en Análisis y Desarrollo de Software (ADSO) — SENA
**Insumo de referencia:** Mockup navegable `code-sena/design-software-mockup`
**Tipo de documento:** Propuesta de rediseño UX/UI, con análisis crítico del diseño original

---

## 1. Introducción

Este documento presenta el rediseño UX/UI del **Sistema de Gestión de Horarios del SENA**, tomando como punto de partida el mockup navegable publicado por el equipo `code-sena` en GitHub Pages. El instructor solicitó explícitamente **rediseñar el mockup a nuestro criterio** y documentar ese rediseño en Markdown, por lo que este trabajo no es una simple descripción del prototipo original: es un ejercicio de análisis de experiencia de usuario, detección de problemas y propuesta de una solución visual y funcional distinta, justificada con criterios de diseño.

El mockup original es en sí mismo un prototipo bien construido —con guardas de acceso por rol, estados de carga/vacío/error y una arquitectura modular ordenada—, pero eso no significa que su interfaz sea la mejor decisión posible. Nuestro trabajo consistió en identificar qué funciona, qué genera fricción para el usuario y cómo lo resolveríamos si tuviéramos que diseñar este sistema desde cero, respetando siempre las funciones que el sistema debe cumplir.

## 2. Objetivo del rediseño

Diseñar una nueva propuesta visual y de interacción para el Sistema de Gestión de Horarios del SENA que:

- Mantenga las funciones ya confirmadas en el mockup original (no se elimina ninguna capacidad del sistema).
- Reduzca la carga cognitiva del usuario en las pantallas con más densidad de información (horarios, conflictos, indicadores).
- Simplifique procesos que hoy requieren más pasos de los necesarios.
- Proponga una identidad visual propia, coherente con una institución educativa pública, distinta a la estética genérica del mockup original.
- Refuerce la accesibilidad y el comportamiento responsive con criterios concretos, no solo declarativos.
- Documente cada decisión de diseño con una justificación, evitando cambios "porque sí".

## 3. Mockup utilizado como referencia

- **URL pública:** `https://code-sena.github.io/design-software-mockup/`
- **Punto de entrada del prototipo:** `app/index.html#/inventory` (índice navegable de 53 pantallas)
- **Repositorio:** `code-sena/design-software-mockup`

Es importante aclarar algo que encontramos en la página raíz del sitio: el propio equipo autor indica que ese repositorio publica **únicamente el mockup** (interfaz y datos ficticios), y que la documentación técnica profunda del sistema real (modelo de datos, diseño RBAC completo, contratos de API) permanece en un repositorio privado (`code-sena/design-software-docs`). Esto significa que nuestro rediseño se basa en lo que el mockup expone visualmente y en su código fuente público (HTML/CSS/JS), no en documentación de negocio adicional que no es pública.

## 4. Metodología

Para este rediseño trabajamos en dos etapas:

**Etapa 1 — Verificación directa.** En vez de limitarnos a mirar capturas de pantalla, revisamos el código fuente del mockup (HTML, CSS y JavaScript) para confirmar con certeza qué pantallas existen, qué roles maneja el sistema, qué datos se muestran y cómo está armada la navegación. Esto nos permitió construir un inventario 100% verificado, sin adivinar contenido que no pudiéramos comprobar.

**Etapa 2 — Rediseño con criterio.** Sobre ese inventario confirmado, analizamos cada grupo de pantallas desde una óptica de UX (flujo, pasos, jerarquía de información) y de UI (color, tipografía, espaciado, consistencia visual), documentamos los problemas que encontramos y propusimos una solución concreta para cada uno, explicando el motivo.

A lo largo de todo el documento usamos dos etiquetas para que quede clara la diferencia entre lo que existe y lo que proponemos:

> **CONFIRMADO** — se puede comprobar directamente en el mockup original.
> **PROPUESTA DE REDISEÑO** — decisión de diseño tomada por nuestro equipo.

**Nota sobre el archivo previo:** no tuvimos acceso al `REDISEÑO_MOCKUP.md` que ya existía en el proyecto (no fue posible cargarlo en esta sesión de trabajo), por lo que este documento se construyó completo desde cero, cuidando de no repetir errores comunes como inventar pantallas o mezclar hechos con propuestas sin aclararlo.

## 5. Inventario de pantallas

El mockup original expone **53 pantallas y modales**, organizados en 7 grupos y repartidos entre 9 módulos de dominio (más el *shell* general de la aplicación). Todas las filas de esta tabla están marcadas como ✅ **Confirmada**, porque se verificaron directamente en el código fuente del router (`shell/routes.js`) y en las funciones de pantalla de cada módulo (`screens.js`).

| # | Pantalla | Módulo | Rol | Elementos principales | Función | Verificada |
|---:|---|---|---|---|---|:---:|
| 1 | Login | iam | público | Formulario de correo/contraseña, botón mostrar/ocultar contraseña | Autenticación (detecta el rol según el dominio del correo) | ✅ |
| 2 | Recuperar contraseña | iam | público | Formulario de correo | Iniciar recuperación de acceso | ✅ |
| 3 | Nueva contraseña | iam | público | Formulario de nueva contraseña | Definir una nueva contraseña | ✅ |
| 4 | App Shell por rol | shell | coordinador | Topbar, sidebar, panel de contenido | Marco visual común a toda la app | ✅ |
| 5 | Panel de notificaciones | shell | coordinador | Lista de últimos 5 avisos | Consultar notificaciones recientes | ✅ |
| 6 | Estados globales | shell | coordinador | Vistas 403 / 404 / 500 / sesión expirada | Mostrar estados de error del sistema | ✅ |
| 7 | Dashboard / Inicio | shell + scheduling + academic | coordinador | Resumen general | Punto de entrada del coordinador | ✅ |
| 8 | Horarios — lista | scheduling | coordinador | Tabla, filtros, paginación | Listar horarios por ficha/periodo | ✅ |
| 9 | Detalle de horario | scheduling | coordinador | Ficha técnica del horario | Ver información completa de un horario | ✅ |
| 10 | Crear / editar horario | scheduling | coordinador | Formulario de horario | Registrar o modificar un horario | ✅ |
| 11 | Modal agregar/editar sesión | scheduling | coordinador | Formulario de sesión (día, franja, instructor, ambiente) | Añadir una sesión a un horario | ✅ |
| 12 | Modal confirmar publicación | scheduling | coordinador | Confirmación con resumen | Publicar un horario | ✅ |
| 13 | Panel de conflictos | scheduling | coordinador | Lista de conflictos detectados | Ver cruces de horario | ✅ |
| 14 | Modal resolver conflicto | scheduling | coordinador | Detalle del conflicto + acción | Resolver un conflicto puntual | ✅ |
| 15 | Disponibilidad | environment + actors | coordinador | Consulta de ambientes/instructores libres | Verificar disponibilidad antes de programar | ✅ |
| 16 | Detalle de ambiente | environment | coordinador | Capacidad, ubicación, tipo | Ver información de un ambiente | ✅ |
| 17 | Fichas — lista | academic | coordinador | Tabla de fichas | Listar fichas de formación | ✅ |
| 18 | Detalle de ficha | academic | coordinador | Programa, jornada, modalidad, cupo | Ver información de una ficha | ✅ |
| 19 | Mi horario — semana (instructor) | scheduling | instructor | Calendario semanal | Consultar el horario propio | ✅ |
| 20 | Detalle de sesión | scheduling | instructor | Panel lateral de sesión | Ver el detalle de una clase propia | ✅ |
| 21 | Mi disponibilidad | actors | instructor | Calendario de disponibilidad | Declarar disponibilidad horaria | ✅ |
| 22 | Modal crear excepción | actors | instructor | Formulario de excepción | Registrar una ausencia/excepción puntual | ✅ |
| 23 | Seguimiento de ficha | monitoring | instructor | Lista de aprendices/indicadores | Consultar el seguimiento de una ficha | ✅ |
| 24 | Registrar seguimiento | monitoring | instructor | Formulario de seguimiento | Registrar una novedad académica | ✅ |
| 25 | Mi horario — semana (aprendiz) | scheduling | aprendiz | Calendario semanal | Consultar el horario de clases | ✅ |
| 26 | Notificaciones | monitoring | aprendiz | Lista de notificaciones | Consultar avisos personales | ✅ |
| 27 | Detalle de clase | scheduling | aprendiz | Información de la sesión | Ver el detalle de una clase | ✅ |
| 28 | Detalle de notificación | monitoring | aprendiz | Contenido completo del aviso | Leer una notificación específica | ✅ |
| 29 | Panel de indicadores | monitoring | director | Tarjetas KPI | Ver indicadores generales del centro | ✅ |
| 30 | Drill-down de KPI | monitoring | director | Detalle de un indicador | Profundizar en un KPI específico | ✅ |
| 31 | Usuarios — lista | iam | director | Tabla de usuarios | Listar usuarios del sistema | ✅ |
| 32 | Crear / editar usuario | iam | director | Formulario de usuario | Registrar o editar un usuario | ✅ |
| 33 | Detalle de usuario | iam | director | Ficha del usuario | Ver información de un usuario | ✅ |
| 34 | Modal asignar/revocar rol | iam | director | Selector de rol | Cambiar el rol de un usuario | ✅ |
| 35 | Datos de referencia | reference | director | Catálogos generales | Consultar catálogos institucionales | ✅ |
| 36 | Editar catálogo/valor/parámetro | reference | director | Formulario de edición | Editar un valor de catálogo | ✅ |
| 37 | Documentos — lista | document | soporte | Tabla de documentos | Listar documentos generados | ✅ |
| 38 | Plantillas de documento | document | soporte | Tabla de plantillas | Listar plantillas disponibles | ✅ |
| 39 | Auditoría | audit | soporte | Tabla de eventos | Consultar el registro de auditoría | ✅ |
| 40 | Parametrización / catálogos | reference | soporte | Tabla de parámetros | Administrar catálogos del sistema | ✅ |
| 41 | Detalle de documento + versiones | document | soporte | Historial de versiones | Ver un documento y sus versiones anteriores | ✅ |
| 42 | Modal generar documento | document | soporte | Selector de plantilla | Generar un nuevo documento | ✅ |
| 43 | Editor / preview de plantilla | document | soporte | Editor + vista previa | Editar una plantilla de documento | ✅ |
| 44 | Modal detalle de auditoría | audit | soporte | Payload del evento | Ver el detalle técnico de un evento | ✅ |
| 45 | CRUD catálogo/valor/parámetro | reference | soporte | Formulario CRUD | Administrar valores de catálogo | ✅ |
| 46 | Hub de parametrización | reference | director + soporte | Menú de accesos | Punto de entrada a la parametrización | ✅ |
| 47 | Currículo académico | academic | director + soporte | Tabla de programas | Parametrizar el currículo | ✅ |
| 48 | Jornadas / franjas horarias | scheduling | director + soporte | Tabla de franjas | Parametrizar jornadas | ✅ |
| 49 | Tipos de ambiente e inventario | environment | director + soporte | Tabla de tipos de ambiente | Parametrizar ambientes | ✅ |
| 50 | Catálogos de monitoreo (KPI/alertas) | monitoring | director + soporte | Tabla de KPIs/alertas | Parametrizar indicadores | ✅ |
| 51 | Estados de actores | actors | director + soporte | Tabla de estados | Parametrizar estados de instructores/aprendices | ✅ |
| 52 | Geografía institucional | reference | director + soporte | Tabla de ubicaciones | Parametrizar sedes/regionales | ✅ |
| 53 | RBAC — roles y permisos | iam | director + soporte | Matriz de permisos | Parametrizar roles y permisos | ✅ |

> Nota de trazabilidad: el propio mockup, en su índice interactivo (`#/inventory`), se autodenomina en un punto como "45 pantallas" y en otro como "53 pantallas" — la tabla que usamos aquí (53) corresponde al inventario maestro definitivo registrado en `shell/routes.js` y confirmado en `README.md` y `VALIDATION.md` del proyecto, que son las fuentes más actualizadas.

## 6. Roles identificados

Todos los roles siguientes están **confirmados** directamente en el formulario de login del mockup (el sistema asigna el rol según el dominio del correo electrónico usado) y en las guardas de acceso del router:

| Rol | Descripción confirmada | Pantalla de inicio |
|---|---|---|
| Coordinador Académico | Administra horarios, disponibilidad y fichas | Dashboard general |
| Instructor | Consulta su horario, declara disponibilidad y registra seguimiento | Mi horario |
| Aprendiz | Consulta su horario de clases y sus notificaciones | Mi horario |
| Director de Centro | Consulta indicadores, administra usuarios y datos de referencia | Panel de indicadores |
| Administrador de Soporte | Administra documentos, plantillas, auditoría y parametrización | Documentos |

No encontramos, en el mockup, ningún rol adicional a estos cinco, ni subroles o permisos granulares más allá de la pantalla de "RBAC — roles y permisos" (pantalla 53), que exhibe la interfaz de administración de permisos pero no expone el detalle exacto de qué permiso individual tiene cada rol (esa información, según la nota del propio repositorio, vive en la documentación privada). Por lo tanto, cualquier detalle sobre permisos específicos que no sea "puede ver esta pantalla / no puede verla" debe tratarse como **no verificable**.

## 7. Módulos identificados

| Módulo | Confirmado en | Responsabilidad |
|---|---|---|
| `iam` | `iam/screens.js` | Login, usuarios, roles y permisos |
| `scheduling` | `scheduling/screens.js` | Horarios, sesiones, conflictos |
| `academic` | `academic/screens.js` | Fichas de formación y currículo |
| `environment` | `environment/screens.js` | Ambientes (aulas, laboratorios, talleres) |
| `actors` | `actors/screens.js` | Disponibilidad de instructores |
| `document` | `document/screens.js` | Documentos generados y plantillas |
| `monitoring` | `monitoring/screens.js` | Indicadores, seguimiento académico, notificaciones |
| `audit` | `audit/screens.js` | Registro de auditoría del sistema |
| `reference` | `reference/screens.js` | Catálogos y parametrización institucional |
| `shell` | `shell/*.js` | Marco general de la aplicación (topbar, sidebar, router) |

## 8. Análisis UX del diseño original

**CONFIRMADO — lo que observamos al recorrer el flujo del coordinador armando un horario:**

El proceso de creación de un horario requiere pasar por varias pantallas separadas: lista de horarios → crear/editar horario → modal para agregar cada sesión (una por una) → modal de confirmación de publicación → panel de conflictos si algo cruza → modal de resolución. Es un flujo funcional, pero exige que el usuario entre y salga de modales repetidamente para completar una sola tarea (armar el horario completo de una ficha).

**PROPUESTA DE REDISEÑO — problema identificado:** cada sesión se agrega mediante un modal individual, lo que obliga a abrir y cerrar la misma ventana tantas veces como sesiones tenga el horario (una ficha puede tener fácilmente 10 o más sesiones semanales). Esto multiplica los clics y aumenta la probabilidad de que el coordinador pierda el contexto de lo que ya lleva armado.

**CONFIRMADO — sobre las listas (horarios, fichas, usuarios, documentos, auditoría):**
Todas comparten el mismo patrón: una tabla con filtros arriba y paginación abajo, con opciones de 10/20/50 registros por página.

**PROPUESTA DE REDISEÑO — problema identificado:** al ser un patrón repetido en más de 8 pantallas distintas, cualquier usuario que revise, por ejemplo, la tabla de auditoría (con textos técnicos como nombres de eventos y servicios) se enfrenta al mismo formato tabular que usaría el aprendiz para ver una lista mucho más simple. La tabla no se adapta a la complejidad real de cada tipo de dato.

**CONFIRMADO — sobre el panel de conflictos:**
Los conflictos se listan con un tipo (`INSTRUCTOR_DOUBLE_BOOKED`, `ENVIRONMENT_DOUBLE_BOOKED`, `SESSIONS_OVERLAP`), una descripción textual y un estado resuelto/pendiente.

**PROPUESTA DE REDISEÑO — problema identificado:** el conflicto se explica solo con texto ("Juan Pérez tiene dos sesiones que se solapan..."), sin ningún apoyo visual (por ejemplo, mostrar las dos sesiones enfrentadas en el mismo calendario). Para un coordinador que revisa varios conflictos seguidos, leer un párrafo por cada uno es más lento que verlos superpuestos visualmente.

## 9. Análisis UI del diseño original

**CONFIRMADO** — el mockup usa una sola paleta de tokens (`tokens.css`) para toda la aplicación: verde institucional (`#007832`) como color de marca, fondo blanco, superficies grises muy claras, y colores semánticos estándar (rojo para error, naranja para advertencia, verde para éxito, azul para información). La tipografía es la fuente del sistema operativo (`system-ui`), sin tipografía personalizada.

**PROPUESTA DE REDISEÑO — problema identificado (consistencia visual, no funcional):** al usar un solo tono de verde como color de marca y reservar los demás colores exclusivamente para estados (éxito/error/advertencia), la interfaz depende visualmente casi por completo de las etiquetas de estado y del texto para diferenciar información. No hay una jerarquía de color secundaria que ayude a distinguir, de un vistazo, en qué módulo está el usuario (por ejemplo, si está en Horarios o en Documentos, el entorno visual es idéntico salvo por el contenido).

**PROPUESTA DE REDISEÑO — problema identificado (tipografía):** usar únicamente la fuente del sistema operativo es una decisión válida por rendimiento (no hay que cargar fuentes externas), pero no aporta ninguna identidad visual propia. Dos instituciones distintas usando `system-ui` con el mismo verde institucional podrían verse parecidas.

**CONFIRMADO** — los componentes (tablas, tarjetas KPI, badges de estado, modales) siguen un estilo consistente entre sí gracias a estar centralizados en `components.js` y `components.css`. Esto es un acierto que decidimos conservar en el rediseño.

## 10. Problemas encontrados

Resumen consolidado de los problemas detectados en las secciones 8 y 9, todos con base en lo confirmado en el código:

| Problema | Tipo | Pantallas afectadas |
|---|---|---|
| Alto número de modales secuenciales para completar una sola tarea | UX | Crear/editar horario, agregar sesión, publicar |
| Conflictos explicados solo con texto, sin apoyo visual | UX | Panel de conflictos, resolver conflicto |
| Mismo patrón de tabla para datos de complejidad muy distinta | UX/UI | Horarios, fichas, usuarios, documentos, auditoría, parametrización |
| Ausencia de jerarquía visual secundaria más allá del verde institucional | UI | Toda la aplicación |
| Tipografía sin identidad propia | UI | Toda la aplicación |
| El calendario semanal es la única forma de ver el horario (no hay vista de lista/agenda) | UX | Mi horario (instructor y aprendiz) |
| El dashboard del coordinador no prioriza explícitamente conflictos pendientes frente a información general | UX | Dashboard / Inicio |

## 11. Nueva identidad visual — PROPUESTA DE REDISEÑO

Proponemos conservar el verde institucional como color de marca (por ser reconocible y coherente con el SENA), pero ampliar la paleta para dar más jerarquía visual y reducir la dependencia exclusiva del texto.

### Paleta de colores propuesta

| Color | Valor propuesto | Uso |
|---|---|---|
| Primario (marca) | `#00703C` | Acciones principales, enlaces activos, marca |
| Primario oscuro | `#00512B` | Estado hover/presionado de elementos primarios |
| Secundario (acento) | `#1E5AA8` | Elementos informativos y de navegación secundaria (para diferenciar módulos sin depender solo del verde) |
| Fondo general | `#F7F9F8` | Fondo de toda la aplicación (ligeramente gris, no blanco puro, para reducir fatiga visual en jornadas largas) |
| Superficie (tarjetas/paneles) | `#FFFFFF` | Fondo de tarjetas, tablas y modales |
| Texto principal | `#111827` | Texto de mayor jerarquía |
| Texto secundario | `#4B5563` | Descripciones, metadatos, texto de apoyo |
| Bordes | `#E5E7EB` | Separadores y bordes de componentes |
| Éxito | `#0F7A3D` | Confirmaciones, estados "Publicado", "Disponible" |
| Advertencia | `#B45309` | Estados "En revisión", conflictos pendientes |
| Error | `#B91C1C` | Errores, conflictos críticos, fallos de generación |
| Información | `#1D4ED8` | Mensajes informativos, ayudas contextuales |

**Justificación:** mantuvimos el verde como color dominante para no perder la identidad institucional, pero incorporamos un azul secundario para usarlo en la navegación (por ejemplo, en el estado activo del sidebar o en encabezados de sección), de forma que el usuario pueda diferenciar "dónde estoy" sin depender solo de leer el título de la página. El fondo gris muy claro en vez de blanco puro busca reducir el cansancio visual en pantallas con tablas densas, como Auditoría o Usuarios.

### Tipografía — PROPUESTA DE REDISEÑO

- **Tipografía principal:** `Inter` (o alternativa del sistema si no puede cargarse: `system-ui`), para textos generales, tablas y formularios.
- **Tipografía secundaria (títulos y KPIs):** `Inter` en peso `700` (bold) o `Sora` para los números grandes de las tarjetas KPI, buscando que los indicadores del panel del director resalten más que el resto del contenido.

**Justificación:** elegimos `Inter` porque es una tipografía diseñada específicamente para interfaces digitales, con buena legibilidad en tamaños pequeños (importante para las tablas densas del sistema) y amplia disponibilidad. Reservar un peso más marcado para los KPIs ayuda a que el panel de indicadores del director se lea como un "resumen ejecutivo" y no como una tabla más.

**Escala tipográfica propuesta:**

| Uso | Tamaño | Peso |
|---|---|---|
| Título de página (H1) | 28px | 700 |
| Título de sección (H2) | 20px | 600 |
| Texto de tabla / formulario | 14px | 400 |
| Texto de apoyo / metadatos | 13px | 400 |
| Valor de KPI | 32px | 700 |

## 12. Sistema de diseño — PROPUESTA DE REDISEÑO

Proponemos un sistema de componentes que conserve la filosofía de reutilización que ya tenía el mockup original (un único set de componentes compartidos, sin duplicar estilos por módulo), pero con ajustes puntuales:

| Componente | Cambio propuesto respecto al original |
|---|---|
| **Buttons** | Mantener variantes primaria/secundaria, agregar variante "destructiva" (roja) explícita para acciones como eliminar o cancelar, que en el original no está diferenciada. |
| **Inputs / Selects** | Agregar estado de error visible bajo el campo (texto rojo + borde rojo), no solo un mensaje genérico al final del formulario. |
| **Tables** | Introducir una variante "tabla densa" (para Auditoría, RBAC) y una variante "tabla simple" (para Notificaciones del aprendiz), en vez de un solo formato de tabla para todos los casos. |
| **Cards** | Mantener las tarjetas KPI, agregar tarjetas de "resumen de conflicto" con mini-calendario visual embebido. |
| **Badges** | Conservar el sistema de estado por color + ícono + texto del original (es un acierto), extendiéndolo a los nuevos estados propuestos. |
| **Modals** | Reducir su uso en flujos secuenciales largos (ver sección 18), reservarlos para confirmaciones puntuales. |
| **Drawers** | Nuevo componente: panel lateral deslizante para editar sesiones dentro del propio horario, sin salir de la pantalla (reemplaza varios modales encadenados). |
| **Alerts / Toasts** | Mantener, agregando variante persistente para alertas críticas (ej. conflictos sin resolver) que no desaparecen solas. |
| **Tabs** | Mantener el patrón original. |
| **Sidebar / Navbar** | Rediseño visual (ver sección 13), misma lógica de navegación por rol. |
| **Breadcrumbs** | Nuevo componente, no existía en el original — se agrega para las pantallas de detalle anidadas (ej. Detalle de horario → Detalle de sesión). |
| **Calendarios** | Se mantiene la vista semanal, se agrega una vista de agenda/lista como alternativa (ver sección 18). |
| **Paginación / Filtros / Search** | Se mantiene el patrón, con ajuste de que los filtros más usados queden visibles sin necesidad de expandir el formulario completo. |

## 13. Nueva navegación — PROPUESTA DE REDISEÑO

**CONFIRMADO:** el mockup original organiza la navegación lateral (sidebar) según el rol activo, con ítems como Horarios, Disponibilidad, Fichas para el coordinador, o Documentos, Plantillas, Auditoría, Parametrización para soporte.

**PROPUESTA DE REDISEÑO:** conservamos la navegación por rol (funciona bien y no encontramos motivo para cambiarla estructuralmente), pero proponemos dos ajustes:

1. **Agrupar visualmente los ítems de "Parametrización"** bajo un solo encabezado colapsable en el sidebar, en vez de que cada sub-sección (currículo, jornadas, ambientes, monitoreo, actores, geografía, RBAC) compita por espacio como si fueran secciones de primer nivel. Esto responde a que, en el inventario, la parametrización agrupa 8 de las 53 pantallas bajo un mismo hub, pero en el sidebar original no se refleja esa jerarquía.
2. **Agregar un buscador rápido en el sidebar** ("Buscar módulo o pantalla"), útil sobre todo para el rol de soporte, que tiene acceso a la mayor cantidad de secciones administrativas.

**Justificación:** con 53 pantallas repartidas en varios niveles, un sidebar plano (todos los ítems al mismo nivel) obliga al usuario a escanear una lista larga cada vez. Agrupar por jerarquía reduce el escaneo visual y dejar un buscador es más rápido que navegar manualmente para los roles con más acceso.

## 14. Rediseño de las pantallas

A continuación documentamos el rediseño de los grupos de pantallas más representativos del sistema. No repetimos las 53 pantallas una por una en esta sección (eso se consolida en la matriz de la sección 23), sino que profundizamos en los casos donde el rediseño introduce cambios estructurales relevantes.

| # | Pantalla original | Problema | Rediseño propuesto | Mejora | Justificación |
|---|---|---|---|---|---|
| 1 | Dashboard / Inicio (coordinador) | La información general y los conflictos pendientes no tienen una jerarquía visual explícita entre sí | Reorganizar el dashboard en dos zonas: "Requiere tu atención" (conflictos pendientes, horarios en revisión) arriba, y "Resumen general" (KPIs, actividad reciente) abajo | El coordinador identifica primero lo urgente | Un coordinador entra al sistema principalmente para actuar sobre pendientes, no para leer un resumen pasivo |
| 2 | Crear/editar horario + modal de sesión | Cada sesión se agrega en un modal separado, obligando a abrir/cerrar la misma ventana varias veces | Reemplazar el modal de sesión por un panel lateral (drawer) que permanece abierto mientras se agregan varias sesiones seguidas, con una lista en vivo de las sesiones ya agregadas | Menos clics, se mantiene el contexto del horario completo | Armar un horario es una tarea de varios elementos relacionados; un drawer permite avanzar sin perder de vista lo ya hecho |
| 3 | Panel de conflictos | Los conflictos se explican solo con texto | Agregar una vista de calendario en miniatura dentro de cada tarjeta de conflicto, resaltando las dos sesiones que chocan | El conflicto se entiende de un vistazo, no hay que leer un párrafo completo | La comparación visual de horarios es más rápida de interpretar que una descripción textual |
| 4 | Horarios — lista / Fichas — lista / Usuarios — lista | Todas las listas usan el mismo formato de tabla sin importar la complejidad del contenido | Diferenciar dos variantes de tabla: "tabla simple" (para listas cortas y con pocos campos, como Notificaciones) y "tabla densa" (para datos técnicos como Auditoría) | Cada lista se lee según su complejidad real | Una tabla de auditoría con nombres de eventos técnicos necesita más espacio de lectura que una lista de notificaciones cortas |
| 5 | Mi horario — semana (instructor/aprendiz) | El calendario semanal es la única forma de consultar el horario | Agregar una alternativa de "vista de agenda" (lista cronológica de sesiones), seleccionable con un tab junto al calendario | El usuario elige el formato que prefiera revisar | No todos los usuarios interpretan igual de rápido una grilla; una lista cronológica es más simple en pantallas pequeñas |
| 6 | Registrar seguimiento (instructor) | El formulario de seguimiento aparece como modal sin contexto visible de la ficha completa | Convertir en panel lateral que muestra, al mismo tiempo, un resumen de la ficha y el formulario de seguimiento | El instructor no pierde de vista a qué ficha le está haciendo seguimiento | Reduce el riesgo de registrar seguimiento sobre la ficha equivocada al tener el contexto siempre visible |
| 7 | Hub de parametrización (pantallas 46–53) | 8 sub-secciones administrativas distintas conviven bajo una sola pantalla "hub" sin jerarquía visual entre ellas | Reorganizar el hub como un panel de tarjetas agrupadas por tipo: "Académico" (currículo, jornadas), "Físico" (ambientes, geografía), "Sistema" (monitoreo, actores, RBAC) | Facilita encontrar la sub-sección correcta sin leer las 8 una por una | Agrupar por afinidad temática reduce el tiempo de búsqueda frente a una lista plana de 8 opciones |

## 15. Comparación original vs rediseño

| Aspecto | Mockup original | Nuestro rediseño | Beneficio |
|---|---|---|---|
| Navegación | Sidebar plano por rol, sin agrupar la parametrización | Sidebar con agrupación jerárquica y buscador rápido | Menos escaneo visual, más rápido encontrar una sección |
| Dashboard | Información general sin prioridad explícita | Zona "Requiere tu atención" separada del resumen general | El coordinador actúa primero sobre lo urgente |
| Formularios (crear horario) | Modal por cada sesión agregada | Drawer persistente con lista en vivo de sesiones | Menos clics, se conserva el contexto |
| Tablas | Un solo formato para todo tipo de datos | Variante simple y variante densa según el contenido | Mejor legibilidad según la complejidad de cada lista |
| Colores | Un solo tono de marca (verde) para todo | Verde + azul secundario para diferenciar navegación | Mayor jerarquía visual sin depender solo del texto |
| Tipografía | Fuente del sistema operativo sin personalización | Inter como tipografía de interfaz + escala definida | Identidad visual propia, mejor legibilidad en tablas |
| Conflictos | Explicados solo con texto | Apoyo visual con mini-calendario en cada tarjeta | Comprensión más rápida del cruce de horario |
| Responsive | Tablas → tarjetas, sidebar → drawer (confirmado en el original) | Se mantiene ese comportamiento base y se define en detalle por breakpoint (ver sección 19) | Mayor previsibilidad de cómo se comporta cada componente |
| Accesibilidad | Skip-link, ARIA en modales, controles ≥44px (confirmado) | Se conserva y se agregan criterios de contraste y mensajes de error accesibles (ver sección 20) | Cumplimiento más explícito de buenas prácticas |

## 16. Mejoras UX

**Navegación.** Con el sidebar agrupado por jerarquía (sección 13) y el buscador rápido, un usuario del rol de soporte —que tiene acceso a la mayor cantidad de secciones administrativas— puede llegar a cualquier pantalla en máximo dos clics, en vez de escanear una lista plana de más de 8 ítems.

**Menos pasos.** El proceso de crear un horario completo pasa de necesitar tantas aperturas de modal como sesiones tenga el horario, a una sola vista de trabajo (drawer) donde se agregan todas las sesiones sin cerrar la ventana.

**Jerarquía.** En el dashboard del coordinador y en el panel de conflictos, la información que exige una acción inmediata (conflictos sin resolver, horarios pendientes de publicar) se muestra siempre antes que la información puramente informativa (KPIs generales, actividad histórica).

**Formularios.** Los formularios de creación (horario, usuario, sesión) mantienen la misma cantidad de campos que el original —no eliminamos ningún dato requerido—, pero se agrupan visualmente por bloques temáticos (ej. "Datos generales" / "Programación" en el formulario de horario) en vez de presentarse como una lista larga sin subdivisiones.

**Tablas.** Al diferenciar tabla simple y tabla densa (sección 14, punto 4), las listas con textos técnicos largos (auditoría, RBAC) ganan más espacio horizontal por columna, mientras que las listas simples (notificaciones) se ven más compactas y escaneables.

**Mensajes.** Mantenemos el patrón de estado + ícono + texto que ya tenía el original (es un acierto reconocido en la sección 9), extendiéndolo para que los mensajes de error de formulario aparezcan junto al campo específico, no solo como una alerta general al final del formulario.

**Estados.** Se conservan los cuatro estados que ya maneja el sistema original (cargando, vacío, error, offline) y se agrega un quinto estado explícito de "éxito" con un toast de confirmación visualmente diferenciado de las alertas informativas.

## 17. Mejoras UI

- Introducción de un color secundario (azul) para reforzar la jerarquía visual sin perder la identidad verde institucional.
- Tipografía `Inter` con una escala tipográfica definida (títulos, tablas, KPIs), en vez de depender únicamente de la fuente del sistema operativo.
- Dos variantes de tabla (simple y densa) en vez de un único formato universal.
- Estados de error visibles directamente en el campo del formulario, no solo en un mensaje general.
- Nuevo componente de breadcrumbs para las pantallas de detalle anidadas, que el original no tenía.
- Nuevo componente drawer, que sustituye a varios modales encadenados en los flujos más largos.

## 18. Flujos rediseñados

### Crear horario completo

**Mockup original (confirmado):**

`Horarios (lista) → Crear/editar horario → Modal "Agregar sesión" (se repite por cada sesión) → Modal "Confirmar publicación" → Panel de conflictos (si aplica) → Modal "Resolver conflicto"`

**Rediseño propuesto:**

`Horarios (lista) → Nuevo horario → Panel de trabajo con drawer de sesiones (se agregan todas sin cerrar la vista) → Validar (revisión automática de conflictos en la misma pantalla) → Confirmar publicación`

**Por qué es mejor:** el coordinador arma el horario completo sin perder el contexto de lo que ya lleva agregado, y la validación de conflictos ocurre dentro del mismo flujo en vez de ser un paso aparte al que hay que entrar después de publicar.

### Registrar seguimiento de un aprendiz

**Mockup original (confirmado):**

`Seguimiento de ficha (lista) → Modal "Registrar seguimiento"`

**Rediseño propuesto:**

`Seguimiento de ficha → Panel lateral con resumen de la ficha + formulario de seguimiento visible al mismo tiempo`

**Por qué es mejor:** el instructor ve simultáneamente a qué ficha corresponde el seguimiento que está registrando, reduciendo el riesgo de error por falta de contexto.

### Acceder a una sub-sección de parametrización

**Mockup original (confirmado):**

`Hub de parametrización → lista plana de 8 opciones → sub-sección elegida`

**Rediseño propuesto:**

`Hub de parametrización → 3 categorías agrupadas (Académico / Físico / Sistema) → sub-sección elegida`

**Por qué es mejor:** agrupar por afinidad temática reduce el tiempo de búsqueda frente a leer una lista de 8 opciones sin ningún criterio de organización visual entre ellas.

## 19. Diseño responsive

**CONFIRMADO en el original:** el prototipo ya define un comportamiento responsive base: por debajo de 768px, las tablas se transforman en tarjetas y la navegación lateral se convierte en un drawer.

**PROPUESTA DE REDISEÑO — detalle por breakpoint:**

### Desktop (≥1024px)

- Sidebar fijo y expandido, mostrando texto e ícono de cada sección.
- El drawer de sesiones (sección 14) se muestra como panel lateral de ancho fijo, sin tapar el horario que se está armando.
- Las tablas densas (auditoría, RBAC) muestran todas sus columnas sin necesidad de scroll horizontal.

### Tablet (768px–1023px)

- El sidebar pasa a modo colapsado (solo íconos), expandible al pasar el cursor o al tocar.
- El drawer de sesiones ocupa el 60% del ancho de la pantalla en vez de un panel fijo, para no saturar el espacio disponible.
- Las tablas densas muestran las columnas más importantes primero y permiten expandir el resto mediante un botón "Ver más campos" en cada fila.

### Mobile (<768px)

- El menú se convierte en un drawer de pantalla completa (como ya hace el original), con las secciones agrupadas jerárquicamente (sección 13).
- Las tablas se transforman en tarjetas apiladas (comportamiento ya presente en el original), pero en nuestra propuesta cada tarjeta prioriza mostrar primero el campo de estado (badge de color), para que el usuario identifique visualmente la urgencia sin tener que leer todo el contenido.
- El calendario semanal cambia automáticamente a la vista de agenda/lista (sección 14, punto 5), porque una grilla de 5 días × 4 franjas no es legible en una pantalla angosta.
- El drawer de sesiones se convierte en una vista de pantalla completa, con un botón fijo de "Guardar sesión y agregar otra" en la parte inferior, pensado para que el pulgar del usuario lo alcance con facilidad.
- Los botones de acción de los formularios (Guardar, Cancelar) quedan fijos en la parte inferior de la pantalla en vez de al final del formulario, para que estén siempre accesibles sin necesidad de hacer scroll completo.

## 20. Accesibilidad

**CONFIRMADO en el original:** skip-link para saltar al contenido, foco visible, atributos ARIA en modales y drawers, estados con ícono + texto (no solo color), y controles con un área táctil mínima de 44px.

**PROPUESTA DE REDISEÑO — criterios adicionales:**

- **Contraste:** todos los colores de la nueva paleta (sección 11) fueron seleccionados para cumplir una relación de contraste mínima de 4.5:1 entre texto y fondo, siguiendo el criterio de WCAG 2.1 AA para texto normal.
- **No depender solo del color:** se mantiene el patrón ya presente en el original de acompañar cada badge de estado con un ícono y una etiqueta de texto, y se extiende ese mismo criterio a los nuevos componentes (mini-calendario de conflictos, tarjetas de resumen).
- **Navegación por teclado:** el nuevo componente drawer debe poder abrirse, recorrerse y cerrarse completamente con teclado (Tab para moverse entre campos, Escape para cerrar, igual que ya hacían los modales del original).
- **Labels:** todos los campos de formulario deben tener una etiqueta visible asociada (no solo un placeholder), incluyendo los nuevos campos agregados dentro del drawer de sesiones.
- **Áreas táctiles:** se mantiene el mínimo de 44px ya definido en el original, extendido también a los nuevos botones de acción fija en mobile (sección 19).
- **Mensajes de error:** los mensajes de validación de formulario deben anunciarse mediante `aria-live` para que un lector de pantalla los detecte automáticamente, sin que el usuario tenga que buscar manualmente dónde está el error.
- **Uso de iconos:** todo ícono que comunique un significado (no decorativo) debe llevar un `aria-label` o texto equivalente, siguiendo el mismo criterio que ya usa el original en sus botones de ícono (por ejemplo, el botón de notificaciones).

## 21. Priorización de mejoras

### Alta prioridad

| Mejora | Prioridad | Motivo |
|---|---|---|
| Reemplazar el modal de sesión por un drawer persistente | Alta | Afecta directamente la eficiencia de la tarea más frecuente del coordinador (armar horarios) |
| Apoyo visual en el panel de conflictos | Alta | Los conflictos de horario son información crítica que debe entenderse sin ambigüedad |
| Diferenciar tabla simple vs tabla densa | Alta | Afecta la legibilidad de datos técnicos usados a diario por soporte y dirección |
| Estados de error visibles por campo en formularios | Alta | Reduce errores de captura y mejora la accesibilidad |

### Media prioridad

| Mejora | Prioridad | Motivo |
|---|---|---|
| Reorganizar el dashboard en zonas de atención/resumen | Media | Mejora la eficiencia pero no bloquea ninguna tarea si no se implementa |
| Agrupar el hub de parametrización por categorías | Media | Afecta principalmente a roles administrativos, no a todos los usuarios |
| Vista de agenda alternativa al calendario semanal | Media | Mejora la comodidad de consulta, pero el calendario semanal ya es funcional |
| Buscador rápido en el sidebar | Media | Útil sobre todo para el rol de soporte, menos crítico para los demás roles |

### Baja prioridad

| Mejora | Prioridad | Motivo |
|---|---|---|
| Nueva paleta de colores (verde + azul secundario) | Baja | Es una mejora principalmente visual, no afecta la funcionalidad |
| Tipografía Inter en vez de system-ui | Baja | Mejora la identidad visual, pero no cambia la usabilidad del sistema |
| Componente de breadcrumbs | Baja | Aporta orientación adicional, pero la navegación ya es funcional sin él |

## 22. Decisiones de diseño

### ¿Por qué cambiamos el modal de sesión por un drawer?

Porque un horario típico requiere agregar varias sesiones seguidas, y el modal original obliga a cerrar y volver a abrir la misma ventana por cada una. Un panel lateral persistente permite ver la lista de sesiones ya agregadas mientras se sigue trabajando, sin perder el hilo de la tarea.

### ¿Por qué agregamos un color secundario a la paleta?

Porque el original depende casi por completo de un solo verde para toda la interfaz, reservando el resto de colores solo para estados (éxito/error/advertencia). Eso deja a la interfaz sin una forma visual de diferenciar en qué módulo está el usuario más allá del texto. Un azul secundario, usado en la navegación, da esa referencia visual adicional sin romper la identidad institucional.

### ¿Por qué separamos tabla simple de tabla densa?

Porque no toda la información tabular tiene la misma complejidad. Una lista de notificaciones cortas no necesita el mismo espacio ni la misma densidad visual que una tabla de auditoría con nombres técnicos de eventos y servicios. Usar un solo formato para ambas obliga a elegir entre desperdiciar espacio en las listas simples o comprimir demasiado las tablas densas.

### ¿Por qué agrupamos el hub de parametrización en categorías?

Porque el original presenta 8 sub-secciones de parametrización como una lista plana, sin ningún criterio de agrupación visual entre ellas. Agruparlas por afinidad temática (Académico, Físico, Sistema) reduce el tiempo que un administrador necesita para encontrar la sección correcta, en vez de leer las 8 opciones una por una cada vez.

### ¿Por qué no eliminamos ninguna pantalla del inventario original?

Porque el objetivo del rediseño es mejorar cómo se presenta y se recorre la información, no reducir las funciones del sistema. Cada una de las 53 pantallas confirmadas cumple una función identificada en el mockup original, y eliminar alguna implicaría quitarle una capacidad al sistema sin que el instructor lo haya solicitado.

## 23. Matriz completa de rediseño

| # | Pantalla | Estado del análisis | Problema | Rediseño | Prioridad |
|---:|---|:---:|---|---|:---:|
| 1 | Login | ✅ | Ninguno relevante detectado | Se mantiene la estructura, se aplica la nueva paleta | Baja |
| 2 | Recuperar contraseña | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 3 | Nueva contraseña | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 4 | App Shell por rol | ✅ | Sidebar plano sin jerarquía | Sidebar agrupado + buscador | Media |
| 5 | Panel de notificaciones | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 6 | Estados globales | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 7 | Dashboard / Inicio | ✅ | Falta de jerarquía entre lo urgente y lo general | Zonas "Atención" / "Resumen" | Media |
| 8 | Horarios — lista | ✅ | Tabla única para todo tipo de dato | Variante de tabla según densidad | Alta |
| 9 | Detalle de horario | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 10 | Crear / editar horario | ✅ | Flujo fragmentado en modales | Panel de trabajo con drawer | Alta |
| 11 | Modal agregar/editar sesión | ✅ | Se repite por cada sesión | Reemplazado por drawer persistente | Alta |
| 12 | Modal confirmar publicación | ✅ | Ninguno relevante detectado | Se mantiene como modal de confirmación | Baja |
| 13 | Panel de conflictos | ✅ | Conflictos solo en texto | Mini-calendario visual por conflicto | Alta |
| 14 | Modal resolver conflicto | ✅ | Ninguno relevante detectado | Se mantiene, con vista del conflicto visual heredada | Media |
| 15 | Disponibilidad | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 16 | Detalle de ambiente | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 17 | Fichas — lista | ✅ | Tabla única para todo tipo de dato | Variante de tabla simple | Media |
| 18 | Detalle de ficha | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 19 | Mi horario — semana (instructor) | ✅ | Solo vista de calendario | Se agrega vista de agenda | Media |
| 20 | Detalle de sesión | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 21 | Mi disponibilidad | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 22 | Modal crear excepción | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 23 | Seguimiento de ficha | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 24 | Registrar seguimiento | ✅ | Modal sin contexto de la ficha | Panel lateral con resumen + formulario | Media |
| 25 | Mi horario — semana (aprendiz) | ✅ | Solo vista de calendario | Se agrega vista de agenda | Media |
| 26 | Notificaciones | ✅ | Tabla única para todo tipo de dato | Variante de tabla simple | Media |
| 27 | Detalle de clase | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 28 | Detalle de notificación | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 29 | Panel de indicadores | ✅ | Ninguno relevante detectado | Tipografía diferenciada para KPIs | Baja |
| 30 | Drill-down de KPI | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 31 | Usuarios — lista | ✅ | Tabla única para todo tipo de dato | Variante de tabla densa | Alta |
| 32 | Crear / editar usuario | ✅ | Ninguno relevante detectado | Formulario agrupado por bloques | Media |
| 33 | Detalle de usuario | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 34 | Modal asignar/revocar rol | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 35 | Datos de referencia | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 36 | Editar catálogo/valor/parámetro | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 37 | Documentos — lista | ✅ | Tabla única para todo tipo de dato | Variante de tabla simple | Media |
| 38 | Plantillas de documento | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 39 | Auditoría | ✅ | Tabla técnica con formato genérico | Variante de tabla densa | Alta |
| 40 | Parametrización / catálogos | ✅ | Ninguno relevante detectado | Se agrupa por categorías (hub) | Media |
| 41 | Detalle de documento + versiones | ✅ | Ninguno relevante detectado | Se agrega breadcrumb | Baja |
| 42 | Modal generar documento | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 43 | Editor / preview de plantilla | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 44 | Modal detalle de auditoría | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 45 | CRUD catálogo/valor/parámetro | ✅ | Ninguno relevante detectado | Se mantiene como modal | Baja |
| 46 | Hub de parametrización | ✅ | 8 opciones en lista plana | Agrupación en 3 categorías | Media |
| 47 | Currículo académico | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 48 | Jornadas / franjas horarias | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 49 | Tipos de ambiente e inventario | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 50 | Catálogos de monitoreo (KPI/alertas) | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 51 | Estados de actores | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 52 | Geografía institucional | ✅ | Ninguno relevante detectado | Se aplica la nueva paleta | Baja |
| 53 | RBAC — roles y permisos | ✅ | Tabla técnica con formato genérico | Variante de tabla densa | Alta |

## 24. Conclusiones

El mockup original de `code-sena/design-software-mockup` es un prototipo funcional y ordenado: cubre 53 pantallas verificables, respeta control de acceso por rol, y define estados de carga, vacío, error y desconexión de forma consistente en toda la aplicación. Ese nivel de orden fue justamente lo que nos permitió analizarlo con precisión, sin necesidad de inventar contenido que no pudiéramos comprobar.

Sin embargo, un mockup ordenado en su arquitectura de código no garantiza automáticamente la mejor experiencia posible para el usuario final. Nuestro rediseño no cambia ninguna función del sistema —las mismas 53 pantallas siguen existiendo con el mismo propósito—, pero sí replantea cómo se presenta esa información y cuántos pasos exige completar cada tarea. Los cambios de mayor impacto (reemplazar modales encadenados por paneles persistentes, diferenciar tablas según su complejidad, y dar apoyo visual a los conflictos de horario) responden directamente a fricciones que identificamos al recorrer los flujos reales del coordinador, el instructor y el rol de soporte, que son quienes más interactúan con el sistema día a día.

Como equipo, este ejercicio nos permitió entender que rediseñar no es solamente "cambiar colores": implica priorizar qué información necesita el usuario primero, cuántos clics le cuesta completar su tarea más frecuente, y si el sistema le da suficiente contexto para tomar decisiones sin perderse entre pantallas. Documentamos cada decisión con su justificación precisamente para que quede claro que este rediseño se construyó con criterio de diseño, y no como una simple variación estética del prototipo original.
