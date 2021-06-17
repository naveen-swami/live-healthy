package bean;

import javax.persistence.*;

@Entity
public class User {


	@Id
	private String email;
	private String name;
	private String pass;
	private String mobile;
	private String address;
	//private String etype;
	//private String course;
	private String status;
	private String gender;
	private String height;
	private String weight;
	
	
	public User() {}
	
	
	public User(String email, String name, String pass, String mobile, String address,
			String gender, String height, String weight,String status) 
	{
		this.email = email;
		this.name=name;
		this.pass=pass;
		this.mobile=mobile;
		this.address=address;
		//this.etype=etype;
		//this.course=course;
		
		this.gender=gender;
		this.height=height;
		this.weight=weight;
		this.status=status;
		
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}




	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	

}
