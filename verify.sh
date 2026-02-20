#!/bin/bash
# Script rápido de verificación de implementación

echo "🔍 Verificando implementación de URLs separadas..."
echo ""

# Verificar archivos
echo "📁 Archivos requeridos:"
for file in client.html admin.html _redirects; do
  if [ -f "$file" ]; then
    echo "  ✅ $file"
  else
    echo "  ❌ FALTA: $file"
  fi
done

echo ""
echo "📋 Documentación:"
for file in SETUP.md DEPLOYMENT.md README_URLS.md; do
  if [ -f "$file" ]; then
    echo "  ✅ $file"
  else
    echo "  ⚠️ FALTA: $file"
  fi
done

echo ""
echo "🔐 Verificando configuración..."

# Verificar que client.html oculta staff
if grep -q "CLIENT VERSION" client.html; then
  echo "  ✅ client.html tiene marcador CLIENT VERSION"
else
  echo "  ❌ client.html no tiene marcador"
fi

# Verificar que admin.html oculta cliente
if grep -q "ADMIN VERSION" admin.html; then
  echo "  ✅ admin.html tiene marcador ADMIN VERSION"
else
  echo "  ❌ admin.html no tiene marcador"
fi

# Verificar proceedApp en client.html
if grep -q "checkClientRegistration()" client.html; then
  echo "  ✅ client.html llama a checkClientRegistration()"
else
  echo "  ❌ client.html no llama a checkClientRegistration()"
fi

# Verificar admin-login-screen en admin.html
if grep -q "admin-login-screen" admin.html; then
  echo "  ✅ admin.html tiene admin-login-screen"
else
  echo "  ❌ admin.html no tiene admin-login-screen"
fi

echo ""
echo "🚀 RESUMEN:"
echo "  • client.html: Para https://crowdplay.netlify.app"
echo "  • admin.html: Para https://crowdplay-admin.netlify.app"
echo "  • Documentación: SETUP.md, DEPLOYMENT.md, README_URLS.md"
echo ""
echo "✨ ¡Listo para deploy!"
