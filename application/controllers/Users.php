<?php
defined('BASEPATH') OR exit('No direct script access allowed');

	class Users extends CI_Controller{

		//register admin
		public function register(){
			$data['title'] = 'SIGN UP FORM';
			$data['categories'] = $this->User_model->get_users();


			$this->form_validation->set_rules('user','Category','required');//first field is same as in the name in a form,second field is displayed in error message
			$this->form_validation->set_rules('fname','First Name','required');
			$this->form_validation->set_rules('contact','Contact','required|min_length[10]|max_length[10]');
			$this->form_validation->set_rules('email','Email','valid_email');
			$this->form_validation->set_rules('l_add','Local Address','required');
			$this->form_validation->set_rules('state','State','required');
			$this->form_validation->set_rules('country','Country','required');
			$this->form_validation->set_rules('pincode','Pincode','required');
			$this->form_validation->set_rules('username','Username','required|callback_check_username_exists');
			$this->form_validation->set_rules('password','Password','required');
			$this->form_validation->set_rules('passconf','Password Confirmation','required|matches[password]');

			if($this->form_validation->run() === FALSE)
			{
				$this->load->view('templates/header');
				$this->load->view('users/reg_form',$data);
				$this->load->view('templates/footer');
			}
			else
			{
				$enc_pass = md5($this->input->post('password'));
				$this->User_model->register($enc_pass);

				//set message
				$this->session->set_flashdata('user_registered','you are now registered and can log in');

				redirect('users/login');
				//$this->load->view('home');
			}
		}

		//user login	
		public function login(){
			$data['title'] = 'LOGIN FORM';


			$this->form_validation->set_rules('username','Username','required');
			$this->form_validation->set_rules('password','Password','required');
			

			if($this->form_validation->run() === FALSE)
			{
				$this->load->view('templates/header',$data);
				$this->load->view('users/login',$data);
				$this->load->view('templates/footer');
			}
			else
			{
				//get the username
				$username = $this->input->post('username');
				//get the password
				$password = md5($this->input->post('password'));
				//user login
				$user_id = $this->User_model->login($username,$password);

				$u_id = $this->User_model->getuserID($username,$password);

				$name = $this->User_model->getuserNAME($username,$password);


				
				if($user_id){
					//create seesion
					$user_data = array(
						'u_id' => $u_id,
						'user_id' => $user_id,
						'username' =>$username, 
						'name' => $name,
						'logged_in' => true
					);

					$this->session->set_userdata($user_data);
					//set message
					$this->session->set_flashdata('user_logged_in','you are now logged in');
					if($user_id == 1)
						redirect('admin');
					elseif($user_id == 2)
						redirect('a_off');
					elseif($user_id == 3)
						redirect('seller/index/'.$u_id);
					elseif($user_id == 4)
						redirect('buyer');		
				}
				else{
					//set message
					$this->session->set_flashdata('login_failed','Login is invalid');

					redirect('users/login');
				
				}				
			}
		}

		//check if username exists
		public function check_username_exists($username){
			$this->form_validation->set_message('check_username_exists','That username is taken.please choose a different name');
			if($this->User_model->check_username_exists($username)){
				return true;
			}
			else{
				return false;
			}
		}

		//logout function
		public function logout(){
			//unset user data
			$this->session->unset_userdata('logged_in');
			$this->session->unset_userdata('user_id');
			$this->session->unset_userdata('username');

			//set message
			$this->session->set_flashdata('user_logout','you are now logged out');
			redirect('farm');
		}

		//edit profile
		public function edit(){

			 if(!($this->session->userdata('logged_in')))
			 {
				redirect('users/login');
			 }

			$data['u_id'] = $this->session->userdata('u_id');
			$u_id = $this->session->userdata('u_id');
			$data['users'] = $this->User_model->get_user_info($u_id);
			
					$this->load->view('templates/header');
					$this->load->view('users/edit',$data);
					$this->load->view('templates/footer');	        
               	
		}

		//edit profile
		public function update(){

			$data['u_id'] = $this->session->userdata('u_id');
			$u_id = $this->session->userdata('u_id');
			$data['users'] = $this->User_model->get_user_info($u_id);

			$this->form_validation->set_rules('fname','First Name','required');
			$this->form_validation->set_rules('lname','Last Name','required');
			$this->form_validation->set_rules('contact','Contact','required|min_length[10]|max_length[10]');
			$this->form_validation->set_rules('email','Email','valid_email');
			$this->form_validation->set_rules('l_add','Local Address','required');
			$this->form_validation->set_rules('state','State','required');
			$this->form_validation->set_rules('country','Country','required');
			$this->form_validation->set_rules('pincode','Pincode','required');
		//	$this->form_validation->set_rules('username','Username','required|callback_check_username_exists');
			$this->form_validation->set_rules('password','Password','required');

			

			if ($this->form_validation->run() == FALSE)
                {
                	$this->load->view('templates/header');
					$this->load->view('users/edit',$data);
					$this->load->view('templates/footer');	        
                }
                else
                {
                	$user_id = $this->session->userdata('user_id');
                	$enc_pass = md5($this->input->post('password'));
					$this->User_model->updateProfile($enc_pass);
					$this->session->set_flashdata('updated','Profile updated successfully');
					if($user_id == 1)
						redirect('admin');
					elseif($user_id == 2)
						redirect('a_off');
					elseif($user_id == 3)
						redirect('seller/index/'.$user_id);
					elseif($user_id == 4)
						redirect('buyer');	
                }		

			
		}
	}