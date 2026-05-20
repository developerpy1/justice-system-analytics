# Justice System Analytics

## Introducción

Justice System Analytics es un proyecto de análisis exploratorio de datos (EDA) desarrollado en SQL Server utilizando un dataset simulado del sistema judicial.  

El objetivo principal del proyecto es analizar operaciones judiciales, carga de trabajo, rendimiento de tribunales y tendencias de resolución de casos mediante consultas SQL orientadas a analytics y business intelligence.

---

# Objetivos del Proyecto

- Explorar datos operacionales judiciales
- Analizar tendencias temporales de casos
- Evaluar carga de trabajo por tribunal y juez
- Medir tiempos promedio de resolución
- Realizar análisis de rankings y segmentación
- Practicar funciones analíticas SQL
- Simular un entorno tipo Data Warehouse

---

# Dataset

El dataset fue generado de manera sintética para simular operaciones reales de un sistema judicial.

## Contenido del dataset

- 50,000 registros de casos judiciales
- 50 tribunales
- 100 jueces
- 10 provincias
- 5 tipos de casos

---

# Modelo de Datos

El proyecto utiliza una estructura inspirada en modelos dimensionales tipo Data Warehouse.

## Fact Table

- `fact_case_activity`

## Dimension Tables

- `dim_courts`
- `dim_judges`
- `dim_case_types`
- `dim_regions`

---

# Tecnologías Utilizadas

- SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- Data Analytics
- Exploratory Data Analysis (EDA)

---

# Conceptos SQL Aplicados

Durante el proyecto se utilizaron:

- SELECT Statements
- INNER JOINs
- GROUP BY
- Aggregate Functions
- CASE Statements
- Window Functions
- Ranking Functions
- Date Functions
- NULL Handling
- Analytical Queries

---

# Análisis Realizados

## Database Exploration
- Exploración de tablas
- Conteo de registros
- Exploración de rangos de fechas

## Dimensions Exploration
- Tipos de tribunales
- Tipos de casos
- Provincias
- Experiencia de jueces

## Date Exploration
- Casos por año
- Casos por mes
- Tendencias temporales
- Patrones estacionales

## Measure Exploration
- Tiempo promedio de resolución
- Promedio de audiencias
- Distribución de estados de casos

## Magnitude Analysis
- Tribunales con mayor carga
- Provincias con mayor actividad judicial
- Tipos de casos más frecuentes

## Ranking Analysis
- Jueces con mayor volumen de trabajo
- Tribunales más rápidos
- Tribunales más lentos

## Change Over Time Analysis
- Evolución mensual de casos
- Crecimiento de actividad judicial

## Cumulative Analysis
- Casos acumulados
- Resoluciones acumuladas

## Performance Analysis
- Rendimiento promedio de tribunales
- Eficiencia judicial

## Part-to-Whole Analysis
- Porcentaje de casos por provincia
- Distribución porcentual de tipos de casos

## Segmentation Analysis
- Segmentación de carga operativa
- Segmentación de tiempos de resolución
- Segmentación de desempeño judicial

---

# Preguntas de Negocio

Algunas preguntas respondidas durante el análisis:

- ¿Qué tribunales manejan más casos?
- ¿Qué provincias generan mayor carga judicial?
- ¿Qué tipos de casos son más frecuentes?
- ¿Qué jueces tienen mayor volumen de trabajo?
- ¿Cuál es el tiempo promedio de resolución?
- ¿Cómo evoluciona la actividad judicial a través del tiempo?
- ¿Qué porcentaje de casos permanece pendiente?

---

# Estructura del Repositorio

```text
justice-system-analytics/
│
├── datasets/
│   ├── fact_case_activity.csv
│   ├── dim_courts.csv
│   ├── dim_judges.csv
│   ├── dim_case_types.csv
│   └── dim_regions.csv
│
├── sql/
│   ├── 01_database_exploration.sql
│   ├── 02_dimensions_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measure_exploration.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_ranking_analysis.sql
│   ├── 07_change_over_time_analysis.sql
│   ├── 08_cumulative_analysis.sql
│   ├── 09_performance_analysis.sql
│   ├── 10_part_to_whole_analysis.sql
│   ├── 11_segmentation_analysis.sql
│   └── 12_final_reports.sql
│
├── README.md
└── LICENSE
```

---

# Resultados Principales

- Identificación de tribunales con mayor carga operativa
- Evaluación de eficiencia judicial
- Análisis de tendencias temporales
- Identificación de patrones de resolución
- Segmentación de desempeño operacional

---

# Conclusión

Este proyecto permitió aplicar conceptos fundamentales e intermedios de SQL orientados al análisis de datos y business intelligence, utilizando un entorno simulado inspirado en operaciones judiciales reales.

El proyecto también permitió practicar:
- análisis exploratorio de datos
- modelado analítico
- consultas avanzadas SQL
- funciones de ventana
- análisis operacional
- pensamiento analítico orientado a negocio
