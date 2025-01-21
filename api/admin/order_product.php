
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header">
            <h1>
             Order Product
                <small>advanced tables</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Total users</a></li>
                <li class="active"> Total users</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title" style="color:#FF0000;"><b>Total User</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="employee_data" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                                   <th style="text-align:center;">S.No.</th>
                                        <th style="text-align:center;">User Id</th>
                                        <th style="text-align:center;">Product name</th>
                                        <th style="text-align:center;">Product Price</th>
                                        <th style="text-align:center;">Point</th>
                                        <th style="text-align:center;">View</th>
                                        
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				
							$res_pin=mysqli_query($con,"SELECT * FROM order_prpduct  INNER JOIN product ON product.pro_id=order_prpduct.order_pro_id")or die("Query error");
							$i=1;
							while($row_pin=mysqli_fetch_array($res_pin))
							{
					
					?>
						<tr>
							<td><?php echo $i++; ;?></td>
							<td><?php echo$row_pin['order_user_id'];?></td>
							<td><?php echo$row_pin['pro_name'];?></td>
							<td><?php echo$row_pin['pro_price'];?></td>
							<td><?php echo$row_pin['point'];?></td>
							
							
							<td><a href="view.php?id=<?php echo$row_pin['order_user_id'];?>" class="btn btn-primary">View</a></td>
						</tr>
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		    <script>  
 $(document).ready(function(){  
      $('#employee_data').DataTable();  
 });  
 </script>  
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <script src="scripts/jquery1.min.js"></script>
    <script src="scripts/jquery.reveal.js"></script>
    <link rel="stylesheet" href="css/styles.css">
    <script type="text/javascript">
    $.noConflict();
    jQuery(document).ready(function($) {
        $('.button').click(function(e) {
            var dataid = $(this).attr("data-id");
            //alert(dataid);
            $('.model' + dataid).css("display", "block");
            $('.model' + dataid).reveal({
                animation: 'fade',
                animationspeed: 600,
                closeonbackgroundclick: true,
                dismissmodalclass: 'close2'
            });
            return false;
        });
    });
    </script>
    <?php include "include/footer.php" ?>

