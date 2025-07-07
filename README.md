# 🚀 Metadata-Driven Incremental Load with Watermarking in Azure Data Factory

This project demonstrates a scalable, metadata-driven **incremental data ingestion pipeline** using **Azure Data Factory (ADF)**. It reads from multiple MySQL source tables, captures only new/updated records using **watermarking (CDC)**, and loads them into **Azure Blob Storage** in a structured and optimized format.

---

## 📌 Key Features

- ✅ Metadata-driven control using a configuration table
- 🔁 Dynamic looping through any number of source tables
- 🕒 Watermark-based Change Data Capture (CDC)
- 💾 Incremental loading with dynamic SQL queries
- 📂 Staging and merging of delimited text files
- 🧹 Automatic cleanup of intermediate data
- 🧠 Watermark persistence using stored procedures

---

## 🧱 Architecture Overview

```plaintext
+-------------+     +----------------+     +-------------------+
| metadata    | --> | Lookup Tables  | --> | ForEach Table Loop|
+-------------+     +----------------+     +-------------------+
                                                    ↓
                           +------------------+   +-------------------+
                           | Lookup Watermark |   | Get New Max Time  |
                           +------------------+   +-------------------+
                                                    ↓
                  +-------------------+   +-------------------+
                  | Copy Incremental  | → | Merge to Final    |
                  +-------------------+   +-------------------+
                                                    ↓
                        +-------------------+   +------------------------+
                        | Delete Temp Files | → | Update Watermark SP    |
                        +-------------------+   +------------------------+
![image](https://github.com/user-attachments/assets/38d66cb1-96be-40ef-84ab-7e43acb6b80e)

