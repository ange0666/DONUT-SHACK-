<!DOCTYPE html>
<html lang="en">
<?php

session_start(); //temp session
error_reporting(0); // hide undefine index
include("connection/connect.php"); // connection
if(isset($_POST['submit'] )) //if submit btn is pressed
{
     if(empty($_POST['firstname']) ||  //fetching and find if its empty
        empty($_POST['lastname'])|| 
    empty($_POST['email']) ||  
    empty($_POST['phone'])||
    empty($_POST['password'])||
    empty($_POST['cpassword']) ||
    empty($_POST['cpassword']))
    {
      $message = "All fields must be Required!";
    }
  else
  {
    //cheching username & email if already present
  $check_username= mysqli_query($db, "SELECT username FROM users where username = '".$_POST['username']."' ");
  $check_email = mysqli_query($db, "SELECT email FROM users where email = '".$_POST['email']."' ");
    

  
  if($_POST['password'] != $_POST['cpassword']){  //matching passwords
        $message = "Password not match";
    }
  elseif(strlen($_POST['password']) < 6)  //cal password length
  {
    $message = "Password Must be >=6";
  }
  elseif(strlen($_POST['phone']) < 10)  //cal phone length
  {
    $message = "invalid phone number!";
  }

    elseif (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) // Validate email address
    {
        $message = "Invalid email address please type a valid email!";
    }
  elseif(mysqli_num_rows($check_username) > 0)  //check username
     {
      $message = 'username Already exists!';
     }
  elseif(mysqli_num_rows($check_email) > 0) //check email
     {
      $message = 'Email Already exists!';
     }
  else{
       
   //inserting values into db
  $mql = "INSERT INTO users(username,f_name,l_name,email,phone,password,address) VALUES('".$_POST['username']."','".$_POST['firstname']."','".$_POST['lastname']."','".$_POST['email']."','".$_POST['phone']."','".md5($_POST['password'])."','".$_POST['address']."')";
  mysqli_query($db, $mql);
    $success = "Account Created successfully! <p>You will be redirected in <span id='counter'>5</span> second(s).</p>
                            <script type='text/javascript'>
                            function countdown() {
                              var i = document.getElementById('counter');
                              if (parseInt(i.innerHTML)<=0) {
                                location.href = 'login.php';
                              }
                              i.innerHTML = parseInt(i.innerHTML)-1;
                            }
                            setInterval(function(){ countdown(); },1000);
                            </script>'";
    
    
    
    
     header("refresh:5;url=login.php"); // redireted once inserted success
    }
  }

}


