# CABWEB

# Vehicle Booking and Management System

## Overview
The **Vehicle Booking and Management System** is a web-based platform developed using **Java (JSP, Servlets, DAO, and JDBC)** with **MySQL** as the database. This system allows **admins** to manage vehicles, drivers, feedback, and vehicle-driver allocations, while **customers** can register, log in, book vehicles, submit feedback, and contact the admin.

## Features
### **Admin Functionalities:**
- Manage **Drivers** (Create, Edit, Delete, View)
- Manage **Vehicles** (Create, Edit, Delete, View)
- Manage **Feedback** (View, Delete)
- View **Customer Details**
- View **Contact Messages**
- Manage **Vehicle-Driver Allocation** (Allocate vehicle to driver)

### **Customer Functionalities:**
- **Register & Login**
- **Book a Vehicle**
- **Submit & View Feedback**
- **Send Contact Message**

---

## Database Schema
### **Tables:**

1. **bookings** - Stores booking details including customer and vehicle information.
2. **contact** - Stores messages sent via the contact form.
3. **drivers** - Stores driver details and licenses.
4. **feedback** - Stores customer feedback.
5. **users** - Stores registered customer details.
6. **vehicle_driver_allocation** - Stores allocated vehicles to drivers.
7. **vehicles** - Stores vehicle information.

---

## Test Plan
### **Objective:**
To validate the system functionalities for both admin and customer roles.

### **Testing Approach:**
- **Unit Testing:** Test each module independently.
- **Integration Testing:** Validate data flow between modules and database.
- **System Testing:** Verify end-to-end functionality.
- **User Acceptance Testing (UAT):** Ensure usability and correctness.

### **Test Environment:**
- **Backend:** Java (JSP, Servlets, DAO, JDBC)
- **Frontend:** JSP, HTML, CSS, JavaScript
- **Database:** MySQL (`cabweb`)
- **Server:** Apache Tomcat

## Setup Instructions
### **Prerequisites:**
- Install **Java JDK (8 or later)**
- Install **Apache Tomcat Server**
- Install **MySQL Server**

### **Database Setup:**
1. Create a database `cabweb`.
2. Import the given SQL schema to create tables.

### **Project Setup:**
1. Clone the repository.
2. Configure `DbConfig.java` with database credentials.
3. Deploy the project on Tomcat.
4. Access the system through:
   - **Customer Portal:** `http://localhost:8080/APPWEB/`

---

## Authors
- **Developer:** [Your Name]
- **Technologies Used:** Java, JSP, Servlets, MySQL, HTML, CSS, JavaScript

For any issues, contact [Your Email].

