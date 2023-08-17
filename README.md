## 1. Database Schema

```mermaid
   erDiagram  
    CUSTOMER {  
        int id PK  
        string name  
        string contact_info  
        string address  
    }  

    SUPPLIER {  
        int id PK  
        string name  
        string contact_info  
        string address  
    }  

    PRODUCT_CATEGORY {  
        int id PK  
        string name  
        string description  
    }  

    PRODUCT {  
        int id PK  
        string name  
        string description  
        float price  
        int quantity_in_stock  
        int supplier_id FK  
        int category_id FK  
    }  

    ORDER {  
        int id PK  
        date order_date  
        int customer_id FK  
        float total_amount  
        string status  
    }  

    ORDER_ITEM {  
        int id PK  
        int order_id FK  
        int product_id FK  
        int quantity  
        float price  
    }  

    INVENTORY {  
        int id PK  
        int product_id FK  
        int quantity_on_hand  
        date last_updated  
    }  

    WAREHOUSE {  
        int id PK  
        string location  
        string manager_name  
    }  

    SUPPLY {  
        int id PK  
        int supplier_id FK  
        int product_id FK  
        int quantity  
        date supply_date  
    }  

    SHIPMENT {  
        int id PK  
        int order_id FK  
        date shipment_date  
        string tracking_number  
        string status  
    }  

    PAYMENT {  
        int id PK  
        int order_id FK  
        float amount  
        date payment_date  
        string payment_method  
    }  

    INVOICE {  
        int id PK  
        int order_id FK  
        float total_amount  
        date invoice_date  
    }  

    CUSTOMER_ADDRESS {  
        int id PK  
        int customer_id FK  
        string address  
        string address_type  
    }  

    PRODUCT_SUPPLIER {  
        int id PK  
        int product_id FK  
        int supplier_id FK  
    }  

    CUSTOMER ||--o{ ORDER : places  
    SUPPLIER ||--o{ PRODUCT : supplies  
    PRODUCT_CATEGORY ||--o{ PRODUCT : contains  
    ORDER ||--o{ ORDER_ITEM : includes  
    PRODUCT ||--o{ ORDER_ITEM : part_of  
    PRODUCT ||--o{ INVENTORY : held_in  
    SUPPLIER ||--o{ SUPPLY : provides  
    PRODUCT ||--o{ SUPPLY : receives  
    ORDER ||--o{ SHIPMENT : generates  
    ORDER ||--o{ PAYMENT : consists_of  
    ORDER ||--o{ INVOICE : generates  
    CUSTOMER ||--o{ CUSTOMER_ADDRESS : has  
    PRODUCT ||--o{ PRODUCT_SUPPLIER : supplied_by  
    SUPPLIER ||--o{ PRODUCT_SUPPLIER : supplies
```

# Entities
```
CUSTOMER - Information about clients.
SUPPLIER - Data about suppliers.
PRODUCT - Information about products, their prices and quantities in stock.
ORDER - Orders from customers.
ORDER_ITEM - Contents of orders.
INVENTORY - Data on inventory of goods.
WAREHOUSE - Information about warehouses.
SUPPLY - Supplies from suppliers.
SHIPMENT - Data on the delivery of orders.
PAYMENT - Information about payments.
INVOICE - Issued invoices.
CUSTOMER_ADDRESS - Customer addresses.
PRODUCT_CATEGORY - Product categories.
PRODUCT_SUPPLIER - Relationship between products and suppliers.
```