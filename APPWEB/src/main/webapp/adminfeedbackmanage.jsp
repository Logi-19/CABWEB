<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.model.Feedback" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    // Ensure feedbackList is fetched from the servlet
    if (request.getAttribute("feedbackList") == null) {
        response.sendRedirect("FeedbackServlet");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Feedback Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex min-h-screen">
        <!-- Sidebar -->
        <%@ include file="adminsidebar.jsp" %>
        
        <!-- Main content area -->
        <div class="flex-1 p-10">
            <h1 class="text-3xl font-bold mb-5">Feedback Management</h1>

            <!-- Search Bar -->
            <div class="flex mb-5 items-center space-x-4">
                <input type="text" id="searchInput" class="p-2 border border-gray-300 rounded-lg" placeholder="Search by Name" onkeyup="filterFeedback()">
            </div>

            <!-- Feedback Cards -->
            <div id="feedbackContainer" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <%
                    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");

                    if (feedbackList == null || feedbackList.isEmpty()) {
                %>
                    <p class="text-gray-600 text-lg">No feedback available.</p>
                <%
                    } else {
                        for (Feedback feedback : feedbackList) {
                %>
                    <div class="bg-white p-6 rounded-lg shadow-md" data-name="<%= feedback.getName() %>">
                        <h2 class="text-xl font-semibold"><%= feedback.getName() %></h2>
                        <p class="text-gray-500">Email: <%= feedback.getEmail() %></p>
                        <p class="mt-2">Feedback: <%= feedback.getMessage() %></p>
                        <p class="text-sm text-gray-400 mt-2">
                            Posted on: <%= feedback.getCreatedAt() != null ? feedback.getCreatedAt().toString() : "N/A" %>
                        </p>
                        <form action="FeedbackServlet" method="POST">
                            <input type="hidden" name="email" value="<%= feedback.getEmail() %>">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit" class="bg-red-500 text-white px-4 py-2 rounded mt-4 hover:bg-red-600">Delete</button>
                        </form>
                    </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>

    <script>
        function filterFeedback() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const feedbackCards = document.querySelectorAll('#feedbackContainer .bg-white');

            feedbackCards.forEach(card => {
                const name = card.getAttribute('data-name').toLowerCase();
                card.style.display = name.includes(searchInput) ? 'block' : 'none';
            });
        }
    </script>
</body>
</html>
