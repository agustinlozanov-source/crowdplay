# CrowdPlay - URLs Separadas ✅

## 📍 Estructura Final

```
crowdplay.netlify.app
    ↓
  client.html  ← Cliente: Pide datos → App de usuario
  

crowdplay-admin.netlify.app
    ↓
  admin.html   ← Admin: Login → Panel de staff
```

---

## 🎯 Flujos de Usuario

### 👥 CLIENTE (crowdplay.netlify.app)
```
┌─────────────────────────────────────────┐
│ 1. Abre crowdplay.netlify.app           │
│ 2. Pantalla de carga                    │
│ 3. Pide: Nombre, Apellido, WhatsApp     │
│ 4. Entra a APP:                         │
│    • Ver canciones en cola              │
│    • Buscar canciones                   │
│    • Votar canciones                    │
│    • Llamar mesero                      │
│    • Pedir cuenta                       │
│    • Karaoke                            │
└─────────────────────────────────────────┘
```

### 👨‍💼 ADMIN/STAFF (crowdplay-admin.netlify.app)
```
┌─────────────────────────────────────────┐
│ 1. Abre crowdplay-admin.netlify.app     │
│ 2. Pantalla de carga                    │
│ 3. Login: Email + Contraseña            │
│ 4. Entra según rol:                     │
│    DJ:        Dashboard, Reproductor    │
│    Mesero:    Solicitudes, Historial    │
│    Analytics: Estadísticas              │
└─────────────────────────────────────────┘
```

---

## 📁 Archivos del Proyecto

```
/Users/agustinlozano/Desktop/CrowdPlay/
│
├─ 📄 index.html              (Original - Menú de roles)
├─ 📄 client.html             (NUEVO - App Cliente)
├─ 📄 admin.html              (NUEVO - Panel Admin)
│
├─ 📋 SETUP.md                (Instrucciones de configuración)
├─ 📋 DEPLOYMENT.md           (Instrucciones de deploy)
├─ 📋 _redirects              (Configuración Netlify)
│
├─ 🖼️ logo.png
├─ 📦 .git/
└─ ...otros archivos
```

---

## ⚡ Cambios Realizados

### ✅ `client.html`
- Oculta: Menu de roles, Panel de admin, Pantalla TV
- Muestra: Solo formulario de datos → App cliente
- Función clave: `checkClientRegistration()` en proceedApp()

### ✅ `admin.html`
- Oculta: Menu general, Vista de cliente, Registro
- Muestra: Solo login de staff → Panel admin
- Función clave: `admin-login-screen` siempre visible

### ✅ `_redirects` (Netlify)
```
/         /client.html   200
/admin/*  /admin.html    200
```

---

## 🚀 Próximos Pasos

### 1. Subir a Netlify
```bash
git add .
git commit -m "feat: URLs separadas cliente y admin"
git push
```

### 2. Configurar Netlify
- [ ] Crear sitio 1: client.html → crowdplay.netlify.app
- [ ] Crear sitio 2: admin.html → crowdplay-admin.netlify.app
- [ ] Verificar `_redirects` en ambos

### 3. Probar
- [ ] Cliente: crowdplay.netlify.app → ¿Pide datos?
- [ ] Admin: crowdplay-admin.netlify.app → ¿Pide login?
- [ ] Funcionalidades: ¿Todo funciona?

### 4. Dominio Custom (opcional)
- [ ] Cliente: tudominio.com
- [ ] Admin: admin.tudominio.com

---

## ✨ Características Implementadas

| Característica | Cliente | Admin | Menu |
|---|---|---|---|
| Registro datos usuario | ✅ | ❌ | ❌ |
| Vista de canciones | ✅ | ❌ | ❌ |
| Login de staff | ❌ | ✅ | ❌ |
| Panel DJ | ❌ | ✅ | ❌ |
| Panel Mesero | ❌ | ✅ | ❌ |
| Menú de roles | ❌ | ❌ | ✅ |
| Formulario datos | ✅ | ❌ | ✅ |

---

## 🔐 Seguridad

- ✅ Firebase anónimo para clientes
- ✅ Email/Password para staff
- ✅ Autenticación separada
- ✅ Firestore rules (verificar en Firebase console)

---

## 📞 Resumen Rápido

```
¿Qué es client.html?
→ La app de cliente. Solo pide datos y entra directamente.

¿Qué es admin.html?
→ El panel de admin/staff. Pide login y muestra panel según rol.

¿Cuál es la URL del cliente?
→ crowdplay.netlify.app

¿Cuál es la URL del admin?
→ crowdplay-admin.netlify.app

¿Puedo tener ambas en el mismo dominio?
→ Sí, con _redirects: /admin/* → /admin.html

¿Se pierden datos al tener dos versiones?
→ No. Firebase es compartido y sincroniza todo en tiempo real.
```

---

## ✅ Estado Actual

- ✅ `client.html` creado y configurado
- ✅ `admin.html` creado y configurado
- ✅ `_redirects` creado para Netlify
- ✅ Documentación lista (SETUP.md, DEPLOYMENT.md)
- ✅ Listo para deploy

**¡Puedes hacer deploy cuando quieras!** 🚀
