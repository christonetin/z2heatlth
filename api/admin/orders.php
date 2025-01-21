
<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
       <section class="content-header">
            <h1>
               Total Orders
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
                            <h3 class="box-title" style="color:#FF0000;"><b> Total Orders</b></h3>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                             <table id="data_table" class="table table-bordered table-striped">  
                          <thead>  
                               <tr>  
                               <th>Sl.No</th>
				<th>Date</th>
				<th>Product Name</th>
				<th>Product </th>
				<th>Price</th>
				<th>Qty</th>
				<th>Total</th>
				<th>Status</th>
                               </tr>  
                          </thead>  
                             <tbody>
									<?php 
					
				
							$res_pin=mysqli_query($con,"SELECT * FROM cart WHERE   cart_status=1 ORDER BY cart_ai DESC  ")or die("Query error");
							$i=1;
                            $stot=0;
							while($row1=mysqli_fetch_array($res_pin))
							{
                                
                                $price_only=$row1['pro_price']+$row1['gst'];
                                $tot=$price_only*$row1['pro_qty'];
                                $stot+=$tot;
                                if($row1['cart_order_status']==0)
                                $st='New Order';
                                elseif($row1['cart_order_status']==1)
                                $st='Packed';
                                elseif($row1['cart_order_status']==2)
                                $st='Couriered';
                                elseif($row1['cart_order_status']==3)
                                $st='Completed';
                                elseif($row1['cart_order_status']==4)
                                $st='Failed';
                
                                $order_date='';
                                echo '<tr>';
                                echo '<td>'.$i++.'</td>';
                                echo '<td>'.date('d-m-Y',strtotime($row1['cart_date'])).'</td>';
                                echo '<td>'.$row1['pro_name'].'</td>';
                                echo '<td><img src="../product_image/'.$row1['pro_img'].'" class="img-thumbnail" style="width:100px"></td>';
                                echo '<td>'.$row1['pro_price'].'</td>';
                                echo '<td>'.$row1['pro_qty'].'</td>';
                                echo '<td>'.$tot.'</td>';
                                echo '<td>'.$st.'</td>';
                                echo '</form></tr>';
					
					?>
						
						<?php
					}
							
						?>
                                </tbody>
                     </table> 
                        </div>
                        <!-- /.box-body -->
                    </div>
					 
		  
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <?php include "include/footer.php" ?>