?>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Sign Up</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/akingstyle.css" rel="stylesheet"> </head>
<body>
     <style>
       .col-md-4
       {
         font-family: times new roman;
       }
       .col-md-4 h4
       {
        font-family: times new roman;
       }




     </style>
         <!--header starts-->
         <header id="header" class="header-scroll top-header headrom">
            <!-- .navbar -->
            <nav class="navbar navbar-dark">
               <div class="container">
                  <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                  <a class="navbar-brand" href="index.php"> <img src = "images/img/LOGO1.png" width = 250
                        height = 60 hspace = 25 align = left border = "1"> </a>
                  <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                     <ul class="nav navbar-nav">
                      <br>
              <li class="nav-item"> <a class="nav-link active" href="index.php">HOME<span class="sr-only">(current)</span></a> </li>
                            <li class="nav-item"> <a class="nav-link active" href="shop.php">SHOPS<span class="sr-only"></span></a> </li>
                            
              <?php
            if(empty($_SESSION["user_id"]))
              {
                echo '<li class="nav-item"><a href="login.php" class="nav-link active">LOGIN</a> </li>
                <li class="nav-item"><a href="registration.php" class="nav-link active">SIGNUP</a> </li>';
              }
            else
              {
                  
                  
                    echo  '<li class="nav-item"><a href="your_orders.php" class="nav-link active">CART</a> </li>';
                  echo  '<li class="nav-item"><a href="logout.php" class="nav-link active">LOGOUT</a> </li>';
              }

            ?>
               
                        </ul>
                  </div>
               </div>
            </nav>
            <!-- /.navbar -->
         </header>
         <div class="page-wrapper">
            <div class="breadcrumb">
               <div class="container">
                  <ul>
                     <li><a href="#" class="active">
            <span style="color:red;"><?php echo $message; ?></span>
             <span style="color:green;">
                <?php echo $success; ?>
                    </span>
             
          </a></li>
                    
                  </ul>
               </div>
            </div>
            <section class="contact-page inner-page">
               <div class="container">
                  <div class="row">
                     <!-- REGISTER -->
                     <div class="col-md-8">
                        <div class="widget">
                           <div class="widget-body">
                              
                <form action="" method="post">
                                 <div class="row">
                  <div class="form-group col-sm-12">
                                       <label for="exampleInputEmail1">User Name</label>
                                       <input class="form-control" type="text" name="username" id="example-text-input" placeholder="User Name"> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputEmail1">First Name</label>
                                       <input class="form-control" type="text" name="firstname" id="example-text-input" placeholder="First Name"> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputEmail1">Last Name</label>
                                       <input class="form-control" type="text" name="lastname" id="example-text-input-2" placeholder="Last Name"> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputEmail1">Email address</label>
                                       <input type="text" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"> <small id="emailHelp" class="form-text text-muted">We"ll never share your email with anyone else.</small> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputEmail1">Phone number</label>
                                       <input class="form-control" type="text" name="phone" id="example-tel-input-3" placeholder="Phone"> <small class="form-text text-muted">We"ll never share your email with anyone else.</small> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputPassword1">Password</label>
                                       <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password"> 
                                    </div>
                                    <div class="form-group col-sm-6">
                                       <label for="exampleInputPassword1">Repeat password</label>
                                       <input type="password" class="form-control" name="cpassword" id="exampleInputPassword2" placeholder="Password"> 
                                    </div>
                   <div class="form-group col-sm-12">
                                       <label for="exampleTextarea">Delivery Address</label>
                                       <textarea class="form-control" id="exampleTextarea"  name="address" rows="3"></textarea>
                                    </div>
                                   
                                 </div>
                                
                                 <div class="row">
                                    <div class="col-sm-4">
                                       <p> <input type="submit" value="Register" name="submit" class="btn theme-btn"> </p>
                                    </div>
                                 </div>
                              </form>
                           
               </div>
                           <!-- end: Widget -->
                        </div>
                        <!-- /REGISTER -->
                     </div>
                     <!-- WHY? -->
                     <div class="col-md-4">
                        <h4>SIGNUP IS FAST AND EASILY TO CREATE</h4>
                        <p>Get Sign Up to avail all these benefits:</p>
            <ul>
            <li>*Choose some foods in our Shop</li>
            <li>*Food tracking in instantaneously</li>
            <li>*Cancellation and refunds are simple</li>
            <li>*Discounts are offered</li>
            </ul>
                        
                        <h4 class="m-t-20">CONTACT SUPPORT</h4>
                        <p>*If you need additional assistance or have a concern, please do not hesitate to contact us.:)</p>
                        <p> <a href="#" class="btn theme-btn m-t-15">Contact Us</a> </p>
                     </div>
                     <!-- /WHY? -->
                  </div>
               </div>
            </section>
                   
                    <!-- start: FOOTER -->
        <footer class="footer">
            <div class="container">
                <!-- top footer statrs -->
                <div class="row top-footer">
                    <div class="col-xs-12 col-sm-3 footer-logo-block color-gray">
                        <a href="#"> <img src = "images/img/LOGO.png" width = 130
                        height = 130 hspace = 25 align = left border = "1"
          class="logo"> </a> <span>Choose it &amp; Enjoy your meals! </span> </div>
                    <div class="col-xs-12 col-sm-2 about color-gray">
                        <h5>About Us</h5>
                        <ul>
                            <li><a href="#">Our Mission</a></li>
                            <li><a href="#">Social Media</a></li>
                            <li><a href="#">Testimonials</a></li>
                            <li><a href="#">We are hiring</a></li>
              <li><a href="#">Join us Today</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-2 how-it-works-links color-gray">
                        <h5>How it Works?</h5>
                        <ul>
                            <li><a href="#">Enter your location</a></li>
                            <li><a href="#">Choose the Shop</a></li>
                            <li><a href="#">Choose your Food</a></li>
                            <li><a href="#">Get delivered</a></li>
              <li><a href="#">Pay on delivery</a></li>
              <li><a href="#">Enjoy your meals :)</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-2 pages color-gray">
                        <h5>Legal</h5>
                        <ul>
                            <li><a href="#">Terms & Conditions</a> </li>
                            <li><a href="#">Refund & Cancellation</a> </li>
                            <li><a href="#">Privacy Policy</a> </li>
                            <li><a href="#">Cookie Policy</a> </li>
                            <li><a href="#">Offer Terms</a> </li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-sm-3 popular-locations color-gray">
                        <h5>Locations We Deliver To</h5>
                        <ul>
                            <li><a href="#">Caloocan</a> </li>
                            
                        </ul>
                    </div>
                </div>
                <!-- top footer ends -->
                <!-- bottom footer statrs -->
                <div class="bottom-footer">
                    <div class="row">
                        
                        <div class="col-xs-12 col-sm-4 address color-gray">
                             <h5>Address:</h5>
                            <p>2nd Avenue, West Grace Park, Caloocan City</p>
                            <h5>Call us at: 0907-417-653 </h5></div>
                        
                    </div>
                </div>
                <!-- bottom footer ends -->
            </div>
        </footer>
        <!-- end:Footer -->
         </div>
         <!-- end:page wrapper -->
      
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/donutshack.min.js"></script>
</body>

</html>