<?php include "include/header.php" ?>

<div class="wrapper">

    <?php include "include/navbar.php" ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
            Send Message
            </h1>
            <ol class="breadcrumb">
                <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="manage_user.php">E-Pin</a></li>
                <li class="active">Message</li>
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
                <div class="col-md-8 col-xs-12" style="margin-left:10%;margin-right:10%;">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Send Message</h3>
                       </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                     
                            <div class="box-header with-border">
				
									<form method="POST" action="action.php">
									
										<div class="form-group">
											<input type="text" class="form-control" value="<?php if(isset($_GET['id']))
											{
												echo $_GET['id'];
											}
											?>" 
											
											placeholder="User Id" name="u_id" required>
										</div>
										<div class="form-group">
											<input type="text" class="form-control" placeholder="Subject" name="subject" required>
										</div>
										
										<div class="form-group">
											<textarea  class="form-control" placeholder="Message" name="message"></textarea>								</div>
										<div class="form-group"> 
											<button name="send_message" class="btn btn-success">Send</button>
										</div>
									</form>
						 

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
