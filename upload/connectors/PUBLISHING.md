# Публикация коннекторов

Коннекторы живут в этом каталоге как в источнике правды и публикуются отдельными репозиториями GitHub:

| Каталог | Репозиторий | Архив |
|---|---|---|
| `opencart-2.3/` | `Anton-Barinov/tropatt-opencart-2.3` | `dist/tropatt-opencart-2.3.ocmod.zip` |
| `opencart-3.0/` | `Anton-Barinov/tropatt-opencart-3.0` | `dist/tropatt-opencart-3.ocmod.zip` |
| `opencart-4.0/` | `Anton-Barinov/tropatt-opencart-4.0` | `dist/tropatt-opencart-4.ocmod.zip` |
| `woocommerce/` | `Anton-Barinov/tropatt-woocommerce` | `dist/tropatt-woocommerce.zip` |

## Сборка

```bash
bash build.sh          # все четыре архива в connectors/dist/
```

Архивы не коммитятся: воспроизводимая сборка — `build.sh` в каждом каталоге и в этом каталоге целиком.

## Синхронизация репозитория коннектора

Репозиторий коннектора содержит те же файлы, что и соответствующий каталог, плюс `LICENSE`, `build.sh`
и `.github/workflows/lint.yml`:

```bash
rsync -a --delete --exclude 'build.sh' --exclude '.github' \
  connectors/opencart-3.0/ /tmp/tropatt-opencart-3.0/
```

После изменений: `bash build.sh` → smoke-проверка (`tests/ecommerce_gateway_connectors_test.php` в
тестовом наборе CRM) → коммит и тег `v<версия>` в репозитории коннектора → релиз с архивом в ассетах.
