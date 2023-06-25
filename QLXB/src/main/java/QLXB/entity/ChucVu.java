package QLXB.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name="CHUCVU")
public class ChucVu {
	@Id
	@Column(name="ID")
	private  int id;
	@Column(name="TEN")
	private  String ten;
	
	 @OneToMany(mappedBy = "chucVu", fetch = FetchType.EAGER) 
	  private List<NhanVien> nhanViens;

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public List<NhanVien> getNhanViens() {
		return nhanViens;
	}

	public void setNhanViens(List<NhanVien> nhanViens) {
		this.nhanViens = nhanViens;
	}
	 
	 
}
