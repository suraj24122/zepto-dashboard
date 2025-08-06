# 🛒 Zepto Sales Data Dashboard

This project demonstrates how to perform end-to-end data analysis and visualization using the Zepto dataset. It covers data extraction, SQL querying, and interactive dashboard creation using Python and Streamlit.

---

## 📌 Project Summary

- 🔽 Downloaded the **Zepto dataset** from **Kaggle**.
- 🛢️ Imported the dataset into **MySQL Workbench** for structured storage and querying.
- 🧠 Performed **data analysis using SQL queries**.  
  > ✅ All SQL queries are provided in the repository as `.sql` file.
- 📊 Exported query results and visualized them using:
  - `Pandas`
  - `Matplotlib`
  - `Seaborn`
- 💻 Built an **interactive dashboard** using `Streamlit`.

---

## 🚀 How to Run (Locally)

1. **Clone the repository**:
   python -m venv venv
source venv/bin/activate      # On Windows: venv\Scripts\activate
pip install -r requirements.txt
streamlit run zepto_dashboard/dashboard.py

zepto-dashboard/
│
├── zepto_dashboard/
│   ├── dashboard.py
│   ├── [CSV files used in dashboard]
│
├── queries/
│   └── zepto_analysis_queries.sql
│
├── requirements.txt
├── README.md

✅ Tools Used
🧮 MySQL Workbench – for SQL queries and data analysis.

📊 Pandas, Matplotlib, Seaborn – for data visualization.

🖥️ Streamlit – for building the dashboard.

🗃️ Kaggle – for dataset source.

📈 Outcome
The project was successfully completed. It provides valuable insights into the Zepto dataset and presents a clean, user-friendly dashboard for visual analysis.

🙌 Author
Suraj Singh

⭐️ Give a Star
If you found this project helpful, consider giving it a ⭐️ on GitHub!
   
   git clone https://github.com/your-username/zepto-dashboard.git
   cd zepto-dashboard
