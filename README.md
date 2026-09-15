# E-Commerce Gateway

Universal store-to-CRM gateway: orders, one-click purchases, callbacks, feedback forms, leads and stock
synchronisation from any CMS or storefront, with HMAC-SHA256 transport security, hardware idempotency and
reactive status sync back to the store.

A module for the [TropaTT](https://github.com/Anton-Barinov/TropaTT) self-hosted CRM and work platform.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![PHP](https://img.shields.io/badge/PHP-8.1%2B-777bb4.svg)](https://www.php.net/)
[![Module version](https://img.shields.io/badge/module-1.1.0-green.svg)](upload/manifest.json)

**Languages:** [English](#english) · [Русский](#русский) · [中文](#中文)

## English

### About

The gateway is the receiving side of storefront integrations. A store signs every request with its own
secret; the CRM verifies the signature, deduplicates the packet and turns it into an intake item and/or a
task, then pushes status changes back to the store through a transactional outbox with retries and a dead
letter queue.

- **Signed transport** — HMAC-SHA256, timestamp tolerance, nonce replay protection, IP whitelist, per-store
  rate limit, anti-spam.
- **Ingestion** — `orders`, `quick-orders`, `callbacks`, `feedback`, `forms` and **`stock`**
  (`POST /v1/stock`, a batch of up to 500 lines with per-SKU idempotency and a sync journal).
- **Idempotency** — `{store_key}:{type}:{external_id}` (or an explicit header), with response snapshots
  so a retry returns exactly the same entities.
- **Reactive status sync** — transactional outbox, exponential backoff, dead letter queue, replay,
  reconciliation against the store and a status mapping per store.
- **Store registry** — connection wizard, secret rotation with a grace period, status mapping UI, sync log
  with a JSON inspector, ping test.

### Module info

| Field | Value |
|---|---|
| Module | `crm.ecommerce-gateway` |
| Version | `1.1.0` |
| Category | integration |
| Core | `>=1.0.0` |
| Required permissions | `task.manage`, `project.manage` |

### Installation

1. Download the module package or install it from the TropaTT marketplace.
2. In the CRM open **Modules**, upload the package and activate **E-Commerce Gateway**.
3. Open the module page, create a store and copy its public key (`stk_...`) and secret, then install the
   connector for your platform.

### Connectors

Store-side connectors are published as separate repositories:

| Platform | Repository |
|---|---|
| OpenCart / ocStore 2.3.x | [tropatt-opencart-2.3](https://github.com/Anton-Barinov/tropatt-opencart-2.3) |
| OpenCart / ocStore 3.0.x | [tropatt-opencart-3.0](https://github.com/Anton-Barinov/tropatt-opencart-3.0) |
| OpenCart 4.0.x | [tropatt-opencart-4.0](https://github.com/Anton-Barinov/tropatt-opencart-4.0) |
| WooCommerce / WordPress | [tropatt-woocommerce](https://github.com/Anton-Barinov/tropatt-woocommerce) |

### Documentation

The full protocol contract (ingestion routes, payload shapes, error codes, security model, database schema,
migrations and the connector contract) is in [`upload/README.md`](upload/README.md).

### License

MIT — see [LICENSE](LICENSE).

## Русский

### О модуле

Универсальный модуль-шлюз: приём заказов, покупок в один клик, обратных звонков, обращений из форм и
лидов из интернет-магазинов (CMS), а также приём остатков (`POST /v1/stock`), с HMAC-аутентификацией
витрин, дедупликацией, обратной синхронизацией статусов и журналом обмена.

| Поле | Значение |
|---|---|
| Модуль | `crm.ecommerce-gateway` |
| Версия | `1.1.0` |
| Категория | integration |
| Ядро | `>=1.0.0` |
| Права | `task.manage`, `project.manage` |

Полный контракт протокола, схема БД и описание коннекторов — в [`upload/README.md`](upload/README.md).
Коннекторы публикуются отдельными репозиториями (см. таблицу выше).

### Лицензия

MIT — см. [LICENSE](LICENSE).

## 中文

### 关于模块

通用的网店接入网关：接收订单、一键购买、回电请求、反馈表单与线索，并接收库存批次
（`POST /v1/stock`），使用 HMAC 签名、幂等去重、状态反向同步和交换日志。

| 字段 | 值 |
|---|---|
| 模块 | `crm.ecommerce-gateway` |
| 版本 | `1.1.0` |
| 分类 | integration |
| 核心 | `>=1.0.0` |
| 权限 | `task.manage`, `project.manage` |

完整协议契约、数据库结构与连接器说明见 [`upload/README.md`](upload/README.md)。连接器单独发布（见上表）。

### 许可证

MIT — 见 [LICENSE](LICENSE)。
