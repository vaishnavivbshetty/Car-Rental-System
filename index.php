<!DOCTYPE html>
<html>
<?php 
session_start(); 
require 'connection.php';
$conn = Connect();
?>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Royal Car Rental</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/user.css">
    <link rel="stylesheet" href="assets/w3css/w3.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation" style="color: black">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                    </button>
                <a  href="index.php" class="fa fa-car" style="font-size:20px;color:white">
                  Royal Car Rental </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->

            <?php
                if(isset($_SESSION['login_owner'])){
            ?> 
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_owner']; ?></a>
                    </li>
                    <li>
                    <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Control Panel <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="entercar.php">Add Car</a></li>
              <li> <a href="enterdriver.php"> Add Driver</a></li>
              <li> <a href="ownerview.php">View</a></li>

            </ul>
            </li>
          </ul>
                    </li>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
            
            <?php
                }
                else if (isset($_SESSION['login_customer'])){
            ?>
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php">Home</a>
                    </li>
                    <li>
                        <a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $_SESSION['login_customer']; ?></a>
                    </li>
                    <ul class="nav navbar-nav">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> Garagge <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="prereturncar.php">Return Now</a></li>
              <li> <a href="mybookings.php"> My Bookings</a></li>
            </ul>
            </li>
          </ul>
                    <li>
                        <a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                    </li>
                </ul>
            </div>

            <?php
            }
                else {
            ?>

            <div class="collapse navbar-collapse navbar-right navbar-main-collapse" style="color:white">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.php" class="fa fa-home">Home</a>
                    </li>
                    <li>
                        <a href="ownerlogin.php" class="glyphicon glyphicon-user">Owner</a>
                    </li>
                    <li>
                        <a href="customerlogin.php" class="glyphicon glyphicon-user">Customer</a>
                    </li>
                    <li>
                        <a href="faq/index.php" class="glyphicon glyphicon-question-sign">FAQ</a>
                    </li>
					<li>
                        <a href="#contact" class="fa fa-envelope">Contact</a>
                    </li>
                </ul>
            </div>
                <?php   }
                ?>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div style="background: yellow url('./assets/img/vais.jpg') no-repeat fixed center;background-size:cover;min-height:100%">
        <header class="intro">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h1 class="brand-heading" style="color:white">Royal Car Rental</h1>
                            <p class="intro-text">
                                Online Car Rental Service
                            </p>
                            <a href="#sec2" class="btn btn-circle page-scroll blink">
                                <i class="fa fa-angle-double-down animated"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>

    <div id="sec2" style="color: #777;background-color:pink;text-align:center;padding:50px 80px;text-align: justify;">
        <h3 style="text-align:center;">Currently Available Cars</h3>
<br>
        <section class="menu-content">
            <?php   
            $sql1 = "SELECT * FROM cars WHERE car_availability='yes'";
            $result1 = mysqli_query($conn,$sql1);

            if(mysqli_num_rows($result1) > 0) {
                while($row1 = mysqli_fetch_assoc($result1)){
                    $car_id = $row1["car_id"];
                    $car_name = $row1["car_name"];
                    $ac_price = $row1["ac_price"];
                    $ac_price_per_day = $row1["ac_price_per_day"];
                    $non_ac_price = $row1["non_ac_price"];
                    $non_ac_price_per_day = $row1["non_ac_price_per_day"];
                    $car_img = $row1["car_img"];
               
                    ?>
            <a href="booking.php?id=<?php echo($car_id) ?>">
            <div class="sub-menu">
            

            <img class="card-img-top" src="<?php echo $car_img; ?>" alt="Card image cap">
            <h5> <?php echo $car_name; ?> </h5>
            <h6> AC Fare: <?php echo ("₹" . $ac_price . "/km & ₹" . $ac_price_per_day . "/day"); ?></h6>
            <h6> Non-AC Fare: <?php echo ("₹" . $non_ac_price . "/km & ₹" . $non_ac_price_per_day . "/day"); ?></h6>

            
            </div> 
            </a>
            <?php }}
            else {
                ?>
<h1> No cars available :( </h1>
                <?php
            }
            ?>                                   
        </section>
                    
    </div>

    <div style="background:  url('./assets/img/background.webp') no-repeat fixed center;background-size:cover;min-height:40%">
        <div class="caption">
            <span class="border" style="background-color:transparent;font-size:25px;color: #f7f7f7;"></span>
        </div>
    </div>

    <div style="position:relative;">
        <div style="color:#ddd;background-color:#282E34;text-align:center;padding:50px 80px;text-align: justify;">
            
        </div>
    </div>
    <!-- Container (Contact Section) -->
    <div class="w3-content w3-container w3-padding-64" id="contact" style="background-color:skyblue;font-size:25px;color:black;">
        <h3 class="w3-center" style="text-align:center;font-size:40px;font-weight:bold;font-family:algerian">Get in Touch</h3>
        <p class="w3-center" style="text-align:center;font-size:18px;"><em>We love your feedback!</em></p>

        <div class="w3-row w3-padding-32 w3-section" style="text-align:center;margin-left:250px">
            
            <div class="w3-col m8 w3-panel">
                <div class="w3-large w3-margin-bottom">
                    <i class="fa fa-map-marker fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Mangalore, India<br>
                    <i class="fa fa-phone fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Phone: +91 7676124080<br>
                    <i class="fa fa-envelope fa-fw w3-hover-text-black w3-xlarge w3-margin-right"></i> Email: royalcarrental@gmail.com<br>
                </div>
                <p style="text-align:center;font-size:16px;font-weight:bold;margin-right:20px">New to Mangalore ? Drop Your Details and Leave it on us We'll Revert</p>
                <form action="action_page.php" method="POST" style="text-align:center">
                    <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
                        
                            <input class="w3-input w3-border" type="text" placeholder="Name" required name="name">
                        </div>
						
                        <div class="w3-row-padding" style="margin:0 -16px 8px -16px">
                            <input class="w3-input w3-border" type="text" placeholder="Email" required name="e_mail">
                        </div>
						<div class="w3-row-padding" style="margin:0 -16px 8px -16px">
                    <input class="w3-input w3-border" type="text" placeholder="Message" required name="message">
					</div>
                    <button class="w3-button w3-black w3-right w3-section" type="submit" style="text-align:center;margin-right:80px">
                <i class="fa fa-paper-plane"></i> SEND MESSAGE
              </button>
                </form>
            </div>
        </div>
    </div>
    
   
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="assets/js/jquery.easing.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="assets/js/theme.js"></script>
</body>

</html>