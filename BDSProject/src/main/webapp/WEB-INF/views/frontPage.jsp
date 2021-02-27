<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Portfolio</title>
  
  <!-- Bootstrap -->
  <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="./assets/css/jasny-bootstrap.min.css">
  <!-- Main Style -->
  <link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  
  <!-- Responsive Style -->
  <link rel="stylesheet" type="text/css" href="./assets/css/responsive.css">
  
  <!--Fonts-->
  <link rel="stylesheet" media="screen" href="./assets/fonts/font-awesome/font-awesome.min.css">

  <!-- Extras -->
  <link rel="stylesheet" type="text/css" href="./assets/extras/animate.css">
  <link rel="stylesheet" type="text/css" href="./assets/extras/lightbox.css">
  <link rel="stylesheet" type="text/css" href="./assets/extras/owl/owl.carousel.css">
  <link rel="stylesheet" type="text/css" href="./assets/extras/owl/owl.theme.css">
  <link rel="stylesheet" type="text/css" href="./assets/extras/owl/owl.transitions.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
              <![endif]-->
</head>
<body>
	 
  <!-- Header Section Start -->
  <div id="header">
    <div class="container">
      <div class="col-md-12 top-header">
        <div class="logo-menu">
          <div class="logo pull-left wow fadeInDown animated" data-wow-delay=".2s">
            <a href="#"><img src="./assets/img/logo.png" alt="logo"></a>
          </div> 
          <div class="pull-right wow fadeInDown animated" data-wow-delay=".2">
            <div id="menu" data-toggle="offcanvas" data-target=".navmenu" data-canvas="body">
              <span>menu</span>
            </div> 
          </div> 
        </div>
        <div class="sidebar-nav">
          <!-- navigation start -->
          <div class="navmenu navmenu-default navmenu-fixed-right offcanvas" style="" id="navigation">
            <a href="#"><img class="logo" src="./assets/img/logo.png" alt="logo"></a>
            <ul class="nav navmenu-nav">
              <li class="active"><a href="#header">Home</a></li>
              <li><a href="#works">Portfolio</a></li>              
              <li><a href="#testimonial">About Us</a></li>              
              <li><a href="#blog">Blog</a></li>              
            </ul>
          </div>
          <!-- navigation End -->
        </div>     
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="banner text-center">
            <h1 class="wow fadeInDown animated" data-wow-delay=".8s">Welcome to our homepage</h1>
            <h2 class="wow fadeInDown animated" data-wow-delay=".6s">We are web developers, Kim & Youn</h2>
            <a href="https://nbcdr.tistory.com/" class="btn btn-border lg wow fadeInLeft animated" data-wow-delay="1.0s">Kim  More</a>
            <a href="https://bluen27.tistory.com/" class="btn btn-common lg wow fadeInRight animated" data-wow-delay="1.0s">Youn  More</a>
            <div class="scroll">
              <a href="#works"><i class="fa fa-angle-down wow fadeInUp animated" data-wow-delay="1.2s"></i></a>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Header Section End -->

  <!-- Work Section Start -->
  <section id="works">
    <div class="container">
      <div class="row">
        <h1 class="section-title wow fadeInLeft animated" data-wow-delay=".6s">Our <br>Mini <br><span>Project</span></h1>
        <div class="col-md-7 col-lg-7 grid-left wow fadeInLeft animated" data-wow-delay="1.2s">
          <div class="large1">
            <video controls width=>

    <source src="./assets/bds.mp4"
            type="video/mp4">

    Sorry, your browser doesn't support embedded videos.
