<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
              All Products
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">  All Products</a></li>
                <li class="active">  All Products</li>
            </ol>
        </section>

       
        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $("#success_msg").delay(4000).fadeOut(100);
        </script>

        <!-- Main content -->
        <section class="content">
        
			<style>   
    
    .pagination {   
        display: inline-block;   
    }   
    .pagination a {   
        font-weight:bold;   
        font-size:18px;   
        color: black;   
        float: left;   
        padding: 8px 16px;   
        text-decoration: none;   
        border:1px solid black;   
    }   
    .pagination a.active {   
            background-color: pink;   
    }   
    .pagination a:hover:not(.active) {   
        background-color: skyblue;   
    }   
        </style>   
			<div class="row">
                <!-- left column -->
                <div class="col-md-12 col-xs-12" >
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                           
                       </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                     
                            <div class="box-header with-border" style=" overflow-x: scroll;">
				
                             
                               
                                
								<table class="table "  id="data_table">
                                <thead>
							<tr>
								<th>Sl.No</th>
								<th>pro_code</th>
								<th>Products Name</th>
								
								<th>Product Price</th>
							
								<th>Availble Qty</th>
								<th>Edit</th>
							
							</tr>
</thead>
<tbody>
							<?php
							$i=1;
							$res_pin=mysqli_query($con,"SELECT * FROM product  ");
							while($row_pin=mysqli_fetch_array($res_pin))
							{
							?>
							<tr>
								<td><?php echo $i++; ?></td>
								<td><?php echo $row_pin['pro_code'] ?></td>
								<td><?php echo $row_pin['pro_name'] ?></td>
								
								<td><?php echo $row_pin['price'] ?></td>
					
								<td><?php echo $row_pin['pro_qty'] ?></td>
								<td><a class="btn btn-info" href="product_view.php?id=<?php echo $row_pin['pro_ai'] ?>"><i class="fa fa-pencil"></a></td>
							
								
								
							</tr>	
							<?php
							}
								
							?>
</tbody>
						</table>
					
						

                                        <!-- </div>-->
                                        <!-- /.box-body -->

                                   
                                </div>
                        
                    </div>
                    <!-- /.box -->

                </div>

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>
