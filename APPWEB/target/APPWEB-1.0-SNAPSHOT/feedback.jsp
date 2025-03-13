<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com" defer></script>
    <style>
        body {
            font-family: "Raleway", sans-serif;
        }
    </style>
    <title>Feedback - Cab Service</title>
</head>
<body class="bg-gray-50 text-gray-800">

    <!-- Feedback Section -->
    <section class="relative py-16 lg:py-24 bg-white">
        <div class="mx-auto lg:max-w-3xl w-full px-5 sm:px-10 md:px-12 lg:px-5">
            <h1 class="text-3xl font-bold text-center text-gray-900">We Value Your Feedback</h1>
            <p class="mt-4 text-center text-lg text-gray-700">Your feedback helps us improve our service. Please take a moment to share your thoughts with us!</p>

            <!-- Feedback Form -->
            <form method="post" action="FeedbackServlet" class="space-y-6 mt-8 max-w-lg mx-auto">
    <input type="hidden" name="action" value="submit"> <!-- Action to process feedback -->

    <!-- Name Input -->
    <div>
        <label for="name" class="block text-lg font-medium text-gray-700">Your Name</label>
        <input type="text" name="name" id="name" required minlength="3" 
               class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600"
               placeholder="Enter your full name">
    </div>

    <!-- Email Input -->
    <div>
        <label for="email" class="block text-lg font-medium text-gray-700">Your Email</label>
        <input type="email" name="email" id="email" required 
               pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
               class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600"
               placeholder="Enter your email">
    </div>

    <!-- Message Input -->
    <div>
        <label for="message" class="block text-lg font-medium text-gray-700">Your Message</label>
        <textarea name="message" id="message" rows="5" required minlength="10"
                  class="w-full px-4 py-3 mt-2 border border-gray-300 rounded-md focus:ring-blue-600 focus:border-blue-600"
                  placeholder="Write your feedback here"></textarea>
    </div>

    <!-- Error Message (If feedback fails) -->
    <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <p class="bg-red-100 text-red-600 text-center py-2 px-4 rounded-md">
            <%= errorMessage %>
        </p>
    <% } %>

    <!-- Submit Button -->
    <div class="mt-6">
        <button type="submit" 
                class="w-full px-6 py-3 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">
            Submit Feedback
        </button>
    </div>
</form>

        </div>
    </section>

</body>
</html>
