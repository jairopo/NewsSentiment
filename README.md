# 📰 NewsSentiment

**NewsSentiment** es una aplicación móvil desarrollada con **Flutter** que permite explorar las últimas noticias de los principales periódicos en inglés, analizadas y clasificadas por su **sentimiento** (positivo, neutral o negativo). Utilizando inteligencia artificial avanzada, esta app ofrece un análisis rápido y detallado de los titulares más relevantes.

---

## 🚀 Características

- Consulta las últimas noticias de:
  - **BBC**
  - **NY Times**
  - **CNN**
- Clasificación de noticias por sentimiento: **Positivo**, **Neutral**, **Negativo**.
- Precisión del análisis de sentimientos basada en el modelo **FinBERT-tone**.
- Enlaces directos para leer las noticias completas.
- Interfaz intuitiva y moderna desarrollada con Flutter.

---

## 🛠️ Tecnologías utilizadas

### **Frontend**
- **Flutter**: Framework para el desarrollo multiplataforma de la aplicación móvil.
- **Dart**: Lenguaje de programación para el desarrollo en Flutter.

### **Backend**
- **FastAPI**: API utilizada para realizar el análisis de sentimientos.
- **FinBERT-tone**: Modelo de procesamiento del lenguaje natural para el análisis de sentimientos.
- **Scrapping**: Sistema para obtener los titulares de las noticias en tiempo real.

---

## 📱 Estructura de la aplicación

1. **Home Screen**:
   - Navegación entre noticias de diferentes periódicos.
   - Visualización del número total de noticias disponibles.
2. **Categorías de sentimiento**:
   - Clasificación en pestañas: Positivo, Neutral y Negativo.
3. **Detalles de noticias**:
   - Vista de los titulares con su porcentaje de precisión.
   - Icono para abrir el enlace directo al artículo.
4. **Drawer**:
   - Logo de la aplicación
   - Descripción de la misma
   - Desarrolladores del proyecto

---

## 📥 Instalación de la app

### **Requisitos previos**
- Contar con un dispositivo android (móvil/tablet)
- Acceso a internet para consultar la API.
- Mantener la API conectada.

## **Descarga del APK**
Para utilizar la aplicación debemos descargar el instalador, ubicado en la carpeta [APK](APK) que se encuentra en este repositorio. 
Es posible que debido al antivirus del dispositivo salga un mensaje de advertencia. Debe saber que la aplicación no tiene ningún tipo de software malicioso, 
por lo que puede confiar totalmente en ella. 

Una vez descargada, podrá hacer pleno uso de la misma, siempre que se mantenga la API conectada.

---

## 👨‍💻 Equipo de desarrollo
- David Moreno Cerezo:
  - Desarrollador de la API y responsable de la integración del sistema de scraping de noticias.
- Jairo Andrades Bueno:
  - Desarrollador de la aplicación móvil y encargado de la implementación en Flutter.
- Ambos:
  - Diseño colaborativo de la aplicación y desarrollo conjunto del sistema de scraping.

--- 

¡Esperamos que disfrutes utilizando NewsSentiment! Si tienes alguna duda o sugerencia, no dudes en contactarnos. 😊
