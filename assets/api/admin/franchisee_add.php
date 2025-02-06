<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
            Franchisee Add
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#"> Franchisee</a></li>
                <li class="active"> Franchisee</li>
            </ol>
        </section>

       
        <script src="scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $("#success_msg").delay(4000).fadeOut(100);
        </script>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-9" style="margin-left:10%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Add New Master Franchisee</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="action.php" method="post" enctype="multipart/form-data">
						 <input type="hidden" class="form-control" value="<?php echo $u_id?>" name="u_id" >
                            <div class="box-body">
								<div class="form-group">
                                    <label>Name</label>
                                   <input type="text" class="form-control" name="mas_franch_name" required>
                                </div>
                                <div class="form-group">
                                    <label>Mobile</label>
                                   <input type="text" class="form-control" name="mas_franch_mobile" required>
                                </div>
                                <div class="form-group">
                                    <label>Mail ID</label>
                                   <input type="text" class="form-control" name="mas_franch_mail" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                   <input type="text" class="form-control" name="mas_franch_password" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                 
                                   <textarea name="mas_franch_address" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>City</label>
                                   <input type="text" class="form-control" name="mas_franch_city" required>
                                </div>
                                <div class="form-group">
                                    <label>State</label>
                                   <input type="text" class="form-control" name="mas_franch_state" required>
                                </div>
                                <div class="form-group">
                                    <label>Pin Code</label>
                                   <input type="text" class="form-control" name="mas_franch_pincode" required>
                                </div>
                                
							
							
								
                                        <div class="box-footer">
										<button  name="franchisee_add"  class="btn btn-primary"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Add Franchisee</button>
                                            
                                        </div>
                                  
                                </div>
                        </form>
						
                    </div> 
				
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <?php include "include/footer.php" ?>
