<?php include("includes/connection.php");
 
	include('includes/function.php');

	   $file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';
	 	  
		$qry = "SELECT * FROM tbl_users WHERE email = '".$_POST['email']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);
		
		if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) 
		{
			$set['FOOD_APP'][]=array('msg' => "Invalid email format!",'success'=>'0');
		}
		else if($row['email']!="")
		{
			$set['FOOD_APP'][]=array('msg' => "Email address already used!",'success'=>'0');
		}
		else
		{ 
 				
 			 
               $file_name= str_replace(" ","-",$_FILES['user_image']['name']);             
               $user_image=$file_name;
         
               //Main Image
               $tpath1='images/'.$user_image;       
               $pic1=compress_image($_FILES["user_image"]["tmp_name"], $tpath1, 80);           
               
               $user_image_url=$file_path.'images/'.$user_image;

 				$data = array(
 					'user_type'=>'Normal',											 
				    'name'  => $_POST['name'],				    
					'email'  =>  $_POST['email'],
					'password'  =>  $_POST['password'],
					'phone'  =>  $_POST['phone'], 
					'user_image'  =>  $user_image_url,
					'status'  =>  '1'
					);		
 			 

			$qry = Insert('tbl_users',$data);									 
					 
				
			$set['FOOD_APP'][]=array('msg' => "Register successflly...!",'success'=>'1');
					
		}

	  
 	 header( 'Content-Type: application/json; charset=utf-8');
     $json = json_encode($set);				
	 echo $json;
	 exit;
	 
?>