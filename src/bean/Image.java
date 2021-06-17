package bean;

import javax.persistence.*;

@Entity
public class Image {
	

	@Id
	private String name;
	private String type;
	@Column(length = 2000)
	private String descrption;
	private String path;
	private String image;
	private String course;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescrption() {
		return descrption;
	}

	public void setDescrption(String descrption) {
		this.descrption = descrption;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
    
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

     
}


