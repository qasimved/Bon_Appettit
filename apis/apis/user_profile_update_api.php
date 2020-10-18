<?php include("includes/connection.php");
 
	include('includes/function.php');

		$file_path = 'http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']).'/';

		$qry = "SELECT * FROM tbl_users WHERE email = '".$_POST['email']."'"; 
		$result = mysqli_query($mysqli,$qry);
		$row = mysqli_fetch_assoc($result);
 	 
 	 	/*if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) 
		{
			$set['NABAWI_APP'][]=array('msg' => "Invalid email format!",'success'=>'0');

			header( 'Content-Type: application/json; charset=utf-8' );
			$json = json_encode($set);
			echo $json;
			 exit;
		}
		else*/ if($row['email']==$_POST['email'] AND $row['id']!=$_POST['user_id'])
		{
			$set['FOOD_APP'][]=array('msg' => "Email address already used!",'success'=>'0');

			header( 'Content-Type: application/json; charset=utf-8' );
			$json = json_encode($set);
			echo $json;
			 exit;
		}

		if($_FILES['user_image']['name']!='')
        {

        	   $file_name= str_replace(" ","-",$_FILES['user_image']['name']);             
               $user_image=$file_name;
         
               //Main Image
               $tpath1='images/'.$user_image;       
               $pic1=compress_image($_FILES["user_image"]["tmp_name"], $tpath1, 80);           
               
               $user_image_url=$file_path.'images/'.$user_image;
        }
        else
        {
        	$user_image_url=$row['user_image'];
        }

 	 	if($_POST['password']!="")
		{
			$data = array(
			'name'  =>  $_POST['name'],
			'email'  =>  $_POST['email'],
			'password'  =>  $_POST['password'],
			'phone'  =>  $_POST['phone'],
 			'address'  =>  $_POST['address'],
 			'user_image'  =>  $user_image_url
			);
		}
		else
		{
			$data = array(
			'name'  =>  $_POST['name'],
			'email'  =>  $_POST['email'],			 
			'phone'  =>  $_POST['phone'],
 			'address'  =>  $_POST['address'],
 			'user_image'  =>  $user_image_url
			);
		}
 
		
	$user_edit=Update('tbl_users', $data, "WHERE id = '".$_POST['user_id']."'");
 	

 	$qry1 = "SELECT * FROM tbl_users WHERE id = '".$_POST['user_id']."'"; 
		    $result1 = mysqli_query($mysqli,$qry1);
		    $row1 = mysqli_fetch_assoc($result1);
 
   $set['FOOD_APP'][]=array('user_id' => $row1['id'],'name'=>$row1['name'],'email'=>$row1['email'],'phone'=>$row1['phone'],'address'=>$row1['address'],'user_image'=>$row1['user_image'],'msg'=>'Updated','success'=>'1');	 
	  				 
  

	header( 'Content-Type: application/json; charset=utf-8' );
	$json = json_encode($set);
	echo $json;
	 exit;
	 
?>