</video><br>
	<a href="http://3.34.53.49:8081/n27/guest/first"><h5>BDS 홈페이지 이동</h5></a>
	
          </div>
          
        </div>
        <div class="col-md-5 grid-right wow fadeInRight animated" data-wow-delay="1.6s">
          <div class="grid-box">
            <img src="./assets/img/work/skill1.png" alt="">
            <div class="overlay">
               <a href="./assets/img/work/skill1.png" data-lightbox="skill1"><i class="fa fa-search"></i></a>
            </div>
          </div>
          <div class="grid-box">
            <img src="./assets/img/work/skill2.png" alt="">
            <div class="overlay">
               <a href="./assets/img/work/skill2.png" data-lightbox="skill2"><i class="fa fa-search"></i></a>
            </div>
          </div>
          <div class="grid-box large" >
            <img src="./assets/img/work/skill3.png" alt="">
            <div class="overlay">
               <a href="./assets/img/work/skill3.png" data-lightbox="skill3"><i class="fa fa-search"></i></a>
            </div>
          </div>          
        </div>
      </div>
    </div>
  </section>
  <!-- Work Section End  -->

  <!-- Testimonial Section Start -->
  <section id="testimonial">
    <div class="container">
      <div class="row">
        <h1 class="section-title wow fadeInLeft animated" data-wow-delay=".6s">About <br><span>Us</span></h1>
        <div id="testimonial-carousel" class="carousel slide wow fadeInUp animated" data-ride="carousel" data-wow-delay="1.2s">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#testimonial-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#testimonial-carousel" data-slide-to="1"></li>
            
          </ol>
          <div class="carousel-inner">
            <div class="item active">
              <blockquote>
                <div class="commant">
                  <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                    <div class="claint">
                      <img src="./assets/img/testimonial/kim.JPG" alt="">
                    </div>
                    <span class="quote"><i class="fa fa-quote-left"></i></span>
                  </div>
                  <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                    <div class="info">
                      <p>아는것보다 모르는 것이 더 많지만 항상 배우는 자세로 노력합니다. 기초적인 Jsp 기반 웹 게시판을 스프링부트, 부트스트랩 등의 Framework를 활용해 구현가능하며 Hadoop 및 spark를 통한 분산처리 시스템을 AWS에 구축가능합니다.</p>
                      <h4>김준혁</h4>
                      <h5>Kim JoonHyeok</h5>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>

            <div class="item">
              <blockquote>
                <div class="commant">
                  <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                    <div class="claint">
                      <img src="./assets/img/testimonial/minku.JPG" alt="">
                    </div>
                    <span class="quote"><i class="fa fa-quote-left"></i></span>
                  </div>
                  <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                    <div class="info">
                      <p>Java를 기반으로 하여 기본적인 디자인 패턴 활용이 가능합니다. HTML5&CSS3를 이용하여 간단하게 화면을 꾸밀 수 있고 Spring Boot를 사용하여 mvc패턴으로 게시판을 만들 수 있습니다. AWS를 이용하여 Linux 서버 배포까지 가능합니다.</p>
                      <h4>윤민구</h4>
                      <h5>Youn Minku</h5>
                    </div>
                  </div>
                </div>
              </blockquote>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </section>
  

  <!-- Blog Section Start -->
  <section id="blog">
    <div class="container">
      <div class="row">
        <h1 class="section-title wow fadeInLeft animated" data-wow-delay=".6s">Our<br>Develope<br><span>Blog</span></h1>
        <a href="https://bluen27.tistory.com/3"><div class="col-lg-4 col-md-4 col-sm-8 col-xs-12">
          
          <div class="blog-large wow fadeInLeft animated"  data-wow-delay="1.2s">
            <img src="./assets/img/blog/tstory1.png" alt="">
            <div class="large">
              <a class="title" href="#">AWS 이용</a>
              <p>서버 구축을 위한 AWS 기본 사용하기 포스팅</p>
            </div>
          </div>          
        </div>
        </a>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 wow fadeInRight animated" data-wow-delay="1.6s">
          <div class="blog-item">
            <img src="./assets/img/blog/img2.jpg" alt="">
            <div class="content">
              <a class="title" href="#">This is Photoshop's vers ion  of Lorem Ipsum. Pro in gravida </a>
              <p>Nibh vel velit auc tor aliq uet. Aenean sollicitu din, lorem quis biben...</p>
            </div>
          </div>
          <div class="blog-item">
            <img src="./assets/img/blog/img3.jpg" alt="">
            <div class="content">
              <a class="title" href="#">This is Photoshop's vers ion  of Lorem Ipsum. Pro in gravida </a>
              <p>Nibh vel velit auc tor aliq uet. Aenean sollicitu din, lorem quis biben...</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 wow fadeInRight animated" data-wow-delay="1.8s">
          <div class="blog-item">
            <img src="./assets/img/blog/img3.jpg" alt="">
            <div class="content">
              <a class="title" href="#">This is Photoshop's vers ion  of Lorem Ipsum. Pro in gravida </a>
              <p>Nibh vel velit auc tor aliq uet. Aenean sollicitu din, lorem quis biben...</p>
            </div>
          </div>
          <div class="blog-item">
            <img src="./assets/img/blog/img2.jpg" alt="">
            <div class="content">
              <a class="title" href="#">This is Photoshop's vers ion  of Lorem Ipsum. Pro in gravida </a>
              <p>Nibh vel velit auc tor aliq uet. Aenean sollicitu din, lorem quis biben...</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- Blog Section Start --> 

  <!-- Footer section Start -->
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
          <div class="copyright wow fadeInUp animated" data-wow-delay=".8s">
            <p>Copyright &copy; 2021 <a href="http://3.34.53.49:8081/n27/guest/first">BDS</a> | All rights reserved.</p>
          </div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
          <div class="scroll-top text-center wow fadeInUp animated" data-wow-delay=".6s">
            <a href="#header"><i class="fa fa-chevron-circle-up fa-2x"></i></a>
          </div>
        </div>
        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
          <p class="text-center wow fadeInUp animated" data-wow-delay=".8s">Developed By <a href="https://bluen27.tistory.com/"">N27</a></p>
        </div>
      </div>
    </div>
  </footer>
  <!-- Footer section End -->

  <!-- jQuery Load -->
  <script src="assets/js/jquery-min.js"></script>
  <!-- Bootstrap JS -->
  <script src="assets/js/bootstrap.min.js"></script>
  <!-- WOW JS plugin for animation -->
  <script src="assets/js/wow.js"></script>
  <!-- All JS plugin Triggers -->
  <script src="assets/js/main.js"></script>
  <!-- Smooth scroll -->
  <script src="assets/js/smooth-scroll.js"></script>
  <!--  -->
  <script src="assets/js/jasny-bootstrap.min.js"></script>
  <!-- Counterup -->
  <script src="assets/js/jquery.counterup.min.js"></script>
  <!-- waypoints -->
  <script src="assets/js/waypoints.min.js"></script>
  <!-- circle progress -->
  <script src="assets/js/circle-progress.js"></script>
  <!-- owl carousel -->
  <script src="assets/js/owl.carousel.js"></script>
  <!-- lightbox -->
  <script src="assets/js/lightbox.min.js"></script>

</body>
</html>