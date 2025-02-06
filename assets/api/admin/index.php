<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Dashboard
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
          <!--  <form action="action.php" method="post">
								<input type="number" name="cnt" id="" class="form-control" required>
								<button class="btn btn-info" name="dublicate_id_create">Submit</button>
							</form>---->
            
                
                <!-- ./col -->
            	<style>
                        .small-box .icon i{
                            font-size: 40px;
                        }
                    </style>
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
				
					<a href="product_all.php" style="text-decoration:none">
                    <div class="small-box bg-green">
                        <div class="inner">
                          
                          <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM product  ")); ?></h3>
                            <p>Total Products</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                       
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="total_users.php" style="text-decoration:none">
                    <div class="small-box bg-primary">
                        <div class="inner">
                       
                          <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM reg  ")); ?></h3>
                            <p>Total Users</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                       
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="orders.php" style="text-decoration:none">
                    <div class="small-box bg-yellow">
                        <div class="inner">
                        
                          <h3><?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE  cart_status=1 "));?></h3>
                            <p>Total Orders</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                      
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="#" style="text-decoration:none">
                    <div class="small-box bg-red">
                        <div class="inner">
                           
                            <h3>0</h3>
                            <p>Total Business</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                    
                    </div>
                  
					</a>
                </div>
                    </div>
                  
                    <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
				
					<a href="order_status.php?id=0" style="text-decoration:none">
                    <div class="small-box bg-green">
                        <div class="inner">
                          
                          <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status=0 ")); ?></h3>
                            <p>New Orders</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                       
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="order_status.php?id=1" style="text-decoration:none">
                    <div class="small-box bg-primary">
                        <div class="inner">
                       
                          <h3>  <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status=1 ")); ?></h3>
                            <p>Packed Orders</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                       
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="order_status.php?id=2" style="text-decoration:none">
                    <div class="small-box bg-yellow">
                        <div class="inner">
                        
                          <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status=2 ")); ?></h3>
                            <p>Couriered Orders</p>
							
                        </div>
						
                        <div class="icon">
                        <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                      
                    </div>
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
					<a href="order_status.php?id=3" style="text-decoration:none">
                    <div class="small-box bg-red">
                        <div class="inner">
                           
                            <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status=3 ")); ?></h3>
                            <p>Completed Orders</p>
							
                        </div>
						
                        <div class="icon">
                            <i class="fa fa-pie-chart" aria-hidden="true"></i>
                        </div>
                    
                    </div>
                  
					</a>
                </div>
                <div class="col-lg-3 col-xs-6">
                   
					
                   <a href="order_status.php?id=4" style="text-decoration:none">
                   <div class="small-box bg-green">
                       <div class="inner">
                          
                           <h3> <?php echo mysqli_num_rows(mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 AND order_status=4 ")); ?></h3>
                           <p>Failed Orders</p>
                           
                       </div>
                       
                       <div class="icon">
                           <i class="fa fa-pie-chart" aria-hidden="true"></i>
                       </div>
                   
                   </div>
                 
                   </a>
               </div>
            </div> 
			
		


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <?php include "include/footer.php" ?>
