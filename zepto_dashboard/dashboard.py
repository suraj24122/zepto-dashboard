import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import streamlit as st

st.set_page_config(layout="wide")

st.title("🛒 Zepto Data Analysis Dashboard")

# ------------------------ 1. Total Inventory Weight per Category -------------------------
st.title("Total Inventory Weight per Category")
df1 = pd.read_csv("12. the total inventory weight per category.csv")
fig1, ax1 = plt.subplots(figsize=(10, 6))
sns.barplot(data=df1, x='category', y='total_weight', ax=ax1)
ax1.set_title("Total Inventory Weight per Category")
ax1.set_xlabel("Category")
ax1.set_ylabel("Weight (grams)")
plt.xticks(rotation=45)
plt.tight_layout()
st.pyplot(fig1)

# ------------------------ 2. Top 10 Best Value Products -------------------------
st.title("Top 10 Best Value Products (Highest Discounts)")
df2 = pd.read_csv("5. top 10 best value products based on the discounted percentages.csv")
fig2, ax2 = plt.subplots(figsize=(10, 6))
sns.barplot(data=df2, y='name', x='discountPercent', palette='coolwarm', ax=ax2)
ax2.set_title("Top 10 Best Value Products (Highest Discounts)")
ax2.set_xlabel("Discount (%)")
ax2.set_ylabel("Product Name")
plt.tight_layout()
st.pyplot(fig2)

# ------------------------ 3. Estimated Revenue per Category -------------------------
st.title("Estimated Revenue per Category")
df3 = pd.read_csv("7. estimated revenue for each category.csv")
fig3, ax3 = plt.subplots(figsize=(10, 6))
sns.barplot(data=df3, x='category', y='total_revenue', ax=ax3)
ax3.set_title("Estimated Revenue per Category")
ax3.set_xlabel("Category")
ax3.set_ylabel("Revenue (INR)")
plt.xticks(rotation=45)
plt.tight_layout()
st.pyplot(fig3)

# ------------------------ 4. MRP vs Discounted Price (Low Discount) -------------------------
st.title("MRP vs Discounted Price (Low Discounts, High MRP)")
df4 = pd.read_csv("8. products where mrp is greater than 500 and discount is less than 10%.csv")
fig4, ax4 = plt.subplots(figsize=(10, 6))
sns.scatterplot(data=df4, x='mrp', y='discountPercent', ax=ax4)
ax4.set_title("MRP vs Discounted Price (Low Discounts, High MRP)")
ax4.set_xlabel("MRP")
ax4.set_ylabel("Discount (%)")
plt.tight_layout()
st.pyplot(fig4)

# ------------------------ 5. Top 5 Categories with Highest Avg Discount -------------------------
st.title("Top 5 Categories with Highest Avg Discount")
df5 = pd.read_csv("9. top 5 categories offering the highest avg discount percentage.csv")
fig5, ax5 = plt.subplots(figsize=(8, 5))
sns.barplot(data=df5, x='category', y='avg_discount', palette='viridis', ax=ax5)
ax5.set_title("Top 5 Categories with Highest Avg Discount")
ax5.set_ylabel("Average Discount (%)")
plt.tight_layout()
st.pyplot(fig5)
