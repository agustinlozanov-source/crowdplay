# CrowdPlay - Guía de Deploymen

## Estructura de URLs

El proyecto CrowdPlay ahora está separado en dos versiones:

### 1. **Cliente** → crowdplay.netlify.app
- **Archivo:** `client.html`
- **Comportamiento:** Va directamente a pedir datos del usuario (nombre, apellido, WhatsApp)
- **Flujo:**
  1. Muestra pantalla de carga
  2. Va directo a formulario de registro/datos
  3. Accede a la vista de cliente (cola de canciones, pedir canciones, servicios)
- **NO muestra:**
  - Menú de selección de roles (Mesero, DJ, Analytics)
  - Panel de administración
  - Pantalla de TV

### 2. **Admin** → crowdplay-admin.netlify.app (o la URL que configures)
- **Archivo:** `admin.html`
- **Comportamiento:** Va directo al login de administrador
- **Flujo:**
  1. Muestra pantalla de carga
  2. Va directo a login de staff (email + contraseña)
  3. Accede al panel de DJ/Mesero/Analytics según el rol
- **NO muestra:**
  - Menú de selección de roles general
  - Vista de cliente
  - Formulario de registro de clientes

### 3. **Menú Principal** → index.html (opcional)
- **Archivo:** `index.html`
- **Comportamiento:** Muestra el menú de selección de roles (cliente, mesero, DJ, analytics)
- **Uso:** Acceso de debug o para que escojan su rol manualmente

## Configuración en Netlify

### Para client.html:
1. Ve a **Netlify → Site settings → Build & deploy**
2. En **Publish directory**, asegúrate de que el proyecto esté en la raíz
3. Crea un redirect para que crowdplay.netlify.app sirva client.html:
   - En la raíz, crea un archivo `_redirects` con:
     ```
     /   /client.html   200
     ```

O más específicamente, si solo quieres que `/` sirva client.html:
```
/  /client.html  200
```

### Para admin.html:
1. Opción A: Usa un dominio separado (crowdplay-admin.netlify.app)
   - Crea otro sitio en Netlify con el mismo repositorio
   - Configura redirección: `/  /admin.html  200`

2. Opción B: Usa una subruta en el mismo dominio
   - Crea un archivo `_redirects` que responda a `/admin`:
   ```
   /   /client.html   200
   /admin   /admin.html   200
   ```

## Archivos incluidos

```
/Users/agustinlozano/Desktop/CrowdPlay/
├── index.html          # Menú de roles (acceso general)
├── client.html         # Vista de cliente → crowdplay.netlify.app
├── admin.html          # Panel de admin → crowdplay-admin.netlify.app
├── logo.png            # Logo de CrowdPlay
├── DEPLOYMENT.md       # Este archivo
└── .git/              # Control de versión
```

## Flujos de Usuario

### Cliente (crowdplay.netlify.app)
```
1. Carga el sitio
2. Loading screen
3. Solicita: Nombre, Apellido, WhatsApp
4. Entra a vista de cliente:
   - Cola de canciones
   - Pedir canciones (búsqueda en YouTube)
   - Servicios (Llamar mesero, Pedir cuenta, Karaoke)
```

### Admin (crowdplay-admin.netlify.app)
```
1. Carga el sitio
2. Loading screen
3. Login con email + contraseña
4. Selecciona rol según credenciales:
   - DJ: Dashboard, Reproductor, Cola, Sampler, TV
   - Mesero: Solicitudes, Historial
   - Analytics: Métricas y estadísticas
```

## Cambios clave realizados

1. **client.html**
   - Oculta menú de roles
   - Oculta panel de admin
   - Llama `checkClientRegistration()` en `proceedApp()`
   - Estilos CSS que ocultan `#staff-app`, `#admin-login-screen`, `#menu-screen`, `#display-screen`

2. **admin.html**
   - Oculta vista de cliente
   - Oculta menú de selección de roles
   - Muestra login de admin siempre
   - Estilos CSS que ocultan `#client-app`, `#menu-screen`, `#registration-screen`

3. **index.html**
   - Sin cambios principales
   - Mantiene el menú de selección de roles como fallback

## Configuración Firebase

Ambas versiones usan la misma configuración de Firebase. Asegúrate de que:

1. Las reglas de Firestore permitan:
   - Lectura/escritura anónima para clientes
   - Lectura/escritura autenticada para staff

2. La autenticación esté configurada para:
   - Anónima (clientes)
   - Email/Contraseña (staff)

## Próximos pasos

1. Configurar DNS/dominios en Netlify
2. Actualizar las URLs en los códigos QR si existen
3. Distribuir `crowdplay.netlify.app` a clientes
4. Distribuir `crowdplay-admin.netlify.app` a staff
5. Hacer deploy cuando todo esté listo
