<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Cab Service</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Add your style for background dots -->
    <style>
      .bg-dots{
        background-image: url(https://images.unsplash.com/photo-1612867754336-c45d074c4f8e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGF4aSUyMGNhYnxlbnwwfHwwfHx8MA%3D%3D);
        background-repeat: no-repeat;
      }

      /* Content Padding */
      .content-padding {
        margin-top: 80px; /* Adjust for navbar */
        padding: 30px;
      }

      .content-section {
        margin-top: 80px; /* Add space for fixed navbar */
      }
    </style>
</head>
<body>

    <%@ include file="navbar.jsp" %>

    <!-- Main Content Section -->
    <div class="content-padding">
        <h1 class="text-3xl text-center mt-16">Welcome to Our Cab Service</h1>
        <p class="text-center mt-4">Reliable and comfortable rides at your service, wherever you are!</p>
    </div>

    <!-- New Component Section -->
    <div class="content-section m-auto max-w-6xl p-12">
       <div class="flex flex-col md:flex-row">
          <div class="md:w-1/2 max-w-md flex flex-col justify-center">
             <div class="md:text-5xl text-2xl uppercase font-black">Reliable Cabs for Your Journey</div>
             <div class="text-xl mt-4">Our service offers safe, comfortable, and on-time rides for all your transportation needs.</div>
             <div class="my-5 h-16">
                <div class="shadow-md font-medium py-2 px-4 text-yellow-100
                   cursor-pointer bg-yellow-600 hover:bg-yellow-500 rounded text-lg text-center w-48">Book a Ride</div>
             </div>
          </div>
          <div class="flex md:justify-end w-full md:w-1/2 -mt-5">
             <div class="bg-dots">
                <div class="shadow-2xl max-w-md z-10 rounded-full mt-6 ml-4">
                   <img alt="Cab Image" class="rounded-t" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr8uasf7_ZPLTKYN17zASty4cxn6scSNrOTQ&s"> 
                   <div class="text-2xl p-10 bg-white">
                       <img alt="quote" class="float-left mr-1" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTji_r8sCCLIo1h3d9N8fk1ZU9vp8JvPiDFJg&s">
                       "Travel with comfort and convenience, wherever you need to go."
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>
    
    <%@include file="about.jsp" %>
    
    <%@include file="contact.jsp" %>
    
    <%@include file="feedback.jsp" %>
    
    <%@include file="feedbackview.jsp" %>
    
    <%@include file="footer.jsp" %>

</body>
</html>
