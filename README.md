# PRUEBA TÉCNICA PARA CANDIDATO DESARROLLADOR FLUTTER

**Empresa:** Ualabee

**Posición:** Desarrollador Flutter Semi Senior

**Duración:** Máximo 2 horas

[**PRUEBA TÉCNICA PARA CANDIDATO DESARROLLADOR FLUTTER 1**](#_atj0my1p88dz)

[OBJETIVO 1](#_3i7ou1i4jxqs)

[DEFINICIONES GENERALES 2](#_5l2djxj3zxs2)

[1\. Consumo de API REST 2](#_wfwzifn1xzf8)

[2\. Replicación de Prototipo de Interfaz 2](#_ntt23c1ecbd4)

[3\. Mapas, Marcadores, Polilíneas y Ubicación del Usuario 2](#_5x1xg36cp4ft)

[4\. Compatibilidad con Web y Android 2](#_d3h0k2n7wdf1)

[5\. Calidad del Código 2](#_fvmcv5zbflz2)

[DESCRIPCIÓN DE LA TAREA 3](#_dij42yvg299x)

[1\. Pantalla de Listado de Líneas 3](#_vs2u7x7bw0nb)

[2\. Pantalla de Detalle de Línea 4](#_4fr72j41xtxy)

[INSTRUCCIONES PARA LA ENTREGA 5](#_2c7rv6ewiybp)

[CRITERIOS DE EVALUACIÓN 5](#_q9vpgmjfs4vj)

[CÓMO EMPEZAR 6](#_gy7yhiqp8n4k)

[¡BUENA SUERTE! 6](#_g8onnnsd5e75)

##

## OBJETIVO

Desarrollar una aplicación Flutter que consuma la API de Ualabee, replicando un prototipo de interfaz proporcionado, y que demuestre habilidades en el uso de mapas, marcadores, polilíneas y la ubicación del usuario (GPS). Se evaluará la capacidad para consumir APIs REST, la fidelidad al diseño, el manejo de mapas y geolocalización, y la calidad del código en Dart y Flutter. La aplicación debe ser compatible tanto con web como con Android.

## DEFINICIONES GENERALES

#### Consumo de API REST

- **Obtener Datos:** Utiliza la API de Ualabee para obtener información relevante sobre rutas de transporte, paradas u otro recurso especificado.
- **Autenticación:** Utiliza el token de autenticación proporcionado que debes incluir en los encabezados de tus solicitudes.
- **Token de autenticación con el servidor:**
  - Para utilizarlo, agregar el siguiente header en cada solicitud al servidor:
  - Authorization: Bearer &lt;Token&gt;

#### Replicación de Prototipo de Interfaz

- **Diseño Proporcionado:** Se adjunta un prototipo de interfaz (en formato PNG o enlace a Figma) que debes replicar con la mayor fidelidad posible.
- **Widgets en Flutter:** Utiliza widgets de Flutter para construir la interfaz, siguiendo patrones de diseño y buenas prácticas.

#### Mapas, Marcadores, Polilíneas y Ubicación del Usuario

- **Integración de Mapas:** Incluye un mapa interactivo en la aplicación utilizando Google Maps con el _GOOGLE_MAPS_API_KEY_ proporcionado.

#### Compatibilidad con Web y Android

- **Despliegue:** Asegúrate de que la aplicación funciona correctamente tanto en web como en dispositivos Android.
- **Dependencias:** Puedes usar paquetes de terceros, pero mantenlos al mínimo necesario y asegúrate de que sean compatibles con web y Android.

#### Calidad del Código

- **Simplicidad y Limpieza:** Escribe código limpio y bien estructurado, aplicando principios de programación y patrones de diseño cuando sea apropiado.
- **Documentación:** Añade comentarios y documentación que faciliten la comprensión del código.
- **Manejo de Errores:** Implementa manejo de errores para solicitudes a la API y muestra mensajes adecuados al usuario en caso de fallas.
- **Flutter & Dart:** Utiliza las versiones estables más recientes compatibles con tu entorno de desarrollo.
- **Responsividad:** La interfaz debe ser responsive y adaptarse a diferentes tamaños de pantalla.

##

## DESCRIPCIÓN DE LA TAREA

### Pantalla de **Listado de Líneas**

**Desarrollo basado en Wireframe**:

En lugar de proporcionarte el diseño final de una de las pantallas, te entregamos solo un wireframe básico. Esta es una oportunidad para mostrar tu habilidad de transformar un diseño abstracto en una interfaz pulida y funcional.

**Objetivo:**

Utiliza el wireframe como guía para **mostrar un listado de líneas con su respectivo estado**. Tienes libertad para interpretar el diseño, pero debes seguir las mejores prácticas de UX y asegurarte de que la pantalla se integre bien con el resto de la aplicación.

**Criterios adicionales:**

- **Creatividad:** Cómo interpretas el wireframe y traduces el diseño en una interfaz amigable.
- **Fidelidad al Wireframe:** Asegúrate de no desviarte del esquema principal, pero también agrega detalles visuales que creas relevantes.
- **Mejora de UX:** Aplicar principios de diseño que mejoren la experiencia del usuario con interacciones, transiciones o ajustes de diseño.

![wireframe (1)](https://github.com/user-attachments/assets/0b56db9f-19e7-4a67-a0cb-be89d20350fa)

**Endpoint para el listado de líneas:** <https://ualabee.dev/api/v2/routes/getAll>

![Screenshot from 2024-10-08 11-45-55](https://github.com/user-attachments/assets/58d70a79-a1bf-4d55-82e8-bb6ea3b29177)

**Ejemplo de respuesta:** <https://pastebin.com/YtUFJhJS>

Al seleccionar una de esas líneas se debe mostrar el detalle de la misma. Recordá utilizar como guía el wireframe proporcionado.

### Pantalla de **Detalle de Línea**

**Objetivo:**

Basándose en el Mockup de Figma, desarrollar la pantalla que muestre el detalle del primer recorrido de la línea seleccionada. No es necesario mostrar todos los recorridos para la prueba.

1. Debe mostrar el recorrido en el mapa y sus paradas.

- **Compatibilidad:** Utiliza paquetes de mapas y geolocalización que funcionen tanto en web como en Android.
- **Interactividad:** El mapa debe permitir interacción básica, como zoom y desplazamiento.
- **Marcadores:** Muestra marcadores en el mapa basados en los datos obtenidos de la API.
- **Polilíneas:** Traza rutas o caminos en el mapa utilizando polilíneas, según la información proporcionada por la API.

1. Al ingresar a esta pantalla también deberás centrar la cámara en la ubicación del usuario.

- **Permisos:** Gestiona adecuadamente los permisos necesarios para utilizar mapas y acceder a la ubicación del usuario.

![test](https://github.com/user-attachments/assets/ad83023e-93da-4ced-af03-17b6c8defa1e)

**Endpoint para el detalle de línea:**

- **URL:** <https://ualabee.dev/api/v2/routes/getTrips>

![Screenshot from 2024-10-08 11-46-43](https://github.com/user-attachments/assets/3e96342b-36fd-4d77-8695-f26fd74ae09b)

- **Ejemplo de respuesta:** <https://pastebin.com/E66ykTwu>

Este retorna un listado de trips, tu tarea va a ser mostrar el detalle de sólo el primero de ellos.

## INSTRUCCIONES PARA LA ENTREGA

- **Repositorio Git:** Utiliza el repositorio que te hemos proporcionado. Crea una rama con tu nombre y apellido y realiza todos los commits que sean necesarios durante el desarrollo del proyecto.
- **Entrega final:** Al finalizar el examen, asegúrate de enviar (push) todos tus cambios al repositorio.
- **Archivo README:** Incluye un archivo README con:
  - En caso de ser necesario adjuntar instrucciones sobre cómo ejecutar la aplicación en web y Android.
  - Notas sobre tu implementación y cualquier suposición realizada.
  - Notas Adicionales: Si no pudiste completar alguna parte, explica brevemente los motivos y cómo lo abordarías con más tiempo.

## CRITERIOS GENERALES DE EVALUACIÓN

- **Consumo de API REST:** Correcta implementación de solicitudes a la API y manejo de respuestas.
- **Replicación del Diseño:** Nivel de fidelidad al prototipo proporcionado y atención a detalles.
- **Implementación de Mapas y Ubicación:**
  - Uso efectivo de mapas, marcadores y polilíneas según lo requerido.
  - Correcta obtención y manejo de la ubicación del usuario.
  - Gestión adecuada de permisos de ubicación en ambas plataformas.
- **Compatibilidad Multiplataforma:**
  - La aplicación funciona correctamente tanto en web como en Android.
  - Manejo de diferencias entre plataformas si las hubiera.
- **Calidad del Código:**
  - **Organización y Estructura:** Código bien organizado y estructurado.
  - **Buenas Prácticas:** Aplicación de principios y patrones de diseño adecuados.
  - **Legibilidad:** Código claro y fácil de entender.
  - **Eficiencia y Optimización:** Uso eficiente de recursos y optimización donde sea posible.
- **Creatividad y Valor Añadido:** Cualquier funcionalidad o mejora adicional que aporte valor a la aplicación.

## CÓMO EMPEZAR

1. **Preparación:**

- Configura un nuevo proyecto de Flutter con soporte para web y Android.
- Asegúrate de tener instalados los SDKs y herramientas necesarias para ambas plataformas.

1. **Revisión del Prototipo:**

- Analiza detenidamente el diseño proporcionado y planifica cómo lo implementarás.

1. **Configuración de la API:**

- Añade el token de autenticación a tus encabezados de solicitud.
- Prueba las llamadas a la API para familiarizarte con las respuestas.

1. **Desarrollo:**

- **Interfaz de Usuario:** Comienza por estructurar tu aplicación y crear las pantallas principales, replicando el diseño.
- **Consumo de API:** Integra el consumo de la API y verifica que estás obteniendo los datos correctos.
- **Mapas y Ubicación:** Implementa el mapa asegurándote de su compatibilidad multiplataforma.
  - Gestiona los permisos de ubicación y obtén la ubicación actual del usuario.
  - Añade marcadores y polilíneas según los datos obtenidos.

1. **Pruebas:**

- Ejecuta la aplicación en un navegador web y en un dispositivo o emulador Android para verificar que todo funcione correctamente en ambas plataformas.
- Asegúrate de manejar correctamente los posibles errores o excepciones.

1. **Finalización:**

- Revisa tu código y realiza mejoras o refactorizaciones si es necesario.
- Completa el archivo README con las instrucciones y notas requeridas en caso de ser necesario.
- Publicar el código (commit y push) en este mismo repositorio GIT.

## ¡BUENA SUERTE

Estamos entusiasmados por ver tu trabajo y discutirlo contigo en la siguiente etapa del proceso de selección. ¡Mucho éxito!
