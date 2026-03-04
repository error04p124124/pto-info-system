# Инструкция по исправлению дизайна на Railway

## Что было сделано:

1. **Добавлен Whitenoise middleware** в настройки Django для обслуживания статических файлов в production
2. **Создан Procfile** для автоматического запуска миграций и сбора статики
3. ** Создан railway.toml** с настройками деплоя

## Файлы изменены:

- `pto_info_system/settings.py` - добавлен whitenoise middleware и настройка хранилища статики
- `pto_info_system/urls.py` - отключен debug_toolbar
- `Procfile` - команды для Railway
- `railway.toml` - конфигурация Railway

## Что нужно сделать:

### 1. Отправить изменения на GitHub

Откройте PowerShell в папке проекта и выполните:

```powershell
git push origin main
```

Если появится запрос авторизации, введите ваш токен доступа GitHub.

### 2. Дождаться автоматического деплоя на Railway

Railway автоматически подхватит изменения из GitHub и запустит новый деплой.

Или вы можете вручную:
- Зайти на https://railway.app
- Открыть проект `pto-info-system`
- Нажать "Deploy" → "Redeploy"

### 3. Проверить сайт

После завершения деплоя откройте:
https://pto-info-system-production.up.railway.app/

Дизайн должен загрузиться корректно!

## Что было исправлено:

**Проблема:** В production Django не обслуживает статические файлы автоматически (как в DEBUG=True режиме). Нужен специальный middleware.

**Решение:** 
- Добавили `whitenoise` middleware сразу после `SecurityMiddleware`
- Настроили `CompressedManifestStaticFilesStorage` для сжатия и кеширования статики
- Добавили команду `collectstatic` в процесс деплоя

---

*Все изменения закоммичены локально (коммит bbd247f)*
*Осталось только выполнить `git push origin main`*
