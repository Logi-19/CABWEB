<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.model.Feedback" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: "Raleway", sans-serif; }
    </style>
    <title>Customer Feedback - Cab Service</title>
</head>
<body class="bg-gray-50 text-gray-800">

    <section class="py-16 lg:py-24 bg-white">
        <div class="mx-auto lg:max-w-7xl w-full px-5 sm:px-10 md:px-12 lg:px-5">
            <h1 class="text-3xl font-bold text-center text-gray-900">Customer Feedback</h1>
            <p class="mt-4 text-center text-lg text-gray-700">Here is what our customers are saying about our service.</p>

            <div class="space-y-6 mt-8" id="feedbackContainer">
                <% 
                    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");

                    if (feedbackList == null) {
                        out.println("<p class='text-center text-red-500'>Error: No feedback available.</p>");
                    } else if (feedbackList.isEmpty()) {
                        out.println("<p class='text-center text-gray-600'>No feedback available.</p>");
                    } else {
                        int count = 0;
                        for (Feedback feedback : feedbackList) {
                            boolean isHidden = count >= 3; // Show first 3, hide the rest
                %>
                <div class="p-4 border rounded-lg bg-gray-100 feedback-item" <% if (isHidden) { %>style="display: none;"<% } %>>
                    <div class="text-lg font-medium text-gray-900"><%= feedback.getName() %></div>
                    <div class="text-sm text-gray-600"><%= feedback.getEmail() %></div>
                    <p class="text-gray-600 mt-2"><%= feedback.getMessage() %></p>
                    <div class="text-sm text-gray-500">
    Posted on: 
    <% if (feedback.getCreatedAt() != null) { %>
        <%= feedback.getCreatedAt().toLocalDateTime().toLocalDate() %>
    <% } else { %>
        <span class="text-red-500">Unknown Date</span>
    <% } %>
</div>

                </div>
                <% 
                            count++;
                        }
                    } 
                %>
            </div>

            <div class="flex justify-center mt-6">
                <button id="see-more-btn" class="px-6 py-2 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700" onclick="toggleFeedback()">See More</button>
                <button id="see-less-btn" class="px-6 py-2 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700 hidden" onclick="toggleFeedback()">See Less</button>
            </div>
        </div>
    </section>

    <script>
        function toggleFeedback() {
            const feedbackItems = document.querySelectorAll('.feedback-item');
            const seeMoreButton = document.getElementById('see-more-btn');
            const seeLessButton = document.getElementById('see-less-btn');

            let hiddenCount = 0;
            feedbackItems.forEach((item, index) => {
                if (index >= 3) {
                    if (item.style.display === 'none' || item.style.display === '') {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                        hiddenCount++;
                    }
                }
            });

            if (hiddenCount === feedbackItems.length - 3) {
                seeMoreButton.style.display = 'inline-block';
                seeLessButton.style.display = 'none';
            } else {
                seeMoreButton.style.display = 'none';
                seeLessButton.style.display = 'inline-block';
            }
        }
    </script>

</body>
</html>
