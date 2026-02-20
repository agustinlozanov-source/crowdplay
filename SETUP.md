# 🚀 CrowdPlay - Configuración de URLs

## ✅ Lo que hemos hecho

Se ha separado la aplicación en **3 versiones HTML** con flujos independientes:

### 1️⃣ **client.html** - Vista de Cliente
- **URL:** `crowdplay.netlify.app`
- **Acceso:** Directo a formulario de datos
- **Usuarios:** Clientes que piden canciones
- **Flujo:**
  ```
  Carga → Sincronización → Registro (nombre, apellido, WhatsApp) → App Cliente
  ```
- **Características:**
  - ✅ Ver cola de canciones
  - ✅ Pedir canciones
  - ✅ Votar canciones
  - ✅ Llamar mesero
  - ✅ Pedir la cuenta
  - ❌ No ve menú de roles
  - ❌ No ve panel de admin

### 2️⃣ **admin.html** - Panel de Administración
- **URL:** `crowdplay-admin.netlify.app` (o subdomain que configures)
- **Acceso:** Login de staff (email + contraseña)
- **Usuarios:** DJ, Meseros, Analytics
- **Flujo:**
  ```
  Carga → Login de Staff → Panel según rol
  ```
- **Características:**
  - ✅ DJ: Reproductor, Queue, Sampler, Dashboard
  - ✅ Mesero: Gestión de solicitudes
  - ✅ Analytics: Estadísticas
  - ❌ No ve vista de cliente
  - ❌ No ve menú general

### 3️⃣ **index.html** - Menú de Roles (Fallback)
- **URL:** `crowdplay.netlify.app/index.html`
- **Acceso:** Menú de selección de roles
- **Usuarios:** Acceso general/debug
- **Flujo:**
  ```
  Carga → Selecciona rol (Cliente, Mesero, DJ, Analytics)
  ```

---

## 📋 Requisitos de Deploymen

### Opción A: URLs separadas (Recomendado)
```
📍 Cliente: crowdplay.netlify.app → client.html
📍 Admin:  crowdplay-admin.netlify.app → admin.html
```

**Pasos:**
1. Crea 2 sitios en Netlify desde el mismo repo
2. **Sitio 1 (Cliente):**
   - Crea `_redirects`:
     ```
     /   /client.html   200
     ```
3. **Sitio 2 (Admin):**
   - Crea `_redirects`:
     ```
     /   /admin.html   200
     ```

### Opción B: Rutas en el mismo dominio
```
📍 Cliente: crowdplay.netlify.app → /client.html
📍 Admin:  crowdplay.netlify.app/admin → /admin.html
```

**Archivo `_redirects`:**
```
/         /client.html   200
/admin/*  /admin.html    200
```

---

## 🔑 Cambios técnicos

### `client.html`
```javascript
// Oculta interfaces innecesarias
#staff-app { display: none !important; }
#admin-login-screen { display: none !important; }
#menu-screen { display: none !important; }

// Va directo a registro
proceedApp() {
  checkClientRegistration(); // ← Muestra formulario de datos
}
```

### `admin.html`
```javascript
// Oculta interfaces innecesarias
#client-app { display: none !important; }
#menu-screen { display: none !important; }
#registration-screen { display: none !important; }

// Va directo a login
proceedApp() {
  mostrar admin-login-screen // ← Login de staff
}
```

---

## 📱 Experiencia de Usuario

### Cliente accede a crowdplay.netlify.app
```
1. Pantalla de carga (3-5 segundos)
2. Pide nombre, apellido, WhatsApp
3. ¡Listo! Entra directamente a la app
4. Ve: Cola, Buscar canciones, Servicios
```

### Admin accede a crowdplay-admin.netlify.app
```
1. Pantalla de carga (3-5 segundos)
2. Pide email y contraseña
3. ¡Listo! Entra al panel según su rol
4. Ve: Dashboard, Reproductor, Solicitudes, etc.
```

---

## 🔐 Configuración Firebase requerida

Las credenciales están en ambos archivos:
```javascript
const manualFirebaseConfig = {
    apiKey: "AIzaSyAia_yRHvYg3gGQ60VwPRwcRm3B0aja4cw",
    authDomain: "rocola-crowdplay2.firebaseapp.com",
    projectId: "rocola-crowdplay2",
    storageBucket: "rocola-crowdplay2.firebasestorage.app",
    messagingSenderId: "519952213703",
    appId: "1:519952213703:web:0e0ecb8cb3fc81064240e2"
};
```

**Asegúrate de que Firebase Auth tenga:**
- ✅ Autenticación anónima habilitada (para clientes)
- ✅ Email/Contraseña habilitada (para staff)
- ✅ Reglas Firestore correctas

---

## 🚀 Cómo hacer Deploy

### 1. Git Push (si usas Git)
```bash
git add .
git commit -m "Implementar URLs separadas para cliente y admin"
git push origin main
```

### 2. Netlify Auto-Deploy
- Ve a https://netlify.com
- Conecta el repositorio
- Crea 2 sitios:
  - **Sitio 1:** Branch `main`, outputdir `/`, redirect a `client.html`
  - **Sitio 2:** Branch `main`, outputdir `/`, redirect a `admin.html`

### 3. Configurar dominios
- Sitio 1 → `crowdplay.netlify.app` (o tu dominio)
- Sitio 2 → `crowdplay-admin.netlify.app` (o tu dominio)

---

## ✨ Lo que NO cambia

- ✅ Mismo Firebase (rocola-crowdplay2)
- ✅ Mismos datos en tiempo real
- ✅ Mismo JavaScript core
- ✅ Mismas características
- ✅ Compatibilidad total

---

## 🆘 Troubleshooting

### "No veo el formulario de registro en cliente"
→ Asegúrate que `client.html` tenga:
```javascript
proceedApp() {
  checkClientRegistration(); // Esta línea es clave
}
```

### "No me deja loguear en admin"
→ Verifica que Firebase Auth tenga Email/Password activado

### "Las URLs no redirigen correctamente"
→ Verifica que `_redirects` esté en la raíz del proyecto

### "Veo ambas interfaces a la vez"
→ Los estilos CSS de ocultación pueden no estar aplicándose
→ Abre DevTools (F12) y verifica `#client-app { display: none !important; }`

---

## 📞 Soporte

Para cualquier duda:
1. Revisa este documento
2. Revisa `DEPLOYMENT.md`
3. Verifica la consola del navegador (F12)
4. Revisa las reglas de Firestore

¡Listo para producción! 🎉
