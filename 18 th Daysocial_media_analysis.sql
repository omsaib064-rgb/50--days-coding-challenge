# 📊 Social Media Data Analysis using SQL

📌📌 📌 Project Overview

This project is based on a **Social Media Data Analysis** case study for a platform called **ConnectHub**.  
The database stores information related to:

- Users
- Posts
- Likes
- Comments
- Friendships

The objective of this project is to analyze user activity, engagement, and relationships using **SQL queries**, **joins**, **subqueries**, **aggregations**, and **stored procedures**.

This project is useful for practicing **real world SQL analysis** and showcasing SQL skills in a **portfolio or GitHub project**.

---

🎯🎯🎯 🎯 Project Objective

The main objectives of this project are:

- To analyze **social media user behavior**
- To understand **post engagement**
- To identify **top active users**
- To find **influential users**
- To explore **friend based interactions**
- To implement **stored procedures** for user activity reporting

---

🛠️🛠️🛠️🛠️ Tools & Technologies Used

- **SQL**
- **MySQL Workbench / SQL Server**
- **GitHub**
- **Relational Database Management System**

---

## 🧱 Database Schema

The project consists of the following tables:

### 1. Users
Stores user details.

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| user_id | INT (PK) | Unique ID of the user |
| username | VARCHAR | User profile name |
| email | VARCHAR | User email address |
| join_date | DATE | Date user joined |

---

☸️☸️☸️ 2. Posts
Stores posts created by users.

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| post_id | INT (PK) | Unique ID of the post |
| user_id | INT (FK) | Author of the post |
| content | TEXT | Post content |
| post_date | DATETIME | Date and time of post |

---

🧞🧞🧞3. Likes
Stores likes given to posts.

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| like_id | INT (PK) | Unique like ID |
| user_id | INT (FK) | User who liked the post |
| post_id | INT (FK) | Post that was liked |
| like_date | DATETIME | Date and time of like |

---

💻💻💻4. Comments
Stores comments made on posts.

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| comment_id | INT (PK) | Unique comment ID |
| post_id | INT (FK) | Post commented on |
| user_id | INT (FK) | Comment author |
| comment_text | TEXT | Comment content |
| comment_date | DATETIME | Date and time of comment |

---
🤵🏾🤵🏾🤵🏾 5. Friendships
Stores friendship connections between users.

| Column Name | Data Type | Description |
|------------|-----------|-------------|
| friendship_id | INT (PK) | Unique friendship ID |
| user_id1 | INT (FK) | User 1 |
| user_id2 | INT (FK) | User 2 |
| since_date | DATE | Date friendship started |

🏁 Conclusion

The Social Media Data Analysis using SQL project is a practical and realistic SQL case study that demonstrates how relational databases can be used to solve busines
s problems in a social media environment.


🔗🔗🔗LINK🔗🔗🔗

https://drive.google.com/file/d/1cSGBw9lbkt_j-l-Ht-rAmQbi7mZ6WKEG/view?usp=sharing
