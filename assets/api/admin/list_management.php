<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
             List Management
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">  List Management</a></li>
                <li class="active">   List Management</li>
            </ol>
        </section>

       
        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
       

        <!-- Main content -->
        <section class="content">
        
			
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
								<th>Code</th>
								<th>Products Name</th>
								<th>Product Price</th>
								<th>Availble Qty</th>
								<th>New Arrivel</th>
								<th>Today Deals</th>
								<th>Flash Sale</th>
								<th>Best Sale</th>
								<th>Offer Product</th>
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
								<td> <input type="checkbox" class="is_new" data-id="<?php echo $row_pin['pro_ai']; ?>" value="<?php echo $row_pin['is_new']; ?>"<?php echo $row_pin['is_new'] == 1 ? 'checked':''; ?>></td>
                                <td> <input type="checkbox" class="is_today" data-id="<?php echo $row_pin['pro_ai']; ?>" value="<?php echo $row_pin['is_today']; ?>"<?php echo $row_pin['is_today'] == 1 ? 'checked':''; ?>></td>
                                <td> <input type="checkbox" class="is_flash" data-id="<?php echo $row_pin['pro_ai']; ?>" value="<?php echo $row_pin['is_flash']; ?>"<?php echo $row_pin['is_flash'] == 1 ? 'checked':''; ?>></td>
                                <td> <input type="checkbox" class="is_best" data-id="<?php echo $row_pin['pro_ai']; ?>" value="<?php echo $row_pin['is_best']; ?>"<?php echo $row_pin['is_best'] == 1 ? 'checked':''; ?>></td>
                                <td> <input type="checkbox" class="is_offer" data-id="<?php echo $row_pin['pro_ai']; ?>" value="<?php echo $row_pin['is_offer']; ?>"<?php echo $row_pin['is_offer'] == 1 ? 'checked':''; ?>></td>

								<td><a class="btn btn-info" href="product_view.php?id=<?php echo $row_pin['pro_ai'] ?>"><i class="fa fa-pencil"></a></td>
							
								
								
							</tr>	
							<?php
							}
								
							?>
</tbody>
						</table>
                        <script>
$(document).ready(function() {

    $('.is_best').change(function() {
        var pro_ai = $(this).data('id'); 
        var is_best = $(this).is(':checked') ? 1 : 0; 
        var is_best_submit='';
        $.ajax({
            url: 'action.php', 
            type: 'POST',
            data: { 
                pro_ai: pro_ai,
                is_best: is_best,is_best_submit:is_best_submit
            },
            error: function() {
                console.log('AJAX request failed');
            }
        });
    });

    $('.is_offer').change(function() {
        var pro_ai = $(this).data('id'); 
        var is_offer = $(this).is(':checked') ? 1 : 0; 
        var is_offer_submit='';
        $.ajax({
            url: 'action.php', 
            type: 'POST',
            data: { 
                pro_ai: pro_ai,
                is_offer: is_offer,is_offer_submit:is_offer_submit
            },
            error: function() {
                console.log('AJAX request failed');
            }
        });
    });

    $('.is_today').change(function() {
        var pro_ai = $(this).data('id'); 
        var is_today = $(this).is(':checked') ? 1 : 0; 
        var is_today_submit='';
        $.ajax({
            url: 'action.php', 
            type: 'POST',
            data: { 
                pro_ai: pro_ai,
                is_today: is_today,is_today_submit:is_today_submit
            },
            error: function() {
                console.log('AJAX request failed');
            }
        });
    });

    $('.is_flash').change(function() {
        var pro_ai = $(this).data('id'); 
        var is_flash = $(this).is(':checked') ? 1 : 0; 
        var is_flash_submit='';
        $.ajax({
            url: 'action.php', 
            type: 'POST',
            data: { 
                pro_ai: pro_ai,
                is_flash: is_flash,is_flash_submit:is_flash_submit
            },
            error: function() {
                console.log('AJAX request failed');
            }
        });
    });
    
    $('.is_new').change(function() {
        var pro_ai = $(this).data('id'); 
        var is_new = $(this).is(':checked') ? 1 : 0; 
        var is_new_submit='';
        $.ajax({
            url: 'action.php', 
            type: 'POST',
            data: { 
                pro_ai: pro_ai,
                is_new: is_new,is_new_submit:is_new_submit
            },
            error: function() {
                console.log('AJAX request failed');
            }
        });
    });
});
</script>
						

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
