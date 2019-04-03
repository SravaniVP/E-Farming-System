<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

	class Seller extends CI_Controller{

		public function index($u_id){

			if(!($this->session->userdata('logged_in') and ($this->session->userdata('user_id') == 3)))
			{
				redirect('users/login');
			}

			$data['title'] = 'This is seller page';
			$data['id'] = $u_id;
			$data['sellers'] = $this->User_model->get_sellers();
			$data['allcrops'] = $this->Crop_model->get_all_crops();
			$data['crops'] = $this->Crop_model->get_crops_info($u_id);
			$data['products'] = $this->Crop_model->get_products_info($u_id);
			$data['cropsInfo'] = $this->Crop_model->get_list_crops_info();//whose info is available	
			$data['p_id'] = 	$this->Crop_model->get_products_id($u_id);

			//echo "<pre>";
			//print_r($data['products']);
			//exit();

			
				$this->load->view('templates/header');
				$this->load->view('seller/seller',$data);
				$this->load->view('templates/footer');
			
						
		}
		public function cropInfo($u_id){

					if(!($this->session->userdata('logged_in') and ($this->session->userdata('user_id') == 3)))
					{
						redirect('users/login');
					}

					$data['title'] = 'This is seller page';
					$data['id'] = $u_id;
					
					$data['sellers'] = $this->User_model->get_sellers();
					$data['allcrops'] = $this->Crop_model->get_all_crops();
					$data['noInfo'] = $this->Crop_model->get_list_all_crops_no();			
					$data['cropsInfo'] = $this->Crop_model->get_list_crops_info();//whose info is available	
					//$data['products'] = $this->Crop_model->get_products_info($u_id);

					//echo "<pre>";
					//print_r($data['cropsInfo']);
					//exit();

					$this->form_validation->set_rules('name','CROP NAME','required|callback_check_crop_exists');
					if($this->form_validation->run() === FALSE)
					{
						$this->load->view('templates/header');
						$this->load->view('seller/cropInfo',$data);
						$this->load->view('templates/footer');
					}
					else
					{
						$this->Crop_model->addCrop($u_id);
						$this->session->set_flashdata('crop_added','Crop added successfully');
						//echo $u_id;
						//exit();
						redirect('seller/cropInfo/'.$u_id);
					}			
				}

		//check if crop exists
		public function check_crop_exists($crop){
			$this->form_validation->set_message('check_crop_exists','Crop already exists!');
			if($this->Crop_model->check_crop_exists($crop)){
				return true;
			}
			else{
				return false;
			}
		}
/*
		//edit stock value
		public function edit($product_id){

			 if(!($this->session->userdata('logged_in') and ($this->session->userdata('user_id') == 3)))
			 {
				redirect('users/login');
			 }

			$data['u_id'] = $this->session->userdata('u_id');
			$u_id = $this->session->userdata('u_id');
			$data['title'] = "process";
			$data['key'] = $id;
			$data['specificCrop'] = $this->Crop_model->get_list_crops_info_edit($id);
			$data['crops'] = $this->Crop_model->get_list_crops_no_info($u_id);//whose info is not available
			$data['cropsInfo'] = $this->Crop_model->get_list_crops_info();//whose info is available
			
			$this->load->view('templates/header');
			$this->load->view('seller/edit',$data);
			$this->load->view('templates/footer');			
		} */

		public function update($product_id){
			//echo $product_id;
			//exit();
			$u_id = $this->session->userdata('u_id');
			$this->Crop_model->updateStock($product_id);
			redirect('seller/index/'.$u_id);
		}

		//get orders taken by the users
		public function orders($u_id){
			$data['products_sold'] = $this->Crop_model->orders_to_buyer($u_id);
			
			$this->load->view('templates/header');
			$this->load->view('seller/orders',$data);
			$this->load->view('templates/footer');

		}

		public function sale($u_id){

			if(!($this->session->userdata('logged_in') and ($this->session->userdata('user_id') == 3)))
			{
				redirect('users/login');
			}

			$data['title'] = 'This is seller page';
			$data['id'] = $u_id;
			$data['sellers'] = $this->User_model->get_sellers();
			$data['allcrops'] = $this->Crop_model->get_all_crops();
			$data['crops'] = $this->Crop_model->get_crops_info($u_id);
			
			
			$data['cropsInfo'] = $this->Crop_model->get_list_crops_info();//whose info is available	
			$data['products'] = $this->Crop_model->get_products_info($u_id);
			//echo $u_id;
			//print_r($data['sellers']);
			//exit();

			$this->form_validation->set_rules('quantity','Quantity','required');
			$this->form_validation->set_rules('price','Price','required');
			$this->form_validation->set_rules('product_name','Product Name','required');
			if($this->form_validation->run() === FALSE)
			{
				$this->load->view('templates/header');
				$this->load->view('seller/seller',$data);
				$this->load->view('templates/footer');
			}
			else
			{
				//upload image
				$config['upload_path'] = './assets/images/crops';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size'] = '2048';
				$config['max_width'] = '2000';
				$config['max_height'] = '2000';
				$this->load->library('upload', $config);

				if(!$this->upload->do_upload('userfile')){
					$errors = array('error' => $this->upload->display_errors());
					$crop_image = 'noimage.jpg';
				} else {
					$data = array('upload_data' => $this->upload->data());
					$crop_image = $_FILES['userfile']['name'];
				}

				$this->Crop_model->addCropforSale($u_id,$crop_image);
				$this->session->set_flashdata('crop_for_sale','Crop for sale added successfully');
				//echo $u_id;
				//exit();
				redirect('seller/sale/'.$u_id);
			}			
		}
	}