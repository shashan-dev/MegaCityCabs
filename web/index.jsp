<%@page import="src.data.utils.DataLayer"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cabs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./Styles/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>

        <!-- Header {Company Name, Contact No, SignIn and SignUp Btns} -->
        <header class=" text-white py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <!-- Company Name -->
                    <div class="company-name">
                        <h1 class=" display-5 h3 mb-0 text-orange fw-bold">Mega City Cabs</h1>
                    </div>

                    <!-- Contact Info -->
                    <div class="contact-info d-none d-md-block">
                        <p class="display-6 mb-0">Call us: <span class="text-orange">+1 234 567 890</p>
                    </div>


                    <div class="buttons">
                        <a href="SignIn.jsp" class="btn btn-outline-orange me-2">Sign In</a>
                        <a href="SignUp.jsp" class="btn btn-orange me-2">Sign Up</a>
                    </div>
                </div>
            </div>
        </header>


        <section class="py-8 bg-dark text-white ">
            <div class="container">
                <div class="row align-items-center">

                    <div class="col-md-6">
                        <h2 class="display-4 fw-bold mb-4">Your Ride, Your Way</h2>
                        <p class="lead mb-4">
                            Experience the ultimate convenience with Mega City Cabs, your go-to transportation service for reliable and hassle-free travel. Whether you're heading to work, catching a flight, or exploring the city, our modern fleet and professional drivers ensure a smooth and comfortable ride. With 24/7 availability, you can count on us anytime, anywhere, for a safe and timely journey.
                        </p>
                        <p class="lead mb-4">
                            We prioritize customer satisfaction with easy booking options, multiple payment methods, and transparent pricing - no hidden charges, just fair fares. Covering citywide and airport transfers, we also offer eco-friendly vehicle choices for sustainable travel. Choose Mega City Cabs for an effortless, affordable, and enjoyable ride every time.
                        </p>
                        <a href="SignIn.jsp" class="btn btn-orange btn-lg">Book Now</a>
                    </div>


                    <div class="col-md-6">
                        <img
                            src="Assets/bgimage1.jpg" 
                            class="img-fluid rounded shadow"
                            >
                    </div>

                </div>
            </div>
        </section>


        <!-- Customer Reviews Section -->
        <section class="py-5 bg-lighttone">
            <div class="container">
                <h2 class="text-center mb-5 fw-bold black-tone2">What Our Customers Say</h2>
                <div id="reviewCarousel" class="carousel slide" data-bs-ride="carousel">

                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#reviewCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#reviewCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#reviewCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>


                    <div class="carousel-inner">

                        <div class="carousel-item active">
                            <div class="text-center">
                                <img src="Assets/customer.png" alt="Customer 1" class="rounded-circle mb-3" width="100">
                                <h4 class="fw-bold">John Doe</h4>
                                <div class="star-rating mb-3">
                                    ★★★★★ 
                                </div>
                                <p class="lead mx-auto text-dark" style="max-width: 600px;">
                                    "Mega City Cabs is amazing! The drivers are professional, and the rides are always on time. Highly recommended!"
                                </p>
                            </div>
                        </div>


                        <div class="carousel-item">
                            <div class="text-center">
                                <img src="Assets/customer.png" alt="Customer 2" class="rounded-circle mb-3" width="100">
                                <h4 class="fw-bold">Jane Smith</h4>
                                <div class="star-rating mb-3">
                                    ★★★★☆ 
                                </div>
                                <p class="lead mx-auto text-dark" style="max-width: 600px;">
                                    "Great service! The app is easy to use, and the cars are always clean. Will definitely use again."
                                </p>
                            </div>
                        </div>


                        <div class="carousel-item">
                            <div class="text-center">
                                <img src="Assets/customer.png" alt="Customer 3" class="rounded-circle mb-3" width="100">
                                <h4 class="fw-bold">Mike Johnson</h4>
                                <div class="star-rating mb-3">
                                    ★★★★★
                                </div>
                                <p class="lead mx-auto text-dark" style="max-width: 600px;">
                                    "Reliable and affordable. Mega City Cabs is my go-to for all my travel needs."
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Carousel Controls -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </section>




        <!-- Footer Section -->
        <footer class="bg-black text-white py-5">
            <div class="container">
                <div class="row">
                    <!-- Company Address -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Our Address</h5>
                        <p class="mb-0"><i class="fa fa-map-marker"></i> 123 Main Street, Mega City, Sri Lanka</p>
                    </div>

                    <!-- Contact Number -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Contact Us</h5>
                        <p class="mb-0"><i class="fa fa-phone"></i> +1 234 567 890</p>
                    </div>

                    <!-- Social Media -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Follow Us</h5>
                        <ul class="list-unstyled d-flex">
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-facebook fa-2x"></i>
                                </a>
                            </li>
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-twitter fa-2x"></i>
                                </a>
                            </li>
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-instagram fa-2x"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- User Guide Link -->
                <div class="text-center mt-4">
                    <a href="Booking.jsp" class="text-white text-decoration-none"><i class="fa fa-book"></i> User Guide</a>
                </div>

                <!-- Copyright Notice -->
                <div class="text-center mt-3">
                    <p class="mb-0">© 2025 Mega City Cabs. All rights reserved.</p>
                </div>
            </div>
        </footer>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>