package QLXB.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="GIAVE")
public class GiaVe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private  int id;
	@Column(name="GIAVEHSSV")
	private  int giaVeHSSV;
	@Column(name="GIAVEBT")
	private  int giaVeBT;
	@Column(name="GIAVETAP")
	private  int giaVeTap;
	@Column(name="LOAIHINH")
	private  String loaiHinh;
	
	 @OneToMany(mappedBy = "giaVe", fetch = FetchType.LAZY) 
	  private List<TuyenDuong> tuyenDuongs;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}





	


	public int getGiaVeBT() {
		return giaVeBT;
	}


	public void setGiaVeBT(int giaVeBT) {
		this.giaVeBT = giaVeBT;
	}


	public int getGiaVeTap() {
		return giaVeTap;
	}


	public void setGiaVeTap(int giaVeTap) {
		this.giaVeTap = giaVeTap;
	}


	public void setGiaVeHSSV(int giaVeHSSV) {
		this.giaVeHSSV = giaVeHSSV;
	}


	public String getLoaiHinh() {
		return loaiHinh;
	}


	public int getGiaVeHSSV() {
		return giaVeHSSV;
	}


	public void setLoaiHinh(String loaiHinh) {
		this.loaiHinh = loaiHinh;
	}


	public List<TuyenDuong> getTuyenDuongs() {
		return tuyenDuongs;
	}


	public void setTuyenDuongs(List<TuyenDuong> tuyenDuongs) {
		this.tuyenDuongs = tuyenDuongs;
	}


	


	}
	
	
	