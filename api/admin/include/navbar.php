
<script>
    $(function(){
        $('a').each(function(){
            if ($(this).prop('href') == window.location.href) {
                $(this).addClass('active'); $(this).parents('li').addClass('active');
            }
        });
    });
</script>
<!-- BEGIN HEADER -->
<header class="main-header">
    <!-- Logo -->
    <a href="loginindex.php" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">
            <!--<img src="img/logo.png" alt="100 Rupee Power Logo" class="logo-default" width="40%" height="85%"/>--><?php echo compayname ;?>
        </span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">Admin <?php echo compayname ;?></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs"><?php echo compayname ;?> admin</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                      
                        <!-- Menu Body -->
                        <li class="user-body">
                            <!--<div class="row">
                                <div class="col-xs-6 text-center">
                                    <a href="change_password.php" class="btn btn-info">Change Password</a>
                                </div>

                            </div>-->
                            <!-- /.row -->
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            
                            <div class="pull-right">
                                <a href="logout.php" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
                <!-- Control Sidebar Toggle Button -->
            </ul>
        </div>
    </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><b><?php echo compayname ;?> Admin</b></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <form action="action.php" method="POST" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="u_id" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button name="search_id" id="search-btn" class="btn btn-flat"><i
                            class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class=" treeview">

                <a href="index.php">
                    <i class="fa fa-home"></i> <span>Dashboard</span>
                </a>
            </li>
  
            <li><a href="total_users.php"><i class="fa fa-users" aria-hidden="true"></i><span>Total Members</span></a></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-sort"></i> <span>Category Management</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>


                <ul class="treeview-menu">
                    <li><a href="category_main.php"><i class="fa fa-sort"></i> Main Category</a></li>
                    <li><a href="category_sub.php"><i class="fa fa-sort"></i> Sub Category</a></li>
                   
                </ul>
            </li>
        
			<li class="treeview">
                <a href="#">
                    <i class="fa fa-cart-plus"></i> <span>Products</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>


                <ul class="treeview-menu">
                    <li><a href="product_add.php"><i class="fa fa-cart-plus"></i> Add Product</a></li>
                    <li><a href="product_all.php"><i class="fa fa-cart-plus"></i>All Product</a></li>
                </ul>
            </li>
         
			 <li class="treeview">
                <a href="#">
                    <i class="fa fa-envelope"></i> <span>Message</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>


                <ul class="treeview-menu">
                    <li><a href="inbox_message.php"><i class="fa fa-envelope"></i> Inbox Message</a></li>
                    <li><a href="send_message.php"><i class="fa fa-envelope"></i> Send Message</a></li>
                </ul>
            </li> 
			
		
            <li>
                <a href="banner.php">
                    <i class="fa fa-bullhorn" aria-hidden="true"></i><span>Banner Setting</span>
                </a>
            </li>
			<li class="treeview">
                <a href="#">
                    <i class="fa fa-bullhorn"></i> <span>Report</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>


                <ul class="treeview-menu">
                <li><a href="report_plan.php"><i class="fa fa-bullhorn"></i>Plan Report</a></li>
                    <li><a href="report_user.php"><i class="fa fa-bullhorn"></i>User Report</a></li>
                    <li><a href="report_account.php"><i class="fa fa-bullhorn"></i>Account Report</a></li>
                    <li><a href="payment_request_total.php"><i class="fa fa-bullhorn"></i>Deposit History</a></li>
                    <li><a href="withdtraw_request_tot.php"><i class="fa fa-bullhorn"></i>Payout History</a></li>
                    <li><a href="e_pin.php?id=0"><i class="fa fa-bullhorn"></i>Pin Available</a></li>
                    <li><a href="e_pin.php?id=1"><i class="fa fa-bullhorn"></i>Pin Used</a></li>
                  
                </ul>
            </li>

       
			  <!-- 
			  	<li>
                <a href="bonus_income_add.php">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i><span>Bonuns Income add</span>
                </a>
            </li>
			<li>
                <a href="wallet_request.php">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i><span>Wallet Request</span>
                </a>
            </li>
			<li>
                <a href="wallet_request_history.php">
                    <i class="fa fa-plus-circle" aria-hidden="true"></i><span>Wallet Request History</span>
                </a>
            </li>
			<li>
                <a href="promotional_tool.php">
                    <i class="fa fa-bullhorn" aria-hidden="true"></i><span>My Promotional Tool</span>
                </a>
            </li>


            <li>
                <a href="direct_sponsor.php">
                    <i class="fa fa-sitemap" aria-hidden="true"></i><span>Direct Sponsor Downlines</span>
                </a>
            </li>
-->


            <!--<li class="treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>Profile Settings</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>


                <ul class="treeview-menu">
                    <li><a href="profile.php"><i class="fa fa-circle-o"></i> My Profle</a></li>
                   
                </ul>
            </li>-->
			<li>
                <a href="change_password.php">
                    <i class="fa fa-user" aria-hidden="true"></i><span>Change Password</span>
                </a>
            </li>
			
			<li>
                <a href="logout.php">
                    <i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span>
                </a>
            </li>




        </ul>
    </section>
    <!-- /.sidebar -->
</aside>


<!--
 <ul class="nav flex-column sticky-top pl-0 pt-5 mt-3">
				<li class="nav-item"><a class="nav-link" href="loginindex.php"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;Dashbord</a></li>
				<li class="nav-item"><a class="nav-link" href="register.php"><i class="fa fa-pencil-square" aria-hidden="true"></i>&nbsp;Register</a></li>
                <li class="nav-item"><a class="nav-link" href="wallet.php"><i class="fa fa-google-wallet" aria-hidden="true"></i>&nbsp;Wallet</a></li>
				<li class="nav-item"><a class="nav-link" href="e_pin.php"><i class="fa fa-key" aria-hidden="true"></i>&nbsp;E-pin</a></li>
				<li class="nav-item"><a class="nav-link" href="level.php?id=<?php echo $u_id;?>"><i class="fa fa-map-signs" aria-hidden="true"></i>&nbsp;Level</a></li>
				<li class="nav-item"><a class="nav-link" href="reffer.php"><i class="fa fa-user"  aria-hidden="true"></i>&nbsp;Reffer Link</a></li>
				<li class="nav-item"><a class="nav-link" href="transcation_histroy.php"><i class="fa fa-arrows-v"  aria-hidden="true"></i>&nbsp;Transcation History</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="#submenu1" data-toggle="collapse" data-target="#submenu1"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp;Profile▾</a>
                    <ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
                       <li class="nav-item"><a class="nav-link" href="changepassword.php"><i class="fa fa-unlock-alt" aria-hidden="true"></i>&nbsp;Change password</a></li>
                       <li class="nav-item"><a class="nav-link" href="update_profile.php"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Update Profile</a></li>
					   
                    </ul>
                </li>
				 <li class="nav-item"><a class="nav-link" href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Logout</a></li>
                
            </ul>

--->