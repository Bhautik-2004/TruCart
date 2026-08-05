# Scope & Data Strategy
## AI-Powered Autonomous E-Commerce Operations Platform

> **Two key decisions:** Should you build a generalized platform or pick one example? And where does the data come from? This document answers both.

---

## Table of Contents

1. [Scope Decision: Generalized vs Specific](#1-scope-decision-generalized-vs-specific)
2. [Recommendation: The "Specific Story, General Architecture" Approach](#2-recommendation-the-specific-story-general-architecture-approach)
3. [The Demo Store: TechBazaar](#3-the-demo-store-techbazaar)
4. [Data Strategy Overview](#4-data-strategy-overview)
5. [The Olist Dataset: Your Secret Weapon](#5-the-olist-dataset-your-secret-weapon)
6. [Synthetic Data Generation for Missing Pieces](#6-synthetic-data-generation-for-missing-pieces)
7. [Data Mapping: Olist → Your Schema](#7-data-mapping-olist--your-schema)
8. [Seeding Your Database: Step by Step](#8-seeding-your-database-step-by-step)
9. [Simulating Live Events](#9-simulating-live-events)
10. [Data Summary Checklist](#10-data-summary-checklist)

---

## 1. Scope Decision: Generalized vs Specific

### The Dilemma

| Approach | What It Means | Pros | Cons |
|---|---|---|---|
| **Generalized platform** | Build a system that works for any e-commerce store — configurable for any product type, any market, any business rules | Judges see broad vision; sounds more impressive as a "platform" | Too abstract to demo; 48 hours isn't enough to generalize; agents become vague without domain context; "it works for everything" often means "it works for nothing well" |
| **One specific example** | Build for a single fictional e-commerce store (e.g., "TechBazaar — an electronics store in India") | Concrete and demoable; agents have rich context; judges see a working product, not a concept; you can build real agent reasoning around specific products | Might seem "narrow" to judges; concern about whether it scales to other stores |

### Why Most Hackathon Teams Fail at This

The #1 mistake is trying to build a generalized platform. Here's what happens:

```
Hour 0:   "We'll build a platform for ANY e-commerce store!"
Hour 12:  Inventory agent needs to know product categories → "We'll make it configurable"
Hour 24:  Pricing agent needs competitor data → "We'll build a generic scraper" → never finishes
Hour 36:  Support agent has no real FAQ data → "We'll use generic FAQs" → agent gives vague answers
Hour 44:  Demo time → agents give generic, unimpressive responses because they have no domain context
Hour 48:   Judges: "This is a nice concept, but does it actually work?"
```

### The Right Approach

**Build for one specific store, but architect it so the store is just a "config".**

This means:
- The agents, database schema, and architecture are **general** (reusable for any store)
- The **data, prompts, and demo scenarios are specific** to one store
- In your presentation, you say: "We built this for TechBazaar, but the architecture is store-agnostic — swapping in a fashion store means changing the seed data and agent prompts, not the code"

---

## 2. Recommendation: The "Specific Story, General Architecture" Approach

### What This Looks Like in Practice

```
┌──────────────────────────────────────────────────────────┐
│                    PRESENTATION TO JUDGES                 │
│                                                           │
│  "We built an AI-powered autonomous operations platform   │
│   for TechBazaar, a fictional electronics e-commerce      │
│   store. The platform uses 6 specialized AI agents        │
│   that manage inventory, orders, support, pricing,        │
│   marketing, and logistics autonomously.                 │
│                                                           │
│   The architecture is store-agnostic — the agents,        │
│   database schema, and orchestration layer are reusable.  │
│   TechBazaar is our demo scenario, but the same system    │
│   could power a fashion store or a grocery delivery       │
│   platform by swapping the data and agent prompts."       │
│                                                           │
│  → Judges see: A WORKING PRODUCT (specific demo)          │
│  → Judges hear: A SCALABLE PLATFORM (general architecture)│
└──────────────────────────────────────────────────────────┘
```

### How to Make This Credible

| Technique | How Judges See It |
|---|---|
| The database schema is generic (products, orders, customers — not "electronics_inventory") | "This schema could work for any store" |
| Agent prompts reference "products" and "orders" — not "laptops" and "earbuds" | "The agents aren't hardcoded to electronics" |
| A `store_config` table holds store-specific settings (name, currency, categories, thresholds) | "You just swap the config to change stores" |
| The demo uses specific products (earbuds, laptops) — but these come from seed data, not code | "The products are data, not code" |

---

## 3. The Demo Store: TechBazaar

### Store Profile

| Attribute | Value |
|---|---|
| Store name | TechBazaar |
| Tagline | "Your one-stop electronics marketplace" |
| Product categories | Audio (earbuds, headphones, speakers), Computing (laptops, tablets), Mobile (phones, accessories), Wearables (smartwatches, fitness bands), Gaming (consoles, controllers) |
| Currency | INR (₹) |
| Market | India |
| Warehouses | 3 (Mumbai, Delhi, Bangalore) |
| Shipping carriers | Delhivery, BlueDart, FedEx |
| Customer base | ~1,000 customers (seeded from data) |
| Product catalog | ~100 products across 5 categories |
| Daily orders | ~50 orders/day (simulated) |

### Why Electronics?

| Reason | Explanation |
|---|---|
| Relatable | Every judge has bought electronics online — they understand the domain instantly |
| Rich pricing dynamics | Electronics have high price competition, frequent price drops, clear competitor products — makes the Pricing Agent demo compelling |
| Support scenarios are clear | "My earbuds won't charge" or "Laptop arrived with a cracked screen" — judges can immediately understand the support flow |
| Inventory management matters | Electronics have short product lifecycles, so inventory forecasting and clearance campaigns are realistic |
| You know this domain | As a developer, you understand electronics e-commerce — you can write realistic agent prompts and test scenarios |

---

## 4. Data Strategy Overview

### The Data Problem

Your AI agents need data to operate on. But you don't have a real e-commerce store. So where does the data come from?

```
┌───────────────────────────────────────────────────────────────┐
│                    DATA SOURCES MAP                            │
│                                                                │
│  ┌──────────────────┐                                          │
│  │  Olist Dataset   │──→ Real orders, customers, products,     │
│  │  (Kaggle, free)  │    reviews, payments, shipping data      │
│  │  100K real orders│    → Seed your database with REAL data   │
│  └────────┬─────────┘                                          │
│           │                                                    │
│           ▼                                                    │
│  ┌──────────────────┐                                          │
│  │  Transform Script│──→ Map Olist tables → your schema        │
│  │  (Python)        │    Rename columns, adjust to TechBazaar  │
│  │                  │    Add electronics product names         │
│  └────────┬─────────┘                                          │
│           │                                                    │
│           ▼                                                    │
│  ┌──────────────────┐                                          │
│  │  Synthetic Gen   │──→ Fill gaps Olist doesn't have:        │
│  │  (Faker + Python)│    Competitor prices, marketing data,    │
│  │                  │    support tickets, agent task logs       │
│  └────────┬─────────┘                                          │
│           │                                                    │
│           ▼                                                    │
│  ┌──────────────────┐                                          │
│  │  Event Simulator │──→ Generate live events for demo:       │
│  │  (Python script) │    New orders, support tickets,          │
│  │                  │    competitor price drops, stock alerts  │
│  └──────────────────┘                                          │
└───────────────────────────────────────────────────────────────┘
```

### Three-Layer Data Strategy

| Layer | Source | What It Provides | Effort |
|---|---|---|---|
| **Layer 1: Real historical data** | Olist Brazilian E-Commerce Dataset (Kaggle, free) | 100,000 real orders, customers, products, reviews, payments, shipping data with real timestamps, real delays, real ratings | Download + transform script (~2 hours) |
| **Layer 2: Synthetic gap-filling** | Python Faker + custom scripts | Competitor prices, marketing campaigns, support tickets, agent task logs, purchase orders | Write generation script (~2 hours) |
| **Layer 3: Live event simulation** | Python event simulator script | New orders arriving in real-time, support tickets being created, competitor price changes, stock alerts — all during the demo | Write simulator script (~1 hour) |

---

## 5. The Olist Dataset: Your Secret Weapon

### What Is It?

The **Brazilian E-Commerce Public Dataset by Olist** is a free, public dataset on Kaggle containing **100,000 real e-commerce orders** from 2016-2018, covering the entire customer journey from purchase to delivery to review [web:94].

### Why It's Perfect for Your Hackathon

| Feature of Olist | Why It Helps Your Project |
|---|---|
| 100,000 real orders with timestamps | Your InventoryAgent can forecast demand from real sales patterns; your OrderAgent processes real order histories |
| 9 interconnected tables (orders, customers, products, sellers, payments, reviews, geolocation, items, category translation) | Maps almost 1:1 to your database schema — customers, products, orders, order_items, shipments [web:94] |
| Real customer reviews with text | Your SupportAgent's RAG knowledge base has real review data to work with |
| Real shipping data with delivery times and delays | Your LogisticsAgent has real shipping exception patterns to detect and handle |
| Real payment data (credit card, boleto, voucher) | Your OrderAgent has realistic payment scenarios |
| Geolocation data (customer zip codes → lat/lng) | Your LogisticsAgent can do carrier selection based on real destinations |
| Product categories and dimensions (weight, size) | Realistic shipping cost calculations |
| Review scores (1-5) with written comments | Your SupportAgent can classify complaints from real review text |

### What's in the Dataset

The Olist dataset contains 9 CSV files that form a relational database [web:94]:

```
olist_customers_dataset.csv
├── customer_id (unique per order)
├── customer_unique_id (unique per person)
├── customer_zip_code_prefix
├── customer_city
└── customer_state

olist_orders_dataset.csv
├── order_id
├── customer_id
├── order_status (delivered, shipped, canceled, etc.)
├── order_purchase_timestamp
├── order_approved_at
├── order_delivered_carrier_date
├── order_delivered_customer_date
└── order_estimated_delivery_date

olist_order_items_dataset.csv
├── order_id
├── order_item_id
├── product_id
├── seller_id
├── shipping_limit_date
├── price
└── freight_value

olist_products_dataset.csv
├── product_id
├── product_category_name
├── product_name_length
├── product_description_length
├── product_photos_qty
├── product_weight_g
├── product_length_cm
├── product_height_cm
├── product_width_cm

olist_order_reviews_dataset.csv
├── review_id
├── order_id
├── review_score (1-5)
├── review_comment_title
├── review_comment_message
└── review_creation_date

olist_order_payments_dataset.csv
├── order_id
├── payment_sequential
├── payment_type (credit_card, boleto, voucher, debit_card)
├── payment_installments
└── payment_value

olist_sellers_dataset.csv
├── seller_id
├── seller_zip_code_prefix
├── seller_city
└── seller_state

olist_geolocation_dataset.csv
├── geolocation_zip_code_prefix
├── geolocation_lat
├── geolocation_lng
├── geolocation_city
└── geolocation_state

product_category_name_translation.csv
├── product_category_name
└── product_category_name_english
```

### How to Get It

```bash
# Option 1: Download from Kaggle (free account required)
# Go to: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
# Click "Download" → get a ZIP with all 9 CSV files

# Option 2: Use Kaggle API (if you have kaggle installed)
pip install kaggle
# Place your kaggle.json in ~/.kaggle/
kaggle datasets download -d olistbr/brazilian-ecommerce
unzip brazilian-ecommerce.zip -d data/olist/
```

---

## 6. Synthetic Data Generation for Missing Pieces

### What Olist Doesn't Have (and You Need to Generate)

The Olist dataset gives you orders, customers, products, reviews, payments, and shipping — but your platform has agents that need additional data:

| Missing Data | Why You Need It | How to Generate It |
|---|---|---|
| Competitor prices | PricingAgent needs competitor prices to compare against | Python script: for each product, generate 3-5 competitor prices at ±5-20% of your price |
| Support tickets | SupportAgent needs tickets to resolve | Use Olist review comments (1-2 star reviews) as support tickets + generate new ones with Faker |
| Purchase orders (restocking) | InventoryAgent needs PO history | Generate from inventory consumption patterns (derive from order_items quantities) |
| Marketing campaigns | MarketingAgent needs campaign data | Generate 10-20 fictional campaigns with Faker (email subject, body, audience segment) |
| Agent task logs | Your dashboard needs to show agent activity | Generate during runtime as agents execute tasks (this happens naturally) |
| Warehouses | LogisticsAgent needs warehouse locations | Create 3 warehouses (Mumbai, Delhi, Bangalore) and assign products to them |
| Suppliers | InventoryAgent needs supplier info for POs | Generate 10-15 fictional suppliers with Faker (name, lead time, rating) |
| Current inventory levels | InventoryAgent needs stock on hand | Derive from Olist order quantities: total ordered - total sold = current stock |
| Product names (electronics) | Olist has Portuguese category names, not product names | Map Olist products to realistic electronics product names |

### Data Generation Script Overview

```python
# scripts/generate_synthetic_data.py
# This script fills the gaps that the Olist dataset doesn't cover

import faker
import pandas as pd
import random
from datetime import datetime, timedelta

fake = faker.Faker()
random.seed(42)

# ─── 1. Generate Electronics Product Catalog ──────────────
# Olist has product categories in Portuguese. We map them to electronics.

PRODUCT_CATALOG = [
    # Audio
    ("Wireless Earbuds Pro", "Audio", 5999, 3200, 0.045),
    ("Noise-Cancel Headphones X1", "Audio", 12999, 7500, 0.250),
    ("Bluetooth Speaker Mini", "Audio", 2499, 1100, 0.350),
    ("Studio Monitor Headphones", "Audio", 8999, 5200, 0.380),
    ("Portable Party Speaker", "Audio", 6999, 3800, 1.500),

    # Computing
    ("UltraBook 14 Pro", "Computing", 74999, 55000, 1.300),
    ("Gaming Laptop RTX", "Computing", 129999, 89000, 2.400),
    ("Budget Laptop 15", "Computing", 34999, 24000, 1.800),
    ("Tablet 10 Pro", "Computing", 28999, 18000, 0.450),
    ("4K Monitor 27 inch", "Computing", 18999, 12000, 5.500),

    # Mobile
    ("Flagship Phone 5G", "Mobile", 69999, 48000, 0.180),
    ("Budget Smartphone", "Mobile", 11999, 7000, 0.150),
    ("Fast Charger 65W", "Mobile", 1499, 650, 0.080),
    ("Phone Case Pro", "Mobile", 599, 180, 0.050),
    ("Wireless Power Bank", "Mobile", 2199, 1100, 0.220),

    # Wearables
    ("Smart Watch Series 7", "Wearables", 19999, 12000, 0.050),
    ("Fitness Band Lite", "Wearables", 2999, 1300, 0.025),
    ("Smart Watch SE", "Wearables", 9999, 5500, 0.040),

    # Gaming
    ("Game Console NextGen", "Gaming", 49999, 35000, 3.500),
    ("Wireless Controller", "Gaming", 4999, 2200, 0.280),
    ("Gaming Headset 7.1", "Gaming", 6999, 3500, 0.320),
]

# ─── 2. Generate Competitor Prices ────────────────────────
def generate_competitor_prices(products_df):
    competitors = ["Amazon", "Flipkart", "Croma", "Reliance Digital"]
    comp_prices = []

    for _, product in products_df.iterrows():
        for comp in random.sample(competitors, 3):  # 3 competitors per product
            variance = random.uniform(-0.15, 0.20)  # -15% to +20% of our price
            comp_price = product["current_price"] * (1 + variance)
            comp_prices.append({
                "product_id": product["product_id"],
                "competitor_name": comp,
                "competitor_price": round(comp_price, 2),
                "detected_at": fake.date_time_between("-30d", "now"),
            })

    return pd.DataFrame(comp_prices)

# ─── 3. Generate Support Tickets from Reviews ─────────────
def generate_support_tickets(reviews_df, orders_df, customers_df):
    tickets = []

    # Use 1-2 star reviews as "support tickets"
    bad_reviews = reviews_df[reviews_df["review_score"] <= 2]

    for _, review in bad_reviews.head(200).iterrows():
        order = orders_df[orders_df["order_id"] == review["order_id"]].iloc[0]
        customer = customers_df[customers_df["customer_id"] == order["customer_id"]]

        ticket_categories = ["shipping_delay", "defective", "wrong_item", "refund", "other"]
        priorities = ["normal", "normal", "high", "urgent", "normal"]

        tickets.append({
            "ticket_id": fake.uuid4(),
            "customer_id": customer.iloc[0]["customer_unique_id"] if len(customer) > 0 else fake.uuid4(),
            "order_id": review["order_id"],
            "subject": "Issue with my order",
            "description": review.get("review_comment_message", "Product issue"),
            "category": random.choice(ticket_categories),
            "priority": random.choice(priorities),
            "status": random.choice(["open", "resolved", "escalated"]),
            "created_at": review.get("review_creation_date", fake.date_time_between("-60d", "now")),
        })

    # Generate additional synthetic tickets with Faker
    for _ in range(100):
        tickets.append({
            "ticket_id": fake.uuid4(),
            "customer_id": fake.uuid4(),
            "order_id": fake.uuid4(),
            "subject": fake.sentence(nb_words=6),
            "description": fake.paragraph(nb_sentences=3),
            "category": random.choice(ticket_categories),
            "priority": random.choice(priorities),
            "status": "open",
            "created_at": fake.date_time_between("-7d", "now"),
        })

    return pd.DataFrame(tickets)

# ─── 4. Generate Suppliers ────────────────────────────────
def generate_suppliers():
    suppliers = []
    for i in range(12):
        suppliers.append({
            "supplier_id": fake.uuid4(),
            "name": fake.company() + " Electronics",
            "contact_email": fake.company_email(),
            "contact_phone": f"+91 {fake.msisdn()[3:13]}",
            "lead_time_days": random.randint(3, 14),
            "rating": round(random.uniform(3.5, 5.0), 1),
            "is_active": True,
        })
    return pd.DataFrame(suppliers)

# ─── 5. Generate Warehouses ───────────────────────────────
def generate_warehouses():
    return pd.DataFrame([
        {"warehouse_id": fake.uuid4(), "name": "Mumbai Hub", "location": "Mumbai, MH", "region": "West", "is_active": True},
        {"warehouse_id": fake.uuid4(), "name": "Delhi Hub", "location": "New Delhi, DL", "region": "North", "is_active": True},
        {"warehouse_id": fake.uuid4(), "name": "Bangalore Hub", "location": "Bangalore, KA", "region": "South", "is_active": True},
    ])
```

---

## 7. Data Mapping: Olist → Your Schema

### How Olist Tables Map to Your Database

| Olist Table | Your Table | Transformation Needed |
|---|---|---|
| `olist_customers_dataset` | `customers` | Map `customer_unique_id` → `customer_id`; generate email/phone/name with Faker; derive `segment` from order count |
| `olist_products_dataset` | `products` | Map Portuguese category names to electronics categories; generate realistic product names; map Olist prices to INR |
| `olist_orders_dataset` | `orders` | Map `order_status` directly; convert timestamps; generate `order_number`; map `payment_status` from payment data |
| `olist_order_items_dataset` | `order_items` | Map directly; `price` → `unit_price`; `freight_value` goes to `shipments` |
| `olist_order_reviews_dataset` | `support_tickets` | 1-2 star reviews → support tickets; review text → ticket description |
| `olist_sellers_dataset` | `suppliers` | Map sellers → suppliers; generate additional supplier data with Faker |
| `olist_order_payments_dataset` | (merged into `orders`) | Extract `payment_method` and `payment_status` into orders table |
| Geolocation | `addresses` | Map zip codes → cities/states; generate full addresses with Faker |

### Transformation Script Structure

```python
# scripts/transform_olist_data.py

import pandas as pd
from faker import Faker
import uuid

fake = Faker('en_IN')
Faker.seed(42)

# Load Olist data
customers_raw = pd.read_csv('data/olist/olist_customers_dataset.csv')
orders_raw = pd.read_csv('data/olist/olist_orders_dataset.csv')
items_raw = pd.read_csv('data/olist/olist_order_items_dataset.csv')
products_raw = pd.read_csv('data/olist/olist_products_dataset.csv')
reviews_raw = pd.read_csv('data/olist/olist_order_reviews_dataset.csv')
payments_raw = pd.read_csv('data/olist/olist_order_payments_dataset.csv')
sellers_raw = pd.read_csv('data/olist/olist_sellers_dataset.csv')
geo_raw = pd.read_csv('data/olist/olist_geolocation_dataset.csv')
category_translation = pd.read_csv('data/olist/product_category_name_translation.csv')

# ─── Transform Customers ──────────────────────────────────
# Map Olist customers to our schema
unique_customers = customers_raw.drop_duplicates(subset=['customer_unique_id'])

customers = pd.DataFrame({
    'customer_id': unique_customers['customer_unique_id'],
    'email': [fake.email() for _ in range(len(unique_customers))],
    'full_name': [fake.name() for _ in range(len(unique_customers))],
    'phone': [f'+91{fake.msisdn()[3:13]}' for _ in range(len(unique_customers))],
    'segment': 'standard',  # Will update based on order count
    'lifetime_value': 0.0,   # Will calculate from orders
    'total_orders': 0,       # Will calculate from orders
    'created_at': pd.Timestamp('2016-01-01'),
})

# Calculate LTV and order count per customer
order_counts = customers_raw.groupby('customer_unique_id').size()
for cust_id, count in order_counts.items():
    if count >= 10:
        customers.loc[customers['customer_id'] == cust_id, 'segment'] = 'vip'
    elif count == 1:
        customers.loc[customers['customer_id'] == cust_id, 'segment'] = 'standard'
    else:
        customers.loc[customers['customer_id'] == cust_id, 'segment'] = 'regular'

# ─── Transform Products ───────────────────────────────────
# Map Olist products to electronics catalog
import random
random.seed(42)

ELECTRONICS_MAP = [
    {"category": "Audio", "prefix": "Audio"},
    {"category": "Computing", "prefix": "Computing"},
    {"category": "Mobile", "prefix": "Mobile"},
    {"category": "Wearables", "prefix": "Wearables"},
    {"category": "Gaming", "prefix": "Gaming"},
]

# Assign each Olist product to an electronics category randomly
products_raw['category'] = [random.choice(ELECTRONICS_MAP)['category']
                            for _ in range(len(products_raw))]

# Generate realistic electronics product names
PRODUCT_NAMES = {
    "Audio": ["Wireless Earbuds Pro", "Noise-Cancel Headphones X1", "Bluetooth Speaker Mini",
              "Studio Monitor Headphones", "Portable Party Speaker"],
    "Computing": ["UltraBook 14 Pro", "Gaming Laptop RTX", "Budget Laptop 15",
                  "Tablet 10 Pro", "4K Monitor 27 inch"],
    "Mobile": ["Flagship Phone 5G", "Budget Smartphone", "Fast Charger 65W",
               "Phone Case Pro", "Wireless Power Bank"],
    "Wearables": ["Smart Watch Series 7", "Fitness Band Lite", "Smart Watch SE"],
    "Gaming": ["Game Console NextGen", "Wireless Controller", "Gaming Headset 7.1"],
}

products_raw['name'] = products_raw['category'].apply(
    lambda cat: random.choice(PRODUCT_NAMES[cat])
)

products = pd.DataFrame({
    'product_id': products_raw['product_id'],
    'sku': ['TB-' + str(i).zfill(4) for i in range(len(products_raw))],
    'name': products_raw['name'],
    'description': products_raw['category'] + ' - ' + products_raw['name'],
    'category': products_raw['category'],
    'base_price': items_raw.groupby('product_id')['price'].mean().reindex(products_raw['product_id']).fillna(999).values,
    'current_price': items_raw.groupby('product_id')['price'].mean().reindex(products_raw['product_id']).fillna(999).values,
    'cost_price': (items_raw.groupby('product_id')['price'].mean().reindex(products_raw['product_id']).fillna(999).values * 0.65),
    'weight_kg': (products_raw['product_weight_g'] / 1000).fillna(0.5).values,
    'status': 'active',
})

# ─── Transform Orders ─────────────────────────────────────
# Merge order + customer + payment info
orders_merged = orders_raw.merge(
    customers_raw[['customer_id', 'customer_unique_id']],
    on='customer_id'
).merge(
    payments_raw.groupby('order_id').agg({
        'payment_type': 'first',
        'payment_value': 'sum'
    }).reset_index(),
    on='order_id',
    how='left'
)

orders = pd.DataFrame({
    'order_id': orders_merged['order_id'],
    'customer_id': orders_merged['customer_unique_id'],
    'order_number': ['TB-ORD-' + str(i).zfill(6) for i in range(len(orders_merged))],
    'status': orders_merged['order_status'].map({
        'delivered': 'delivered',
        'shipped': 'shipped',
        'canceled': 'cancelled',
        'processing': 'processing',
        'invoiced': 'confirmed',
        'created': 'pending',
        'approved': 'confirmed',
        'unavailable': 'cancelled'
    }).fillna('pending'),
    'total_amount': orders_merged['payment_value'].fillna(0),
    'currency': 'INR',
    'payment_method': orders_merged['payment_type'].map({
        'credit_card': 'credit_card',
        'boleto': 'upi',
        'voucher': 'wallet',
        'debit_card': 'debit_card'
    }).fillna('upi'),
    'payment_status': orders_merged['order_status'].apply(
        lambda x: 'paid' if x in ['delivered', 'shipped', 'processing', 'invoiced', 'approved'] else 'pending'
    ),
    'placed_at': pd.to_datetime(orders_merged['order_purchase_timestamp']),
    'confirmed_at': pd.to_datetime(orders_merged['order_approved_at']),
    'shipped_at': pd.to_datetime(orders_merged['order_delivered_carrier_date']),
    'delivered_at': pd.to_datetime(orders_merged['order_delivered_customer_date']),
})

# ─── Transform Order Items ────────────────────────────────
order_items = pd.DataFrame({
    'order_item_id': [str(uuid.uuid4()) for _ in range(len(items_raw))],
    'order_id': items_raw['order_id'],
    'product_id': items_raw['product_id'],
    'quantity': 1,  # Olist has one row per item, quantity is implicit
    'unit_price': items_raw['price'],
    'status': 'fulfilled',
})

# ─── Transform Reviews → Support Tickets ──────────────────
bad_reviews = reviews_raw[reviews_raw['review_score'] <= 3].head(300)

support_tickets = pd.DataFrame({
    'ticket_id': [str(uuid.uuid4()) for _ in range(len(bad_reviews))],
    'customer_id': bad_reviews.merge(
        orders_raw[['order_id', 'customer_id']], on='order_id'
    ).merge(
        customers_raw[['customer_id', 'customer_unique_id']], on='customer_id'
    )['customer_unique_id'],
    'order_id': bad_reviews['order_id'],
    'subject': 'Issue with my order',
    'description': bad_reviews['review_comment_message'].fillna('Product issue - need assistance'),
    'category': bad_reviews['review_score'].apply(
        lambda x: random.choice(['shipping_delay', 'defective', 'wrong_item', 'refund']) if x <= 2 else 'other'
    ),
    'priority': bad_reviews['review_score'].apply(
        lambda x: 'high' if x == 1 else 'normal'
    ),
    'status': 'resolved',
    'assigned_to_agent': 'support_agent',
    'resolution': 'Issue resolved per return policy',
    'confidence_score': round(random.uniform(0.75, 0.95), 2),
    'created_at': pd.to_datetime(bad_reviews['review_creation_date']),
    'resolved_at': pd.to_datetime(bad_reviews['review_answer_timestamp']),
})

# ─── Save all transformed data ────────────────────────────
customers.to_csv('data/transformed/customers.csv', index=False)
products.to_csv('data/transformed/products.csv', index=False)
orders.to_csv('data/transformed/orders.csv', index=False)
order_items.to_csv('data/transformed/order_items.csv', index=False)
support_tickets.to_csv('data/transformed/support_tickets.csv', index=False)

print("Data transformation complete!")
print(f"Customers: {len(customers)}")
print(f"Products: {len(products)}")
print(f"Orders: {len(orders)}")
print(f"Order Items: {len(order_items)}")
print(f"Support Tickets: {len(support_tickets)}")
```

---

## 8. Seeding Your Database: Step by Step

### Step 1: Download Olist Data

```bash
mkdir -p data/olist data/transformed
# Download from: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
# Unzip to data/olist/
```

### Step 2: Transform Olist → Your Schema

```bash
python scripts/transform_olist_data.py
# Output: data/transformed/*.csv (customers, products, orders, etc.)
```

### Step 3: Generate Synthetic Data for Gaps

```bash
python scripts/generate_synthetic_data.py
# Output: data/transformed/competitor_prices.csv, suppliers.csv, etc.
```

### Step 4: Calculate Inventory Levels

```python
# scripts/calculate_inventory.py
import pandas as pd

# Inventory = total stock received - total sold
# We derive "initial stock" as a multiple of total sold (e.g., 2x sold)
# Then current_stock = initial_stock - total_sold

order_items = pd.read_csv('data/transformed/order_items.csv')
sold_quantities = order_items.groupby('product_id')['quantity'].sum()

# Assume initial stock was 2x what was sold (so ~50% sold through)
inventory_data = []
for product_id, sold in sold_quantities.items():
    initial_stock = int(sold * 2)  # Started with 2x what was sold
    current_stock = initial_stock - sold
    reorder_point = max(10, int(sold * 0.1))  # 10% of sold as reorder point
    reorder_quantity = int(sold * 0.5)  # Reorder 50% of sold

    inventory_data.append({
        'product_id': product_id,
        'warehouse_id': 'warehouse-mumbai',  # Assign to Mumbai warehouse
        'quantity_on_hand': current_stock,
        'quantity_reserved': 0,
        'reorder_point': reorder_point,
        'reorder_quantity': reorder_quantity,
    })

inventory_df = pd.DataFrame(inventory_data)
inventory_df.to_csv('data/transformed/inventory.csv', index=False)
print(f"Inventory records: {len(inventory_df)}")
```

### Step 5: Load All Data into PostgreSQL

```python
# scripts/seed_database.py
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine('postgresql://ecommerce:password@localhost:5432/ecommerce')

# Load all CSVs into database tables
tables = {
    'customers': 'data/transformed/customers.csv',
    'products': 'data/transformed/products.csv',
    'orders': 'data/transformed/orders.csv',
    'order_items': 'data/transformed/order_items.csv',
    'support_tickets': 'data/transformed/support_tickets.csv',
    'inventory': 'data/transformed/inventory.csv',
    'suppliers': 'data/transformed/suppliers.csv',
    'warehouses': 'data/transformed/warehouses.csv',
    'competitor_prices': 'data/transformed/competitor_prices.csv',
}

for table_name, file_path in tables.items():
    df = pd.read_csv(file_path)
    df.to_sql(table_name, engine, if_exists='append', index=False)
    print(f"Loaded {len(df)} rows into {table_name}")

print("Database seeded successfully!")
```

### Step 6: Set Up RAG Knowledge Base

```python
# scripts/setup_kb.py
import pandas as pd
from chromadb import HttpClient

chroma = HttpClient(host='localhost', port=8000)

# Create collections
faq_collection = chroma.create_collection("faq_kb")
product_collection = chroma.create_collection("product_catalog")
policy_collection = chroma.create_collection("policy_kb")

# Load FAQs (generate some basic ones)
faqs = [
    {"q": "What is your return policy?", "a": "You can return any product within 30 days of delivery for a full refund. The product must be in its original condition with all accessories."},
    {"q": "How long does delivery take?", "a": "Standard delivery takes 3-5 business days. Express delivery (1-2 days) is available for an additional charge."},
    {"q": "Do you offer warranty on electronics?", "a": "Yes, all electronics come with a minimum 1-year manufacturer warranty. Premium products have extended warranty options."},
    {"q": "What payment methods do you accept?", "a": "We accept credit cards, debit cards, UPI, and digital wallets. No-cost EMI is available on orders above ₹5,000."},
    {"q": "Can I cancel my order?", "a": "Orders can be cancelled before they are shipped. Once shipped, you'll need to initiate a return after delivery."},
    {"q": "My product is defective, what do I do?", "a": "If you receive a defective product, please create a support ticket within 7 days of delivery. We'll arrange a replacement or refund."},
    {"q": "Do you offer same-day delivery?", "a": "Same-day delivery is available in Mumbai, Delhi, and Bangalore for orders placed before 12 PM. An additional fee of ₹99 applies."},
    {"q": "How do I track my order?", "a": "You can track your order in real-time from your dashboard. You'll also receive SMS and email updates at each stage."},
]

# Add FAQs to ChromaDB
faq_collection.add(
    ids=[f"faq_{i}" for i in range(len(faqs))],
    documents=[f"Q: {f['q']}\nA: {f['a']}" for f in faqs],
    metadatas=[{"type": "faq"} for _ in faqs],
)

# Add product catalog to ChromaDB
products = pd.read_csv('data/transformed/products.csv')
product_collection.add(
    ids=products['product_id'].tolist(),
    documents=(products['name'] + ' - ' + products['description']).tolist(),
    metadatas=products[['category', 'sku']].to_dict('records'),
)

# Add policies
policies = [
    "Return Policy: 30-day return window. Product must be in original condition with all accessories and packaging.",
    "Refund Policy: Refunds are processed within 5-7 business days to the original payment method. Orders above ₹5,000 require human approval for refunds.",
    "Exchange Policy: Exchanges are allowed within 30 days for size/color variations. The product must be unused.",
    "Shipping Policy: Free shipping on orders above ₹999. Standard delivery: 3-5 days. Express: 1-2 days (₹99 extra). Same-day: Mumbai/Delhi/Bangalore only.",
    "Warranty Policy: All electronics include 1-year manufacturer warranty. Extended warranty available for premium products at additional cost.",
    "Cancellation Policy: Orders can be cancelled before shipping. After shipping, a return must be initiated.",
]

policy_collection.add(
    ids=[f"policy_{i}" for i in range(len(policies))],
    documents=policies,
    metadatas=[{"type": "policy"} for _ in policies],
)

print(f"Knowledge base setup complete!")
print(f"  FAQs: {len(faqs)}")
print(f"  Products: {len(products)}")
print(f"  Policies: {len(policies)}")
```

---

## 9. Simulating Live Events

For the demo, you need events happening in real-time so judges can see agents in action. Create an event simulator:

```python
# scripts/event_simulator.py
# Run this during the demo to generate live events

import asyncio
import random
import httpx
from faker import Faker

fake = Faker('en_IN')
API_URL = "http://localhost:8001/api"

async def simulate_new_order():
    """Simulate a customer placing an order every 30-60 seconds"""
    while True:
        await asyncio.sleep(random.randint(30, 60))

        order_data = {
            "customer_id": fake.uuid4(),
            "items": [{
                "product_id": f"prod_{random.randint(1, 100)}",
                "quantity": random.randint(1, 3)
            }]
        }

        async with httpx.AsyncClient() as client:
            response = await client.post(f"{API_URL}/orders", json=order_data)
            print(f"[ORDER] New order placed: {response.json().get('order_id', 'unknown')}")

async def simulate_support_ticket():
    """Simulate a customer creating a support ticket every 60-90 seconds"""
    while True:
        await asyncio.sleep(random.randint(60, 90))

        complaints = [
            "My order hasn't arrived yet, it's been 5 days",
            "The product I received is damaged",
            "I received the wrong product",
            "I want to return this product, it doesn't match the description",
            "The earbuds I received don't charge properly",
        ]

        ticket_data = {
            "customer_id": fake.uuid4(),
            "order_id": f"ord_{random.randint(1, 10000)}",
            "subject": "Order Issue",
            "description": random.choice(complaints),
        }

        async with httpx.AsyncClient() as client:
            response = await client.post(f"{API_URL}/support/ticket", json=ticket_data)
            print(f"[TICKET] New support ticket: {response.json().get('ticket_id', 'unknown')}")

async def simulate_competitor_price_change():
    """Simulate competitor price changes every 2-3 minutes"""
    while True:
        await asyncio.sleep(random.randint(120, 180))

        price_data = {
            "product_id": f"prod_{random.randint(1, 100)}",
            "competitor_name": random.choice(["Amazon", "Flipkart", "Croma"]),
            "competitor_price": round(random.uniform(100, 5000), 2),
        }

        async with httpx.AsyncClient() as client:
            response = await client.post(f"{API_URL}/admin/simulate-competitor-price", json=price_data)
            print(f"[PRICE] Competitor price change: {price_data['competitor_name']} → ₹{price_data['competitor_price']}")

async def simulate_stock_alert():
    """Simulate inventory hitting reorder point every 3-5 minutes"""
    while True:
        await asyncio.sleep(random.randint(180, 300))

        stock_data = {
            "product_id": f"prod_{random.randint(1, 100)}",
            "new_stock_level": random.randint(0, 5),
        }

        async with httpx.AsyncClient() as client:
            response = await client.post(f"{API_URL}/admin/simulate-stock-update", json=stock_data)
            print(f"[STOCK] Low stock alert: product {stock_data['product_id']} at {stock_data['new_stock_level']} units")

async def main():
    print("Event simulator started. Events will appear every 30-300 seconds.")
    print("Press Ctrl+C to stop.")

    await asyncio.gather(
        simulate_new_order(),
        simulate_support_ticket(),
        simulate_competitor_price_change(),
        simulate_stock_alert(),
    )

if __name__ == "__main__":
    asyncio.run(main())
```

### Running the Demo Flow

During the demo, run these in separate terminals:

```bash
# Terminal 1: Infrastructure (Docker)
docker compose up -d

# Terminal 2: Agent system
cd agents && python main.py

# Terminal 3: API server
cd backend && uvicorn main:app --reload --port 8001

# Terminal 4: Event simulator (generates live events for demo)
python scripts/event_simulator.py

# Terminal 5: Frontend (open in browser)
cd frontend && npm run dev
# Open http://localhost:3000
```

---

## 10. Data Summary Checklist

### What You'll Have After Setup

| Data | Source | Count | Tables Populated |
|---|---|---|---|
| Customers | Olist (real) | ~96,000 unique customers | `customers` |
| Products | Olist + electronics mapping | ~100 products | `products` |
| Orders | Olist (real) | ~100,000 orders | `orders` |
| Order items | Olist (real) | ~113,000 items | `order_items` |
| Support tickets | Olist reviews (real) + Faker | ~400 tickets | `support_tickets` |
| Inventory | Derived from Olist order quantities | ~100 records | `inventory` |
| Suppliers | Faker (synthetic) | 12 suppliers | `suppliers` |
| Warehouses | Hardcoded (3 Indian cities) | 3 warehouses | `warehouses` |
| Competitor prices | Faker (synthetic) | ~300 records | `competitor_prices` |
| FAQ knowledge base | Hardcoded | 8 FAQs | ChromaDB `faq_kb` |
| Policy knowledge base | Hardcoded | 6 policies | ChromaDB `policy_kb` |
| Product catalog (vectors) | Olist + electronics names | ~100 products | ChromaDB `product_catalog` |

### Total Data Volume

```
Real data from Olist:    ~310,000 records (customers, orders, items, reviews)
Synthetic data (Faker): ~750 records (suppliers, competitor prices, extra tickets)
Knowledge base:         ~114 documents (FAQs, policies, product catalog)
Live event simulator:   Generates ~4 events/minute during demo
```

This gives your AI agents a **rich, realistic dataset** to operate on — real customer behavior, real order patterns, real delivery delays, and real complaint text — making your demo far more compelling than a handful of hardcoded test records.

---

## Quick Decision Summary

| Question | Answer |
|---|---|
| Generalized or specific? | **Specific story (TechBazaar), general architecture.** Build for one electronics store, but keep the code and schema store-agnostic. Tell judges "this works for any store by swapping data." |
| Where does data come from? | **Olist Brazilian E-Commerce Dataset** (Kaggle, free) — 100K real orders with 9 interconnected tables. Transform it to fit your schema. Fill gaps (competitor prices, suppliers, support tickets) with Python Faker. |
| How to demo live activity? | **Event simulator script** — generates new orders, support tickets, competitor price changes, and stock alerts in real-time during your presentation. |

---

*This document covers scope decision and data strategy only. For architecture, tech stack, zero-cost local development, and implementation plan, see the other documents.*
